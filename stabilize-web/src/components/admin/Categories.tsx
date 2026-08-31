"use client";

import { useState } from 'react';
import { Plus, MoreHorizontal, Grid3X3, Wrench, Zap, Droplets, Paintbrush, Search } from 'lucide-react';
import TabBar from '@/components/admin/generics/TabBar';
import Pagination from '@/components/admin/generics/Pagination';
import StatusBadge from '@/components/admin/generics/StatusBadge';
import SearchInput from '@/components/admin/generics/SearchInput';
import Modal from '@/components/admin/generics/Modal';
import ConfirmModal from '@/components/admin/generics/ConfirmModal';
import StatCard from '@/components/admin/generics/StatCard';

const iconMap: Record<string, React.ReactNode> = {
  Plumbing: <Droplets size={20} />, Electrical: <Zap size={20} />, Cleaning: <Paintbrush size={20} />, Carpentry: <Wrench size={20} />,
};

const mainCategories = [
  { id: 1, name: "Plumbing", icon: "Plumbing", description: "Water, drainage & pipe services", artisanCount: 342, subCount: 8, status: "Active" },
  { id: 2, name: "Electrical", icon: "Electrical", description: "Wiring, installations & repairs", artisanCount: 289, subCount: 6, status: "Active" },
  { id: 3, name: "Cleaning", icon: "Cleaning", description: "Deep cleaning, fumigation & laundry", artisanCount: 456, subCount: 10, status: "Active" },
  { id: 4, name: "Carpentry", icon: "Carpentry", description: "Furniture, cabinetry & woodwork", artisanCount: 178, subCount: 5, status: "Draft" },
];

const subCategories = [
  { id: 1, name: "Pipe Fitting", parent: "Plumbing", artisanCount: 120, status: "Active" },
  { id: 2, name: "Leak Repair", parent: "Plumbing", artisanCount: 89, status: "Active" },
  { id: 3, name: "Drain Cleaning", parent: "Plumbing", artisanCount: 67, status: "Active" },
  { id: 4, name: "AC Installation", parent: "Electrical", artisanCount: 145, status: "Active" },
  { id: 5, name: "Wiring", parent: "Electrical", artisanCount: 98, status: "Active" },
  { id: 6, name: "Panel Installation", parent: "Electrical", artisanCount: 46, status: "Draft" },
  { id: 7, name: "Deep Cleaning", parent: "Cleaning", artisanCount: 200, status: "Active" },
  { id: 8, name: "Fumigation", parent: "Cleaning", artisanCount: 134, status: "Active" },
];

const tabs = [{ label: "Main Categories", value: "main" }, { label: "Sub Categories", value: "sub" }];

export default function CategoriesPage() {
  const [activeTab, setActiveTab] = useState('main');
  const [search, setSearch] = useState('');
  const [currentPage, setCurrentPage] = useState(1);
  const itemsPerPage = 10;

  const [addModalOpen, setAddModalOpen] = useState(false);
  const [editItem, setEditItem] = useState<(typeof mainCategories[0]) | null>(null);
  const [deleteItem, setDeleteItem] = useState<{ id: number; name: string } | null>(null);
  const [menuOpen, setMenuOpen] = useState<number | null>(null);

  // Form state
  const [formName, setFormName] = useState('');
  const [formDescription, setFormDescription] = useState('');
  const [formStatus, setFormStatus] = useState('Active');
  const [formParent, setFormParent] = useState('');

  const filteredMain = mainCategories.filter((c) => c.name.toLowerCase().includes(search.toLowerCase()) || c.description.toLowerCase().includes(search.toLowerCase()));
  const filteredSub = subCategories.filter((c) => c.name.toLowerCase().includes(search.toLowerCase()) || c.parent.toLowerCase().includes(search.toLowerCase()));

  const paginatedMain = filteredMain.slice((currentPage - 1) * itemsPerPage, currentPage * itemsPerPage);
  const paginatedSub = filteredSub.slice((currentPage - 1) * itemsPerPage, currentPage * itemsPerPage);

  const handleTabChange = (tab: string) => { setActiveTab(tab); setSearch(''); setCurrentPage(1); };

  const handleEdit = (item: typeof mainCategories[0]) => {
    setEditItem(item);
    setFormName(item.name);
    setFormDescription(item.description);
    setFormStatus(item.status);
    setMenuOpen(null);
  };

  const resetForm = () => { setFormName(''); setFormDescription(''); setFormStatus('Active'); setFormParent(''); };

  return (
    <div className="p-4 md:p-8 max-w-[1400px] mx-auto">
      <div className="flex flex-col md:flex-row justify-between items-start md:items-center mb-10 gap-4">
        <div>
          <h1 className="text-2xl md:text-4xl font-extrabold text-[#191C1D] mb-3 tracking-tight">Service Categories</h1>
          <p className="text-gray-600 text-base max-w-2xl leading-relaxed">Organize the services that power the platform. Manage main and sub-categories for artisan specializations.</p>
        </div>
        <button onClick={() => { resetForm(); setAddModalOpen(true); }} className="flex items-center gap-2 bg-[#006B32] text-white px-6 py-3 text-sm font-bold hover:bg-[#005a2a] transition shadow-sm">
          <Plus size={18} /> Add Category
        </button>
      </div>

      {/* STATS */}
      <div className="grid grid-cols-2 md:grid-cols-4 gap-4 mb-10">
        <StatCard icon={<Grid3X3 size={20} />} iconBg="bg-[#E6F0EB] text-[#006B32]" title="Main Categories" value={String(mainCategories.length)} trend="" trendColor="text-gray-400" />
        <StatCard icon={<Grid3X3 size={20} />} iconBg="bg-[#E6F0EB] text-[#006B32]" title="Sub Categories" value={String(subCategories.length)} trend="" trendColor="text-gray-400" />
        <StatCard icon={<Wrench size={20} />} iconBg="bg-[#FDE8D7] text-[#8A5100]" title="Total Artisans" value="1,265" trend="+5.2%" trendColor="text-[#006B32]" />
        <StatCard icon={<Search size={20} />} iconBg="bg-[#E6F0EB] text-[#006B32]" title="Avg. per Category" value="158" trend="" trendColor="text-gray-400" />
      </div>

      {/* TABS + SEARCH */}
      <div className="flex flex-col md:flex-row justify-between items-start md:items-end mb-8 gap-4">
        <TabBar tabs={tabs} activeTab={activeTab} onTabChange={handleTabChange} />
        <div className="w-full md:w-80">
          <SearchInput placeholder="Search categories..." value={search} onChange={(v) => { setSearch(v); setCurrentPage(1); }} />
        </div>
      </div>

      {/* MAIN CATEGORIES */}
      {activeTab === 'main' && (
        <>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            {paginatedMain.map((cat) => (
              <div key={cat.id} className="bg-white p-6 shadow-sm border border-gray-100 hover:shadow-md transition relative">
                <div className="flex items-start justify-between mb-4">
                  <div className="flex items-center gap-4">
                    <div className="w-12 h-12 bg-[#E6F0EB] flex items-center justify-center text-[#006B32]">{iconMap[cat.icon] || <Grid3X3 size={20} />}</div>
                    <div><h3 className="font-extrabold text-[#191C1D] text-lg">{cat.name}</h3><p className="text-xs text-gray-500">{cat.description}</p></div>
                  </div>
                  <div className="relative">
                    <button onClick={() => setMenuOpen(menuOpen === cat.id ? null : cat.id)} className="w-8 h-8 flex items-center justify-center text-gray-400 hover:text-[#191C1D]"><MoreHorizontal size={18} /></button>
                    {menuOpen === cat.id && (
                      <div className="absolute right-0 top-full mt-1 bg-white border border-gray-200 shadow-lg py-1 z-30 min-w-[140px]">
                        <button onClick={() => handleEdit(cat)} className="w-full text-left px-4 py-2.5 text-sm font-medium hover:bg-gray-50">Edit</button>
                        <button onClick={() => { setDeleteItem({ id: cat.id, name: cat.name }); setMenuOpen(null); }} className="w-full text-left px-4 py-2.5 text-sm font-medium text-red-600 hover:bg-red-50">Delete</button>
                      </div>
                    )}
                  </div>
                </div>
                <div className="flex items-center gap-4 mb-4">
                  <div className="text-sm"><span className="font-bold text-[#191C1D]">{cat.artisanCount}</span> <span className="text-gray-400">artisans</span></div>
                  <div className="text-sm"><span className="font-bold text-[#191C1D]">{cat.subCount}</span> <span className="text-gray-400">sub-categories</span></div>
                </div>
                <StatusBadge status={cat.status} />
              </div>
            ))}
          </div>
          {paginatedMain.length === 0 && <div className="text-center py-10 text-gray-400 font-medium">No categories match your search.</div>}
          <div className="mt-8"><Pagination currentPage={currentPage} totalItems={filteredMain.length} itemsPerPage={itemsPerPage} onPageChange={setCurrentPage} itemLabel="categories" /></div>
        </>
      )}

      {/* SUB CATEGORIES */}
      {activeTab === 'sub' && (
        <div className="bg-white shadow-sm border border-gray-100 overflow-hidden">
          <div className="overflow-x-auto">
            <table className="w-full min-w-[700px] text-left border-collapse">
              <thead>
                <tr className="bg-gray-50/50 text-[10px] font-extrabold text-gray-400 uppercase tracking-widest border-b border-gray-100">
                  <th className="p-5 pl-6">Name</th>
                  <th className="p-5">Parent</th>
                  <th className="p-5">Artisans</th>
                  <th className="p-5">Status</th>
                  <th className="p-5 pr-6 text-right">Actions</th>
                </tr>
              </thead>
              <tbody className="text-sm">
                {paginatedSub.map((sub) => (
                  <tr key={sub.id} className="border-b border-gray-50 hover:bg-gray-50/50 transition">
                    <td className="p-5 pl-6"><p className="font-bold text-[#191C1D] text-sm">{sub.name}</p></td>
                    <td className="p-5"><span className="bg-gray-100 text-gray-600 px-3 py-1 text-xs font-bold">{sub.parent}</span></td>
                    <td className="p-5"><p className="text-sm text-[#191C1D] font-medium">{sub.artisanCount}</p></td>
                    <td className="p-5"><StatusBadge status={sub.status} /></td>
                    <td className="p-5 pr-6">
                      <div className="flex justify-end">
                        <div className="relative">
                          <button onClick={() => setMenuOpen(menuOpen === sub.id + 100 ? null : sub.id + 100)} className="w-8 h-8 flex items-center justify-center text-gray-400 hover:text-[#191C1D]"><MoreHorizontal size={18} /></button>
                          {menuOpen === sub.id + 100 && (
                            <div className="absolute right-0 top-full mt-1 bg-white border border-gray-200 shadow-lg py-1 z-30 min-w-[140px]">
                              <button onClick={() => setMenuOpen(null)} className="w-full text-left px-4 py-2.5 text-sm font-medium hover:bg-gray-50">Edit</button>
                              <button onClick={() => { setDeleteItem({ id: sub.id, name: sub.name }); setMenuOpen(null); }} className="w-full text-left px-4 py-2.5 text-sm font-medium text-red-600 hover:bg-red-50">Delete</button>
                            </div>
                          )}
                        </div>
                      </div>
                    </td>
                  </tr>
                ))}
                {paginatedSub.length === 0 && <tr><td colSpan={5} className="p-10 text-center text-gray-400 font-medium">No sub-categories match your search.</td></tr>}
              </tbody>
            </table>
          </div>
          <div className="mt-8"><Pagination currentPage={currentPage} totalItems={filteredSub.length} itemsPerPage={itemsPerPage} onPageChange={setCurrentPage} itemLabel="sub-categories" /></div>
        </div>
      )}

      {/* ADD CATEGORY MODAL */}
      <Modal isOpen={addModalOpen} onClose={() => setAddModalOpen(false)} title={activeTab === 'main' ? "Add Main Category" : "Add Sub Category"} size="md">
        <div className="space-y-5">
          <div><label className="block text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-2">Name</label><input type="text" value={formName} onChange={(e) => setFormName(e.target.value)} placeholder="Category name" className="w-full border border-gray-200 px-4 py-3 text-sm focus:outline-none focus:border-[#006B32]" /></div>
          {activeTab === 'sub' && (
            <div><label className="block text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-2">Parent Category</label>
              <select value={formParent} onChange={(e) => setFormParent(e.target.value)} className="w-full border border-gray-200 px-4 py-3 text-sm focus:outline-none focus:border-[#006B32] bg-white">
                <option value="">Select parent...</option>
                {mainCategories.map((c) => <option key={c.id} value={c.name}>{c.name}</option>)}
              </select>
            </div>
          )}
          <div><label className="block text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-2">Description</label><textarea value={formDescription} onChange={(e) => setFormDescription(e.target.value)} placeholder="Brief description..." className="w-full border border-gray-200 px-4 py-3 text-sm focus:outline-none focus:border-[#006B32] resize-none h-24" /></div>
          <div><label className="block text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-2">Status</label>
            <div className="flex gap-3">
              <button onClick={() => setFormStatus('Active')} className={`px-5 py-2.5 text-sm font-bold transition ${formStatus === 'Active' ? 'bg-[#006B32] text-white' : 'bg-gray-100 text-gray-600 hover:bg-gray-200'}`}>Active</button>
              <button onClick={() => setFormStatus('Draft')} className={`px-5 py-2.5 text-sm font-bold transition ${formStatus === 'Draft' ? 'bg-gray-600 text-white' : 'bg-gray-100 text-gray-600 hover:bg-gray-200'}`}>Draft</button>
            </div>
          </div>
          <button onClick={() => { setAddModalOpen(false); resetForm(); }} className="w-full bg-[#006B32] text-white py-3 text-sm font-bold hover:bg-[#005a2a] transition mt-4">Create Category</button>
        </div>
      </Modal>

      {/* EDIT CATEGORY MODAL */}
      <Modal isOpen={!!editItem} onClose={() => setEditItem(null)} title="Edit Category" size="md">
        <div className="space-y-5">
          <div><label className="block text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-2">Name</label><input type="text" value={formName} onChange={(e) => setFormName(e.target.value)} className="w-full border border-gray-200 px-4 py-3 text-sm focus:outline-none focus:border-[#006B32]" /></div>
          <div><label className="block text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-2">Description</label><textarea value={formDescription} onChange={(e) => setFormDescription(e.target.value)} className="w-full border border-gray-200 px-4 py-3 text-sm focus:outline-none focus:border-[#006B32] resize-none h-24" /></div>
          <div><label className="block text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-2">Status</label>
            <div className="flex gap-3">
              <button onClick={() => setFormStatus('Active')} className={`px-5 py-2.5 text-sm font-bold transition ${formStatus === 'Active' ? 'bg-[#006B32] text-white' : 'bg-gray-100 text-gray-600 hover:bg-gray-200'}`}>Active</button>
              <button onClick={() => setFormStatus('Draft')} className={`px-5 py-2.5 text-sm font-bold transition ${formStatus === 'Draft' ? 'bg-gray-600 text-white' : 'bg-gray-100 text-gray-600 hover:bg-gray-200'}`}>Draft</button>
            </div>
          </div>
          <button onClick={() => setEditItem(null)} className="w-full bg-[#006B32] text-white py-3 text-sm font-bold hover:bg-[#005a2a] transition mt-4">Save Changes</button>
        </div>
      </Modal>

      {/* DELETE CONFIRM */}
      <ConfirmModal isOpen={!!deleteItem} onClose={() => setDeleteItem(null)} onConfirm={() => setDeleteItem(null)} title="Delete Category" message={`Are you sure you want to delete "${deleteItem?.name}"? This action cannot be undone and will affect all artisans under this category.`} confirmLabel="Delete" variant="danger" />
    </div>
  );
}

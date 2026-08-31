"use client";

import { useState } from 'react';
import { MapPin, Star, Eye, MoreVertical, User, Filter } from 'lucide-react';
import Pagination from '@/components/admin/generics/Pagination';
import StatusBadge from '@/components/admin/generics/StatusBadge';
import FilterDropdown from '@/components/admin/generics/FilterDropdown';
import ExportButton from '@/components/admin/generics/ExportButton';
import Modal from '@/components/admin/generics/Modal';
import ConfirmModal from '@/components/admin/generics/ConfirmModal';

const artisansData = [
  { id: 1, name: "Ahmed the Plumber", location: "Lagos, Ikeja", city: "Lagos", services: ["Pipe Fitting", "Leak Repair"], rating: "4.8", ratingNum: 4.8, status: "Active", actionType: "standard" },
  { id: 2, name: "Chioma Electronics", location: "Abuja, Garki", city: "Abuja", services: ["AC Installation"], rating: "New", ratingNum: 0, status: "Pending Approval", actionType: "approval" },
  { id: 3, name: "Grace Furniture", location: "Port Harcourt", city: "Port Harcourt", services: ["Carpentry", "Cabinetry"], rating: "4.9", ratingNum: 4.9, status: "Active", actionType: "standard" },
  { id: 4, name: "Tunde Mechanic", location: "Lagos, Surulere", city: "Lagos", services: ["Auto Repair"], rating: "3.2", ratingNum: 3.2, status: "Suspended", actionType: "suspended" },
  { id: 5, name: "Bola Electricals", location: "Enugu, GRA", city: "Enugu", services: ["Wiring", "Panel Installation"], rating: "4.5", ratingNum: 4.5, status: "Active", actionType: "standard" },
  { id: 6, name: "Kemi's Cleaning", location: "Abuja, Maitama", city: "Abuja", services: ["Deep Cleaning", "Fumigation"], rating: "4.7", ratingNum: 4.7, status: "Active", actionType: "standard" },
];

const cityOptions = [{ label: "All Cities", value: "all" }, { label: "Lagos", value: "Lagos" }, { label: "Abuja", value: "Abuja" }, { label: "Port Harcourt", value: "Port Harcourt" }, { label: "Enugu", value: "Enugu" }];
const statusOptions = [{ label: "All", value: "all" }, { label: "Active", value: "Active" }, { label: "Pending Approval", value: "Pending Approval" }, { label: "Suspended", value: "Suspended" }];
const ratingOptions = [{ label: "Any", value: "any" }, { label: "4.5+", value: "4.5" }, { label: "4.0+", value: "4.0" }, { label: "3.0+", value: "3.0" }];

export default function ArtisanManagementPage() {
  const [cityFilter, setCityFilter] = useState('all');
  const [statusFilter, setStatusFilter] = useState('all');
  const [ratingFilter, setRatingFilter] = useState('any');
  const [currentPage, setCurrentPage] = useState(1);
  const itemsPerPage = 10;

  const [viewArtisan, setViewArtisan] = useState<typeof artisansData[0] | null>(null);
  const [approveArtisan, setApproveArtisan] = useState<typeof artisansData[0] | null>(null);
  const [rejectArtisan, setRejectArtisan] = useState<typeof artisansData[0] | null>(null);
  const [liftArtisan, setLiftArtisan] = useState<typeof artisansData[0] | null>(null);
  const [rejectReason, setRejectReason] = useState('');
  const [menuOpen, setMenuOpen] = useState<number | null>(null);
  const [exportModalOpen, setExportModalOpen] = useState(false);

  const filtered = artisansData.filter((a) => {
    if (cityFilter !== 'all' && a.city !== cityFilter) return false;
    if (statusFilter !== 'all' && a.status !== statusFilter) return false;
    if (ratingFilter !== 'any' && a.ratingNum < parseFloat(ratingFilter)) return false;
    return true;
  });
  const paginated = filtered.slice((currentPage - 1) * itemsPerPage, currentPage * itemsPerPage);

  return (
    <div className="p-4 md:p-8 max-w-[1400px] mx-auto">
      {/* HEADER */}
      <div className="mb-10">
        <h1 className="text-2xl md:text-4xl font-extrabold text-[#191C1D] mb-3 tracking-tight">Artisan Directory</h1>
        <p className="text-gray-600 text-base max-w-2xl leading-relaxed">Curating Nigeria&apos;s finest talent. Manage, verify, and monitor the skilled professionals keeping our cities functional.</p>
      </div>

      {/* FILTER BAR */}
      <div className="flex flex-col md:flex-row justify-between items-start md:items-center mb-10 gap-4">
        <div className="flex flex-wrap items-center gap-3">
          <div className="flex items-center gap-2 px-4 py-2.5 bg-white border border-gray-200 text-sm font-bold text-[#006B32] shadow-sm"><Filter size={16} /> Filters:</div>
          <FilterDropdown label="All Cities" options={cityOptions} value={cityFilter} onChange={(v) => { setCityFilter(v); setCurrentPage(1); }} />
          <FilterDropdown label="Status" options={statusOptions} value={statusFilter} onChange={(v) => { setStatusFilter(v); setCurrentPage(1); }} />
          <FilterDropdown label="Rating" options={ratingOptions} value={ratingFilter} onChange={(v) => { setRatingFilter(v); setCurrentPage(1); }} />
        </div>
        <ExportButton label="Export Directory" onClick={() => setExportModalOpen(true)} variant="primary" />
      </div>

      {/* DIRECTORY TABLE */}
      <div className="bg-white shadow-sm border border-gray-100 mb-8 overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full min-w-[900px] text-left border-collapse">
            <thead>
              <tr className="bg-gray-50/50 text-[10px] font-extrabold text-gray-400 uppercase tracking-widest border-b border-gray-100">
                <th className="p-5 pl-6">Artisan Identity</th>
                <th className="p-5">Primary Services</th>
                <th className="p-5">Rating</th>
                <th className="p-5">Verification</th>
                <th className="p-5 pr-6 text-right">Actions</th>
              </tr>
            </thead>
            <tbody className="text-sm">
              {paginated.map((artisan) => (
                <tr key={artisan.id} className={`border-b border-gray-50 hover:bg-gray-50/50 transition ${artisan.status === 'Pending Approval' ? 'border-l-4 border-l-[#8A5100]' : ''} ${artisan.status === 'Suspended' ? 'opacity-80' : ''}`}>
                  <td className="p-5 pl-6">
                    <div className="flex items-center gap-4">
                      <div className="w-12 h-12 bg-gray-100 flex items-center justify-center flex-shrink-0 border border-gray-200">
                        <User size={20} className="text-gray-400" />
                      </div>
                      <div>
                        <h3 className="font-extrabold text-[#191C1D] text-base leading-tight mb-1">{artisan.name}</h3>
                        <p className="text-xs text-gray-500 flex items-center gap-1"><MapPin size={12} /> {artisan.location}</p>
                      </div>
                    </div>
                  </td>
                  <td className="p-5">
                    <div className="flex flex-wrap gap-2">
                      {artisan.services.map((s, i) => (
                        <span key={i} className={`px-3 py-1 text-[10px] font-extrabold tracking-wide ${artisan.status === 'Active' ? 'bg-[#E6F0EB] text-[#006B32]' : 'bg-gray-100 text-gray-600'}`}>{s}</span>
                      ))}
                    </div>
                  </td>
                  <td className="p-5">
                    <div className="flex items-center gap-1">
                      {artisan.rating !== "New" && <Star size={14} className="text-[#8A5100]" fill="currentColor" />}
                      <span className={`font-bold text-sm ${artisan.rating === 'New' ? 'text-gray-400 italic' : 'text-[#191C1D]'}`}>{artisan.rating}</span>
                    </div>
                  </td>
                  <td className="p-5"><StatusBadge status={artisan.status} variant="dot" /></td>
                  <td className="p-5 pr-6">
                    <div className="flex items-center justify-end gap-3">
                      {artisan.actionType === "standard" && (
                        <>
                          <button onClick={() => setViewArtisan(artisan)} className="w-8 h-8 flex items-center justify-center text-[#191C1D] bg-gray-50 hover:bg-gray-100 transition"><Eye size={16} /></button>
                          <div className="relative">
                            <button onClick={() => setMenuOpen(menuOpen === artisan.id ? null : artisan.id)} className="w-8 h-8 flex items-center justify-center text-gray-400 hover:text-[#191C1D] transition"><MoreVertical size={18} /></button>
                            {menuOpen === artisan.id && (
                              <div className="absolute right-0 top-full mt-1 bg-white border border-gray-200 shadow-lg py-1 z-30 min-w-[150px]">
                                <button onClick={() => { setViewArtisan(artisan); setMenuOpen(null); }} className="w-full text-left px-4 py-2.5 text-sm font-medium hover:bg-gray-50">View Profile</button>
                                <button onClick={() => { setSuspendArtisanAction(); setMenuOpen(null); }} className="w-full text-left px-4 py-2.5 text-sm font-medium text-red-600 hover:bg-red-50">Suspend</button>
                              </div>
                            )}
                          </div>
                        </>
                      )}
                      {artisan.actionType === "approval" && (
                        <div className="flex gap-2">
                          <button onClick={() => setApproveArtisan(artisan)} className="bg-[#006B32] text-white px-4 py-1.5 text-xs font-bold hover:bg-[#005a2a] transition shadow-sm">Approve</button>
                          <button onClick={() => setRejectArtisan(artisan)} className="bg-red-50 text-red-600 px-4 py-1.5 text-xs font-bold hover:bg-red-100 transition border border-red-100">Reject</button>
                        </div>
                      )}
                      {artisan.actionType === "suspended" && (
                        <button onClick={() => setLiftArtisan(artisan)} className="bg-gray-100 text-gray-600 px-4 py-1.5 text-xs font-bold hover:bg-gray-200 transition">Lift Suspension</button>
                      )}
                    </div>
                  </td>
                </tr>
              ))}
              {paginated.length === 0 && <tr><td colSpan={5} className="p-10 text-center text-gray-400 font-medium">No artisans match the current filters.</td></tr>}
            </tbody>
          </table>
        </div>
      </div>

      {/* PAGINATION */}
      <div className="mt-8">
        <Pagination currentPage={currentPage} totalItems={filtered.length} itemsPerPage={itemsPerPage} onPageChange={setCurrentPage} itemLabel="registered artisans" variant="round" />
      </div>

      {/* MODALS */}
      <Modal isOpen={!!viewArtisan} onClose={() => setViewArtisan(null)} title="Artisan Profile" size="lg">
        {viewArtisan && (
          <div className="space-y-6">
            <div className="flex items-center gap-4">
              <div className="w-16 h-16 bg-gray-100 flex items-center justify-center"><User size={28} className="text-gray-400" /></div>
              <div><p className="text-xl font-extrabold text-[#191C1D]">{viewArtisan.name}</p><p className="text-sm text-gray-500 flex items-center gap-1"><MapPin size={14} /> {viewArtisan.location}</p></div>
            </div>
            <div className="grid grid-cols-2 gap-4">
              <div className="bg-[#F8F9FA] p-4 border border-gray-100"><p className="text-[9px] font-bold text-gray-400 uppercase tracking-widest mb-1">Rating</p><p className="font-bold text-[#191C1D] text-sm flex items-center gap-1">{viewArtisan.rating !== 'New' && <Star size={14} className="text-[#8A5100]" fill="currentColor" />}{viewArtisan.rating}</p></div>
              <div className="bg-[#F8F9FA] p-4 border border-gray-100"><p className="text-[9px] font-bold text-gray-400 uppercase tracking-widest mb-1">Status</p><p className="font-bold text-[#191C1D] text-sm">{viewArtisan.status}</p></div>
              <div className="bg-[#F8F9FA] p-4 border border-gray-100 col-span-2"><p className="text-[9px] font-bold text-gray-400 uppercase tracking-widest mb-1">Services</p><div className="flex flex-wrap gap-2 mt-1">{viewArtisan.services.map((s,i) => <span key={i} className="bg-[#E6F0EB] text-[#006B32] px-3 py-1 text-xs font-bold">{s}</span>)}</div></div>
            </div>
            <div><p className="text-[10px] font-extrabold text-gray-400 uppercase tracking-widest mb-3">Recent Bookings</p>
              <div className="space-y-3">
                <div className="flex items-start gap-3 text-sm"><div className="w-2 h-2 rounded-full bg-[#006B32] mt-1.5 flex-shrink-0" /><div><p className="text-[#191C1D] font-medium">Completed kitchen pipe repair for Chidi O.</p><p className="text-xs text-gray-400">2 days ago</p></div></div>
                <div className="flex items-start gap-3 text-sm"><div className="w-2 h-2 rounded-full bg-[#006B32] mt-1.5 flex-shrink-0" /><div><p className="text-[#191C1D] font-medium">Scheduled AC maintenance at Maitama</p><p className="text-xs text-gray-400">5 days ago</p></div></div>
              </div>
            </div>
          </div>
        )}
      </Modal>

      <ConfirmModal isOpen={!!approveArtisan} onClose={() => setApproveArtisan(null)} onConfirm={() => setApproveArtisan(null)} title="Approve Artisan" message={`Approve ${approveArtisan?.name} for verification? They will be listed as an active artisan on the platform.`} confirmLabel="Approve" variant="success" />
      <ConfirmModal isOpen={!!rejectArtisan} onClose={() => { setRejectArtisan(null); setRejectReason(''); }} onConfirm={() => setRejectArtisan(null)} title="Reject Artisan" message={`Are you sure you want to reject ${rejectArtisan?.name}? Please provide a reason.`} confirmLabel="Reject Application" variant="danger">
        <div><label className="block text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-2">Reason</label><textarea value={rejectReason} onChange={(e) => setRejectReason(e.target.value)} placeholder="Reason for rejection..." className="w-full border border-gray-200 px-4 py-3 text-sm focus:outline-none focus:border-[#006B32] resize-none h-24" /></div>
      </ConfirmModal>
      <ConfirmModal isOpen={!!liftArtisan} onClose={() => setLiftArtisan(null)} onConfirm={() => setLiftArtisan(null)} title="Lift Suspension" message={`Are you sure you want to lift the suspension on ${liftArtisan?.name}? They will regain full access.`} confirmLabel="Lift Suspension" variant="success" />

      <Modal isOpen={exportModalOpen} onClose={() => setExportModalOpen(false)} title="Export Directory" size="sm">
        <p className="text-sm text-gray-600 mb-6">Choose a format to export the artisan directory.</p>
        <div className="space-y-3">
          <button onClick={() => setExportModalOpen(false)} className="w-full text-left p-4 border border-gray-200 hover:bg-gray-50 transition"><p className="font-bold text-[#191C1D] text-sm">CSV File (.csv)</p><p className="text-xs text-gray-500">Spreadsheet-compatible format</p></button>
          <button onClick={() => setExportModalOpen(false)} className="w-full text-left p-4 border border-gray-200 hover:bg-gray-50 transition"><p className="font-bold text-[#191C1D] text-sm">PDF Report (.pdf)</p><p className="text-xs text-gray-500">Formatted report for printing</p></button>
        </div>
      </Modal>
    </div>
  );
}

function setSuspendArtisanAction() {
  // placeholder — suspend flow reuses ConfirmModal pattern
}

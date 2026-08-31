"use client";

import { useState } from 'react';
import {
  UserPlus, Shield, Users, History,
  Lock, MoreVertical, ShieldCheck, User, Info, ShieldAlert
} from 'lucide-react';
import SearchInput from '@/components/admin/generics/SearchInput';
import Pagination from '@/components/admin/generics/Pagination';
import ExportButton from '@/components/admin/generics/ExportButton';
import Modal from '@/components/admin/generics/Modal';
import ConfirmModal from '@/components/admin/generics/ConfirmModal';

export default function AdminManagementPage() {
  // --- STATE ---
  const [search, setSearch] = useState('');
  const [currentPage, setCurrentPage] = useState(1);
  const [menuOpen, setMenuOpen] = useState<number | null>(null);
  const [addModalOpen, setAddModalOpen] = useState(false);
  const [viewAdmin, setViewAdmin] = useState<typeof adminsData[number] | null>(null);
  const [suspendAdmin, setSuspendAdmin] = useState<typeof adminsData[number] | null>(null);
  const [reinstateAdmin, setReinstateAdmin] = useState<typeof adminsData[number] | null>(null);
  const [exportModalOpen, setExportModalOpen] = useState(false);
  const [formName, setFormName] = useState('');
  const [formEmail, setFormEmail] = useState('');
  const [formRole, setFormRole] = useState('STANDARD');
  const itemsPerPage = 10;
  // --- MOCK DATA ---
  const adminsData = [
    {
      name: "Chidi Azikiwe", email: "chidi.a@stabilize.ng",
      role: "SUPER ADMIN", roleIcon: ShieldCheck, roleBg: "bg-[#006B32]", roleText: "text-white",
      cities: ["Lagos", "Abuja"], extraCities: "+12 others",
      status: "Active", lastLogin: "12m ago", statusColor: "bg-[#006B32]",
      dateAdded: "Oct 12, 2023",
      avatar: "/images/admin/avatar1.jpg", suspended: false
    },
    {
      name: "Amara Okafor", email: "amara.o@stabilize.ng",
      role: "STANDARD", roleIcon: User, roleBg: "bg-gray-100", roleText: "text-gray-600",
      cities: ["Port Harcourt", "Enugu"], extraCities: "",
      status: "Active", lastLogin: "2h ago", statusColor: "bg-[#006B32]",
      dateAdded: "Jan 05, 2024",
      avatar: "/images/admin/avatar2.jpg", suspended: false
    },
    {
      name: "Bashir Usman", email: "bashir.u@stabilize.ng",
      role: "STANDARD", roleIcon: User, roleBg: "bg-gray-100", roleText: "text-gray-600",
      cities: ["Kano"], extraCities: "",
      status: "Suspended", lastLogin: "Action req. by Super Admin", statusColor: "bg-gray-300",
      dateAdded: "Nov 22, 2023",
      avatar: "/images/admin/avatar3.jpg", suspended: true
    },
    {
      name: "Efetobore Oghenekaro", email: "efe.o@stabilize.ng",
      role: "SUPER ADMIN", roleIcon: ShieldCheck, roleBg: "bg-[#006B32]", roleText: "text-white",
      cities: ["Warri", "Asaba"], extraCities: "",
      status: "Active", lastLogin: "Yesterday", statusColor: "bg-[#006B32]",
      dateAdded: "Dec 18, 2023",
      avatar: "/images/admin/avatar4.jpg", suspended: false
    },
  ];

  const filtered = adminsData.filter((a) =>
    a.name.toLowerCase().includes(search.toLowerCase()) || a.email.toLowerCase().includes(search.toLowerCase())
  );
  const paginated = filtered.slice((currentPage - 1) * itemsPerPage, currentPage * itemsPerPage);

  return (
    <div className="p-4 md:p-8">

      {/* =========================================
          1. PAGE HEADER
          ========================================= */}
      <div className="flex flex-col md:flex-row justify-between items-start md:items-center mb-8 gap-4">
        <div>
          <h1 className="text-2xl md:text-3xl font-extrabold text-[#191C1D]">Admin Personnel</h1>
          <p className="text-sm text-gray-500 mt-1">Manage platform access control and administrative hierarchies.</p>
        </div>

        <div className="flex items-center gap-4 w-full md:w-auto">
          <div className="flex-1 md:w-64">
            <SearchInput placeholder="Search by name or email..." value={search} onChange={(v) => { setSearch(v); setCurrentPage(1); }} />
          </div>
          <button onClick={() => { setFormName(''); setFormEmail(''); setFormRole('STANDARD'); setAddModalOpen(true); }} className="bg-[#006B32] text-white px-5 py-3 font-bold flex items-center gap-2 hover:bg-[#005a2a] transition shadow-sm whitespace-nowrap">
            <UserPlus size={18} /> Add New Admin
          </button>
        </div>
      </div>

      {/* =========================================
          2. STAT CARDS
          ========================================= */}
      <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
        {/* Super Admins */}
        <div className="bg-white p-6 shadow-sm border border-gray-100 flex flex-col justify-between min-h-[140px]">
          <div className="flex justify-between items-start mb-4">
            <div className="w-10 h-10 bg-[#E6F0EB] flex items-center justify-center text-[#006B32]">
              <Shield size={20} />
            </div>
            <span className="text-[10px] font-bold text-[#006B32] bg-[#E6F0EB] px-2.5 py-1 uppercase tracking-wider">
              Active Now
            </span>
          </div>
          <div>
            <p className="text-3xl font-extrabold text-[#191C1D]">12</p>
            <p className="text-xs text-gray-500 font-medium">Total Super Admins</p>
          </div>
        </div>

        {/* Standard Admins */}
        <div className="bg-white p-6 shadow-sm border border-gray-100 flex flex-col justify-between min-h-[140px]">
          <div className="flex justify-between items-start mb-4">
            <div className="w-10 h-10 bg-[#FDE8D7] flex items-center justify-center text-[#8A5100]">
              <Users size={20} />
            </div>
            <span className="text-[10px] font-bold text-[#8A5100] bg-[#FDE8D7] px-2.5 py-1 uppercase tracking-wider">
              +2 This Month
            </span>
          </div>
          <div>
            <p className="text-3xl font-extrabold text-[#191C1D]">48</p>
            <p className="text-xs text-gray-500 font-medium">Standard Admin Personnel</p>
          </div>
        </div>

        {/* Security Logs */}
        <div className="bg-white p-6 shadow-sm border border-gray-100 flex flex-col justify-between min-h-[140px] relative overflow-hidden">
          <Lock size={100} className="absolute -right-6 -bottom-6 text-gray-50 stroke-1 pointer-events-none" />
          <div className="flex justify-between items-start mb-4 relative z-10">
            <div className="w-10 h-10 bg-red-50 flex items-center justify-center text-red-600">
              <History size={20} />
            </div>
          </div>
          <div className="relative z-10">
            <p className="text-3xl font-extrabold text-[#191C1D]">104</p>
            <p className="text-xs text-gray-500 font-medium">Security Audit Logs (24h)</p>
          </div>
        </div>
      </div>

      {/* =========================================
          3. ADMINISTRATORS TABLE
          ========================================= */}
      <div className="bg-white shadow-sm border border-gray-100 mb-8 overflow-hidden">
        {/* Table Header */}
        <div className="p-6 border-b border-gray-100 flex items-center justify-between">
          <h3 className="text-xl font-extrabold text-[#191C1D]">All Administrators</h3>
          <div className="flex items-center gap-6">
            <ExportButton label="Export CSV" onClick={() => setExportModalOpen(true)} variant="secondary" />
          </div>
        </div>

        {/* Table */}
        <div className="overflow-x-auto">
          <table className="w-full text-left border-collapse">
            <thead>
              <tr className="bg-gray-50/50 text-[10px] font-bold text-gray-400 uppercase tracking-widest border-b border-gray-100">
                <th className="p-4 pl-6">Administrator</th>
                <th className="p-4">Role</th>
                <th className="p-4">Assigned Cities</th>
                <th className="p-4">Status</th>
                <th className="p-4">Date Added</th>
                <th className="p-4 pr-6 text-center">Actions</th>
              </tr>
            </thead>
            <tbody className="text-sm">
              {paginated.map((admin, index) => {
                const RoleIcon = admin.roleIcon;
                return (
                  <tr key={index} className={`border-b border-gray-50 hover:bg-gray-50/50 transition ${admin.suspended ? 'opacity-60' : ''}`}>

                    {/* User Info */}
                    <td className="p-4 pl-6">
                      <div className="flex items-center gap-3">
                        <div className="w-10 h-10 overflow-hidden bg-gray-200 border border-gray-100 flex-shrink-0">
                          {/* Placeholder fallback */}
                          <div className="w-full h-full bg-gray-300"></div>
                          {/* <Image src={admin.avatar} alt={admin.name} width={40} height={40} className="object-cover" /> */}
                        </div>
                        <div>
                          <p className="font-extrabold text-[#191C1D] leading-tight">{admin.name}</p>
                          <p className="text-[11px] text-gray-500">{admin.email}</p>
                        </div>
                      </div>
                    </td>

                    {/* Role Pill */}
                    <td className="p-4">
                      <div className={`inline-flex items-center gap-1.5 px-3 py-1.5 text-[10px] font-extrabold uppercase tracking-wider ${admin.roleBg} ${admin.roleText}`}>
                        <RoleIcon size={12} /> {admin.role}
                      </div>
                    </td>

                    {/* Cities List */}
                    <td className="p-4">
                      <div className="flex flex-wrap gap-1.5 max-w-[200px]">
                        {admin.cities.map((city, i) => (
                          <span key={i} className="bg-gray-100 text-gray-600 text-[10px] font-bold px-2 py-1">
                            {city}
                          </span>
                        ))}
                        {admin.extraCities && (
                          <span className="bg-gray-100 text-gray-500 text-[10px] font-bold px-2 py-1">
                            {admin.extraCities}
                          </span>
                        )}
                      </div>
                    </td>

                    {/* Status & Last Login */}
                    <td className="p-4">
                      <div className="flex items-center gap-1.5 mb-0.5">
                        <span className={`w-2 h-2 ${admin.statusColor}`}></span>
                        <span className={`font-bold text-xs ${admin.suspended ? 'text-gray-500' : 'text-[#191C1D]'}`}>
                          {admin.status}
                        </span>
                      </div>
                      <p className="text-[10px] text-gray-500">
                        {admin.suspended ? admin.lastLogin : `Last login: ${admin.lastLogin}`}
                      </p>
                    </td>

                    {/* Date */}
                    <td className="p-4">
                      <p className="font-semibold text-[#191C1D] text-sm leading-tight">
                        {admin.dateAdded.split(', ')[0]}<br/>
                        <span className="text-gray-500 text-xs font-normal">{admin.dateAdded.split(', ')[1]}</span>
                      </p>
                    </td>

                    {/* Actions */}
                    <td className="p-4 pr-6 text-center text-gray-400">
                      <div className="relative inline-block">
                        <button onClick={() => setMenuOpen(menuOpen === index ? null : index)} className="p-2 hover:bg-gray-100 transition hover:text-[#191C1D]">
                          <MoreVertical size={18} />
                        </button>
                        {menuOpen === index && (
                          <div className="absolute right-0 top-full mt-1 bg-white border border-gray-200 shadow-lg py-1 z-30 min-w-[150px]">
                            <button onClick={() => { setViewAdmin(admin); setMenuOpen(null); }} className="w-full text-left px-4 py-2.5 text-sm font-medium hover:bg-gray-50">View Profile</button>
                            {!admin.suspended ? (
                              <button onClick={() => { setSuspendAdmin(admin); setMenuOpen(null); }} className="w-full text-left px-4 py-2.5 text-sm font-medium text-red-600 hover:bg-red-50">Suspend</button>
                            ) : (
                              <button onClick={() => { setReinstateAdmin(admin); setMenuOpen(null); }} className="w-full text-left px-4 py-2.5 text-sm font-medium text-[#006B32] hover:bg-[#E6F0EB]">Reinstate</button>
                            )}
                          </div>
                        )}
                      </div>
                    </td>
                  </tr>
                );
              })}
            </tbody>
          </table>
        </div>

        {/* Pagination */}
        <div className="p-4 border-t border-gray-100">
          <Pagination currentPage={currentPage} totalItems={filtered.length} itemsPerPage={itemsPerPage} onPageChange={setCurrentPage} itemLabel="Admin Accounts" />
        </div>
      </div>

      {/* =========================================
          4. BOTTOM INFO SECTION
          ========================================= */}
      <div className="grid grid-cols-1 md:grid-cols-2 gap-6">

        {/* Hierarchy Note */}
        <div className="bg-[#FDF9F1] border border-[#FDE8D7] p-6 shadow-sm">
          <div className="flex items-center gap-2 mb-3 text-[#8A5100]">
            <Info size={18} />
            <h4 className="font-extrabold text-sm">Access Permission Hierarchy</h4>
          </div>
          <p className="text-xs text-gray-700 leading-relaxed">
            <span className="font-bold text-[#191C1D]">Super Admins</span> have full system control, including managing other admin accounts and financial settings. <span className="font-bold text-[#191C1D]">Standard Admins</span> are limited to artisan management, enquiry responses, and city-specific logistics.
          </p>
        </div>

        {/* Security Note */}
        <div className="bg-[#FDF9F1] border border-[#FDE8D7] p-6 shadow-sm">
          <div className="flex items-center gap-2 mb-3 text-[#8A5100]">
            <ShieldAlert size={18} />
            <h4 className="font-extrabold text-sm">Security Protocol</h4>
          </div>
          <p className="text-xs text-gray-700 leading-relaxed">
            All administrative actions are logged in the <span className="font-bold text-[#191C1D]">Audit Logs</span>. Session expiration is set to <span className="font-bold text-[#191C1D]">30 minutes</span> of inactivity for enhanced platform security.
          </p>
        </div>

      </div>

      {/* MODALS */}
      <Modal isOpen={addModalOpen} onClose={() => setAddModalOpen(false)} title="Add New Admin" size="md">
        <div className="space-y-5">
          <div><label className="block text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-2">Full Name</label><input type="text" value={formName} onChange={(e) => setFormName(e.target.value)} placeholder="Admin name" className="w-full border border-gray-200 px-4 py-3 text-sm focus:outline-none focus:border-[#006B32]" /></div>
          <div><label className="block text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-2">Email Address</label><input type="email" value={formEmail} onChange={(e) => setFormEmail(e.target.value)} placeholder="admin@stabilize.ng" className="w-full border border-gray-200 px-4 py-3 text-sm focus:outline-none focus:border-[#006B32]" /></div>
          <div><label className="block text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-2">Role</label>
            <div className="flex gap-3">
              <button onClick={() => setFormRole('STANDARD')} className={`px-5 py-2.5 text-sm font-bold transition ${formRole === 'STANDARD' ? 'bg-gray-600 text-white' : 'bg-gray-100 text-gray-600 hover:bg-gray-200'}`}>Standard</button>
              <button onClick={() => setFormRole('SUPER ADMIN')} className={`px-5 py-2.5 text-sm font-bold transition ${formRole === 'SUPER ADMIN' ? 'bg-[#006B32] text-white' : 'bg-gray-100 text-gray-600 hover:bg-gray-200'}`}>Super Admin</button>
            </div>
          </div>
          <button onClick={() => setAddModalOpen(false)} className="w-full bg-[#006B32] text-white py-3 text-sm font-bold hover:bg-[#005a2a] transition mt-4">Create Admin Account</button>
        </div>
      </Modal>

      <Modal isOpen={!!viewAdmin} onClose={() => setViewAdmin(null)} title="Admin Profile" size="md">
        {viewAdmin && (
          <div className="space-y-5">
            <div className="flex items-center gap-4"><div className="w-14 h-14 bg-gray-200 flex items-center justify-center"><User size={24} className="text-gray-400" /></div><div><p className="text-lg font-extrabold text-[#191C1D]">{viewAdmin.name}</p><p className="text-sm text-gray-500">{viewAdmin.email}</p></div></div>
            <div className="grid grid-cols-2 gap-4">
              <div className="bg-[#F8F9FA] p-4 border border-gray-100"><p className="text-[9px] font-bold text-gray-400 uppercase tracking-widest mb-1">Role</p><p className="font-bold text-[#191C1D] text-sm">{viewAdmin.role}</p></div>
              <div className="bg-[#F8F9FA] p-4 border border-gray-100"><p className="text-[9px] font-bold text-gray-400 uppercase tracking-widest mb-1">Status</p><p className="font-bold text-[#191C1D] text-sm">{viewAdmin.status}</p></div>
              <div className="bg-[#F8F9FA] p-4 border border-gray-100"><p className="text-[9px] font-bold text-gray-400 uppercase tracking-widest mb-1">Date Added</p><p className="font-bold text-[#191C1D] text-sm">{viewAdmin.dateAdded}</p></div>
              <div className="bg-[#F8F9FA] p-4 border border-gray-100"><p className="text-[9px] font-bold text-gray-400 uppercase tracking-widest mb-1">Cities</p><p className="font-bold text-[#191C1D] text-sm">{viewAdmin.cities.join(', ')}{viewAdmin.extraCities ? ` ${viewAdmin.extraCities}` : ''}</p></div>
            </div>
          </div>
        )}
      </Modal>

      <ConfirmModal isOpen={!!suspendAdmin} onClose={() => setSuspendAdmin(null)} onConfirm={() => setSuspendAdmin(null)} title="Suspend Admin" message={`Are you sure you want to suspend ${suspendAdmin?.name}? They will lose all admin access.`} confirmLabel="Suspend" variant="danger" />
      <ConfirmModal isOpen={!!reinstateAdmin} onClose={() => setReinstateAdmin(null)} onConfirm={() => setReinstateAdmin(null)} title="Reinstate Admin" message={`Reinstate ${reinstateAdmin?.name}? They will regain their previous access level.`} confirmLabel="Reinstate" variant="success" />

      <Modal isOpen={exportModalOpen} onClose={() => setExportModalOpen(false)} title="Export Admins" size="sm">
        <p className="text-sm text-gray-600 mb-6">Choose a format to export admin data.</p>
        <div className="space-y-3">
          <button onClick={() => setExportModalOpen(false)} className="w-full text-left p-4 border border-gray-200 hover:bg-gray-50 transition"><p className="font-bold text-[#191C1D] text-sm">CSV File (.csv)</p><p className="text-xs text-gray-500">Spreadsheet-compatible format</p></button>
          <button onClick={() => setExportModalOpen(false)} className="w-full text-left p-4 border border-gray-200 hover:bg-gray-50 transition"><p className="font-bold text-[#191C1D] text-sm">PDF Report (.pdf)</p><p className="text-xs text-gray-500">Formatted report</p></button>
        </div>
      </Modal>

    </div>
  );
}

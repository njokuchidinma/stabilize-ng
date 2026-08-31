"use client";

import { useState } from 'react';
import {
  ChevronDown, Calendar,
  User, Activity, ShieldCheck, AlertCircle,
  CheckCircle2, PlusSquare, Flag, RefreshCw
} from 'lucide-react';
import SearchInput from '@/components/admin/generics/SearchInput';
import Pagination from '@/components/admin/generics/Pagination';
import ExportButton from '@/components/admin/generics/ExportButton';
import Modal from '@/components/admin/generics/Modal';

export default function AuditLogsPage() {
  const [search, setSearch] = useState('');
  const [adminFilter, setAdminFilter] = useState('all');
  const [actionFilter, setActionFilter] = useState('all');
  const [currentPage, setCurrentPage] = useState(1);
  const [exportModalOpen, setExportModalOpen] = useState(false);
  const [viewLog, setViewLog] = useState<typeof auditLogs[number] | null>(null);
  const itemsPerPage = 25;
  // --- MOCK DATA ---
  const auditLogs = [
    {
      date: "Oct 24, 2023", time: "14:22:10 PM",
      adminName: "Admin Frank", role: "Moderator Team",
      avatar: "/images/admin/avatar2.jpg",
      actionIcon: CheckCircle2, iconColor: "text-[#006B32]",
      actionVerb: "Approved", verbColor: "text-[#006B32]",
      details: <>Artisan <strong>Ahmed Sulaiman</strong> profile for Lagos central zone.</>,
      status: "SUCCESS", statusColor: "bg-[#E6F0EB] text-[#006B32]"
    },
    {
      date: "Oct 24, 2023", time: "12:05:45 PM",
      adminName: "Super Admin Jane", role: "System Owner",
      avatar: "/images/admin/avatar1.jpg",
      actionIcon: PlusSquare, iconColor: "text-[#006B32]",
      actionVerb: "Added", verbColor: "text-[#006B32]",
      details: <>new operational territory: <strong>Benin City</strong>, Edo State.</>,
      status: "SUCCESS", statusColor: "bg-[#E6F0EB] text-[#006B32]"
    },
    {
      date: "Oct 23, 2023", time: "17:45:01 PM",
      adminName: "Admin Musa", role: "Support Lead",
      avatar: "/images/admin/avatar3.jpg",
      actionIcon: Flag, iconColor: "text-[#8A5100]",
      actionVerb: "Flagged", verbColor: "text-[#8A5100]",
      details: <>Enquiry #9921 for potential compliance violation.</>,
      status: "WARNING", statusColor: "bg-[#FDE8D7] text-[#8A5100]"
    },
    {
      date: "Oct 23, 2023", time: "09:15:33 AM",
      adminName: "System Kernel", role: "Automated Task",
      avatar: null, // Triggers fallback shield icon
      actionIcon: RefreshCw, iconColor: "text-gray-500",
      actionVerb: "Initiated", verbColor: "text-gray-700",
      details: <><strong>weekly security rotation</strong> for all super admin access keys.</>,
      status: "SUCCESS", statusColor: "bg-[#E6F0EB] text-[#006B32]"
    }
  ];

  const filteredLogs = auditLogs.filter((log) => {
    if (search && !log.adminName.toLowerCase().includes(search.toLowerCase()) && !log.status.toLowerCase().includes(search.toLowerCase())) return false;
    if (adminFilter !== 'all') {
      if (adminFilter === 'super' && !log.role.toLowerCase().includes('owner') && !log.role.toLowerCase().includes('system')) return false;
      if (adminFilter === 'standard' && log.role.toLowerCase().includes('owner')) return false;
    }
    if (actionFilter !== 'all') {
      if (actionFilter === 'approvals' && log.actionVerb !== 'Approved') return false;
      if (actionFilter === 'flags' && log.actionVerb !== 'Flagged') return false;
      if (actionFilter === 'system' && log.actionVerb !== 'Initiated') return false;
    }
    return true;
  });
  const paginatedLogs = filteredLogs.slice((currentPage - 1) * itemsPerPage, currentPage * itemsPerPage);

  return (
    <div className="p-4 md:p-8 max-w-[1400px] mx-auto">

      {/* =========================================
          1. PAGE HEADER
          ========================================= */}
      <div className="flex flex-col md:flex-row justify-between items-start md:items-center mb-8 gap-4">
        <div>
          <h1 className="text-2xl md:text-3xl font-extrabold text-[#191C1D]">Audit Logs</h1>
          <p className="text-sm text-gray-500 mt-1">Monitoring platform integrity and administrative governance.</p>
        </div>

        <div className="flex items-center gap-4 w-full md:w-auto">
          <div className="flex-1 md:w-80">
            <SearchInput placeholder="Search logs..." value={search} onChange={(v) => { setSearch(v); setCurrentPage(1); }} />
          </div>
          <ExportButton label="Export to CSV" onClick={() => setExportModalOpen(true)} variant="primary" />
        </div>
      </div>

      {/* =========================================
          2. FILTER BAR
          ========================================= */}
      <div className="bg-white p-6 shadow-sm border border-gray-100 flex flex-col lg:flex-row gap-6 mb-8">

        {/* Admin User Filter */}
        <div className="flex-1">
          <label className="flex items-center gap-2 text-[10px] font-extrabold text-gray-500 uppercase tracking-widest mb-2">
            <User size={14} /> Admin User
          </label>
          <div className="relative">
            <select value={adminFilter} onChange={(e) => { setAdminFilter(e.target.value); setCurrentPage(1); }} className="w-full bg-[#F8F9FA] border border-gray-200 text-[#191C1D] text-sm font-semibold px-4 py-3 appearance-none focus:outline-none focus:border-[#006B32]">
              <option value="all">All Administrator</option>
              <option value="super">Super Admins</option>
              <option value="standard">Standard Admins</option>
            </select>
            <ChevronDown size={16} className="absolute right-4 top-1/2 -translate-y-1/2 text-gray-400 pointer-events-none" />
          </div>
        </div>

        {/* Action Type Filter */}
        <div className="flex-1">
          <label className="flex items-center gap-2 text-[10px] font-extrabold text-gray-500 uppercase tracking-widest mb-2">
            <Activity size={14} /> Action Type
          </label>
          <div className="relative">
            <select value={actionFilter} onChange={(e) => { setActionFilter(e.target.value); setCurrentPage(1); }} className="w-full bg-[#F8F9FA] border border-gray-200 text-[#191C1D] text-sm font-semibold px-4 py-3 appearance-none focus:outline-none focus:border-[#006B32]">
              <option value="all">All Actions</option>
              <option value="approvals">Approvals</option>
              <option value="flags">Suspensions</option>
              <option value="system">System Updates</option>
            </select>
            <ChevronDown size={16} className="absolute right-4 top-1/2 -translate-y-1/2 text-gray-400 pointer-events-none" />
          </div>
        </div>

        {/* Timeline Filter */}
        <div className="flex-[2]">
          <label className="flex items-center gap-2 text-[10px] font-extrabold text-gray-500 uppercase tracking-widest mb-2">
            <Calendar size={14} /> Timeline
          </label>
          <div className="flex items-center gap-3">
            <div className="relative flex-1">
              <input type="text" placeholder="mm/dd/yyyy" className="w-full bg-[#F8F9FA] border border-gray-200 text-[#191C1D] text-sm font-semibold px-4 py-3 focus:outline-none focus:border-[#006B32]" />
              <Calendar size={14} className="absolute right-4 top-1/2 -translate-y-1/2 text-gray-400 pointer-events-none" />
            </div>
            <span className="text-gray-400 font-medium text-sm">to</span>
            <div className="relative flex-1">
              <input type="text" placeholder="mm/dd/yyyy" className="w-full bg-[#F8F9FA] border border-gray-200 text-[#191C1D] text-sm font-semibold px-4 py-3 focus:outline-none focus:border-[#006B32]" />
              <Calendar size={14} className="absolute right-4 top-1/2 -translate-y-1/2 text-gray-400 pointer-events-none" />
            </div>
          </div>
        </div>

      </div>

      {/* =========================================
          3. LOGS TABLE
          ========================================= */}
      <div className="bg-white shadow-sm border border-gray-100 mb-8 overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full text-left border-collapse">
            <thead>
              <tr className="text-[10px] font-extrabold text-gray-500 uppercase tracking-widest border-b border-gray-100">
                <th className="p-6">Timestamp</th>
                <th className="p-6">Administrator</th>
                <th className="p-6">Activity Details</th>
                <th className="p-6 text-right">Status</th>
              </tr>
            </thead>
            <tbody className="text-sm">
              {paginatedLogs.map((log, index) => {
                const ActionIcon = log.actionIcon;
                return (
                  <tr key={index} className="border-b border-gray-50 hover:bg-gray-50/50 transition">

                    {/* Timestamp */}
                    <td className="p-6 align-top">
                      <p className="font-extrabold text-[#191C1D] mb-0.5">{log.date}</p>
                      <p className="text-xs text-gray-500">{log.time}</p>
                    </td>

                    {/* Administrator */}
                    <td className="p-6 align-top">
                      <div className="flex items-center gap-3">
                        <div className="w-10 h-10 overflow-hidden bg-gray-100 border border-gray-200 flex items-center justify-center flex-shrink-0">
                          {log.avatar ? (
                            <div className="w-full h-full bg-gray-800"></div> // Placeholder for avatar image
                            // <Image src={log.avatar} alt={log.adminName} width={40} height={40} className="object-cover" />
                          ) : (
                            <ShieldCheck size={20} className="text-gray-400" />
                          )}
                        </div>
                        <div>
                          <p className="font-extrabold text-[#191C1D]">{log.adminName}</p>
                          <p className="text-[11px] text-gray-500">{log.role}</p>
                        </div>
                      </div>
                    </td>

                    {/* Activity Details */}
                    <td className="p-6 align-top">
                      <button onClick={() => setViewLog(log)} className="flex items-start gap-3 hover:opacity-80 transition text-left">
                        <ActionIcon size={18} className={`${log.iconColor} mt-0.5 flex-shrink-0`} />
                        <p className="text-[#191C1D] text-sm leading-relaxed max-w-md">
                          <strong className={log.verbColor}>{log.actionVerb}</strong> {log.details}
                        </p>
                      </button>
                    </td>

                    {/* Status */}
                    <td className="p-6 align-top text-right">
                      <span className={`inline-flex items-center px-3 py-1.5 text-[9px] font-extrabold tracking-widest uppercase ${log.statusColor}`}>
                        {log.status}
                      </span>
                    </td>

                  </tr>
                );
              })}
            </tbody>
          </table>
        </div>

        {/* Pagination */}
        <div className="p-6 border-t border-gray-100">
          <Pagination currentPage={currentPage} totalItems={filteredLogs.length} itemsPerPage={itemsPerPage} onPageChange={setCurrentPage} itemLabel="audit logs" variant="round" />
        </div>
      </div>

      {/* =========================================
          4. BOTTOM METRICS
          ========================================= */}
      <div className="grid grid-cols-1 md:grid-cols-3 gap-6">

        <div className="bg-white p-6 shadow-sm border border-gray-100 flex flex-col justify-between h-40">
          <div className="w-10 h-10 bg-[#E6F0EB] text-[#006B32] flex items-center justify-center">
            <ShieldCheck size={20} />
          </div>
          <div>
            <p className="text-3xl font-extrabold text-[#191C1D] mb-1">1,204</p>
            <p className="text-xs text-gray-500 mb-3">Actions logged this month</p>
            <div className="w-full h-1.5 bg-gray-100 overflow-hidden">
              <div className="w-[60%] h-full bg-[#006B32]"></div>
            </div>
          </div>
        </div>

        <div className="bg-white p-6 shadow-sm border border-gray-100 flex flex-col justify-between h-40">
          <div className="w-10 h-10 bg-[#FDE8D7] text-[#8A5100] flex items-center justify-center">
            <AlertCircle size={20} />
          </div>
          <div>
            <p className="text-3xl font-extrabold text-[#191C1D] mb-1">12</p>
            <p className="text-xs text-gray-500 mb-3">Flagged security alerts</p>
            <div className="w-full h-1.5 bg-gray-100 overflow-hidden">
              <div className="w-[15%] h-full bg-[#8A5100]"></div>
            </div>
          </div>
        </div>

        <div className="bg-[#006B32] p-6 shadow-sm flex flex-col justify-between h-40 text-white relative overflow-hidden">
          <div className="w-10 h-10 bg-white/20 text-white flex items-center justify-center relative z-10">
            <CheckCircle2 size={20} />
          </div>
          <div className="relative z-10">
            <p className="text-3xl font-extrabold mb-1">Healthy</p>
            <p className="text-xs text-white/80 mb-3">Platform compliance status</p>
            <span className="inline-block bg-black/20 text-white text-[9px] font-extrabold px-3 py-1.5 uppercase tracking-wider">
              Last Verified: 10m ago
            </span>
          </div>
        </div>

      </div>

      {/* MODALS */}
      <Modal isOpen={!!viewLog} onClose={() => setViewLog(null)} title="Log Details" size="md">
        {viewLog && (
          <div className="space-y-5">
            <div className="grid grid-cols-2 gap-4">
              <div className="bg-[#F8F9FA] p-4 border border-gray-100"><p className="text-[9px] font-bold text-gray-400 uppercase tracking-widest mb-1">Date</p><p className="font-bold text-[#191C1D] text-sm">{viewLog.date}</p></div>
              <div className="bg-[#F8F9FA] p-4 border border-gray-100"><p className="text-[9px] font-bold text-gray-400 uppercase tracking-widest mb-1">Time</p><p className="font-bold text-[#191C1D] text-sm">{viewLog.time}</p></div>
              <div className="bg-[#F8F9FA] p-4 border border-gray-100"><p className="text-[9px] font-bold text-gray-400 uppercase tracking-widest mb-1">Admin</p><p className="font-bold text-[#191C1D] text-sm">{viewLog.adminName}</p></div>
              <div className="bg-[#F8F9FA] p-4 border border-gray-100"><p className="text-[9px] font-bold text-gray-400 uppercase tracking-widest mb-1">Role</p><p className="font-bold text-[#191C1D] text-sm">{viewLog.role}</p></div>
              <div className="bg-[#F8F9FA] p-4 border border-gray-100"><p className="text-[9px] font-bold text-gray-400 uppercase tracking-widest mb-1">Action</p><p className="font-bold text-sm"><span className={viewLog.verbColor}>{viewLog.actionVerb}</span></p></div>
              <div className="bg-[#F8F9FA] p-4 border border-gray-100"><p className="text-[9px] font-bold text-gray-400 uppercase tracking-widest mb-1">Status</p><p className={`text-sm font-extrabold ${viewLog.status === 'SUCCESS' ? 'text-[#006B32]' : 'text-[#8A5100]'}`}>{viewLog.status}</p></div>
            </div>
            <div className="bg-[#F8F9FA] p-4 border border-gray-100"><p className="text-[9px] font-bold text-gray-400 uppercase tracking-widest mb-2">Details</p><p className="text-sm text-[#191C1D]">{viewLog.details}</p></div>
          </div>
        )}
      </Modal>

      <Modal isOpen={exportModalOpen} onClose={() => setExportModalOpen(false)} title="Export Audit Logs" size="sm">
        <p className="text-sm text-gray-600 mb-6">Choose a format to export audit log data.</p>
        <div className="space-y-3">
          <button onClick={() => setExportModalOpen(false)} className="w-full text-left p-4 border border-gray-200 hover:bg-gray-50 transition"><p className="font-bold text-[#191C1D] text-sm">CSV File (.csv)</p><p className="text-xs text-gray-500">Spreadsheet-compatible format</p></button>
          <button onClick={() => setExportModalOpen(false)} className="w-full text-left p-4 border border-gray-200 hover:bg-gray-50 transition"><p className="font-bold text-[#191C1D] text-sm">PDF Report (.pdf)</p><p className="text-xs text-gray-500">Formatted report</p></button>
        </div>
      </Modal>

    </div>
  );
}

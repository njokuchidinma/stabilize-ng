"use client";

import { useState } from 'react';
import {
  X, MapPin, TrendingUp, CheckCircle, Home, Zap, Filter,
} from 'lucide-react';
import SearchInput from '@/components/admin/generics/SearchInput';
import Pagination from '@/components/admin/generics/Pagination';
import StatusBadge from '@/components/admin/generics/StatusBadge';
import ExportButton from '@/components/admin/generics/ExportButton';
import Modal from '@/components/admin/generics/Modal';
import ConfirmModal from '@/components/admin/generics/ConfirmModal';

const allUsers = [
  { id: 1, name: "Jane Doe", email: "jane.doe@example.com", location: "Lagos", subLocation: "(Ikeja)", lastLoginTime: "2 hours ago", lastLoginLabel: "LAST LOGIN", loginColor: "text-[#191C1D]", status: "Active", isSuspended: false },
  { id: 2, name: "Tunde Afolayan", email: "t.afolayan@nymail.ng", location: "Abuja", subLocation: "(Gwarinpa)", lastLoginTime: "Yesterday, 4:30 PM", lastLoginLabel: "LAST LOGIN", loginColor: "text-[#191C1D]", status: "Active", isSuspended: false },
  { id: 3, name: "Amaka Obi", email: "amaka.obi@corps.gov.ng", location: "Port Harcourt", subLocation: "", lastLoginTime: "5 days ago", lastLoginLabel: "INACTIVE", loginColor: "text-red-500", status: "Suspended", isSuspended: true },
  { id: 4, name: "Chidi Azikiwe", email: "c.azikiwe@techmail.ng", location: "Enugu", subLocation: "(Urban)", lastLoginTime: "10 mins ago", lastLoginLabel: "LAST LOGIN", loginColor: "text-[#191C1D]", status: "Active", isSuspended: false },
  { id: 5, name: "Fatima Bello", email: "fatima.b@mail.ng", location: "Lagos", subLocation: "(Lekki)", lastLoginTime: "1 hour ago", lastLoginLabel: "LAST LOGIN", loginColor: "text-[#191C1D]", status: "Active", isSuspended: false },
  { id: 6, name: "Emeka Nwosu", email: "emeka.n@corps.gov.ng", location: "Abuja", subLocation: "(Maitama)", lastLoginTime: "3 days ago", lastLoginLabel: "INACTIVE", loginColor: "text-red-500", status: "Suspended", isSuspended: true },
];
const allCities = ["Lagos", "Abuja", "Port Harcourt", "Enugu"];

export default function UserManagementPage() {
  const [search, setSearch] = useState('');
  const [activeCities, setActiveCities] = useState<string[]>([]);
  const [currentPage, setCurrentPage] = useState(1);
  const itemsPerPage = 10;
  const [filterModalOpen, setFilterModalOpen] = useState(false);
  const [viewUser, setViewUser] = useState<typeof allUsers[0] | null>(null);
  const [suspendUser, setSuspendUser] = useState<typeof allUsers[0] | null>(null);
  const [reinstateUser, setReinstateUser] = useState<typeof allUsers[0] | null>(null);
  const [suspendReason, setSuspendReason] = useState('');
  const [exportModalOpen, setExportModalOpen] = useState(false);

  const filtered = allUsers.filter((u) => {
    const matchSearch = !search || u.name.toLowerCase().includes(search.toLowerCase()) || u.email.toLowerCase().includes(search.toLowerCase());
    const matchCity = activeCities.length === 0 || activeCities.includes(u.location);
    return matchSearch && matchCity;
  });
  const paginated = filtered.slice((currentPage - 1) * itemsPerPage, currentPage * itemsPerPage);
  const toggleCity = (city: string) => { setActiveCities((p) => p.includes(city) ? p.filter((c) => c !== city) : [...p, city]); setCurrentPage(1); };

  return (
    <div className="p-4 md:p-8 max-w-[1400px] mx-auto">
      {/* HEADER */}
      <div className="flex flex-col md:flex-row justify-between items-start md:items-center mb-10 gap-6">
        <div>
          <h1 className="text-2xl md:text-4xl font-extrabold text-[#191C1D] mb-3 tracking-tight">User Directory</h1>
          <p className="text-gray-600 text-sm max-w-xl leading-relaxed">Manage and monitor regular users, including corps members and new movers across Nigeria.</p>
        </div>
        <div className="w-full md:w-auto flex flex-col items-end gap-3">
          <SearchInput placeholder="Search regular users..." value={search} onChange={(v) => { setSearch(v); setCurrentPage(1); }} className="w-full md:w-80" />
          {activeCities.length > 0 && (
            <div className="flex items-center gap-2 text-xs font-bold flex-wrap">
              <span className="text-gray-500 mr-1">Active Filters:</span>
              {activeCities.map((city) => (
                <button key={city} onClick={() => toggleCity(city)} className="bg-[#E6F0EB] text-[#006B32] px-2.5 py-1 flex items-center gap-1 hover:bg-[#d1e8dc] transition">
                  {city} <X size={12} />
                </button>
              ))}
            </div>
          )}
        </div>
      </div>

      {/* METRICS */}
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 mb-10">
        <MetricCard title="Total Users" value="12,842" icon={<TrendingUp size={14} />} trend="+12% this month" trendColor="text-[#006B32]" />
        <MetricCard title="NYSC Members" value="4,210" icon={<CheckCircle size={14} />} trend="Batch B Registered" trendColor="text-[#006B32]" />
        <MetricCard title="New Movers" value="8,632" icon={<Home size={14} />} trend="Relocation trends up" trendColor="text-[#8A5100]" />
        <MetricCard title="Avg. Active Daily" value="2.4k" icon={<Zap size={14} />} trend="Stable platform load" trendColor="text-gray-400" />
      </div>

      {/* TABLE */}
      <div className="bg-white shadow-sm border border-gray-100 mb-10 overflow-hidden">
        <div className="p-6 border-b border-gray-100 flex items-center justify-between">
          <h3 className="text-xl font-extrabold text-[#191C1D]">Regular User Base</h3>
          <div className="flex items-center gap-3">
            <button onClick={() => setFilterModalOpen(true)} className="flex items-center gap-2 text-xs font-bold text-gray-700 bg-[#F8F9FA] border border-gray-200 px-4 py-2.5 hover:bg-gray-100 transition shadow-sm"><Filter size={14} /> Filter Cities</button>
            <ExportButton label="Export CSV" onClick={() => setExportModalOpen(true)} />
          </div>
        </div>
        <div className="overflow-x-auto">
          <table className="w-full text-left border-collapse">
            <thead>
              <tr className="bg-gray-50/50 text-[10px] font-extrabold text-gray-400 uppercase tracking-widest border-b border-gray-100">
                <th className="p-5 pl-6 w-1/3">User Profile</th><th className="p-5">City Location</th><th className="p-5">Activity Log</th><th className="p-5">Account Status</th><th className="p-5 pr-6 text-right">Administrative Actions</th>
              </tr>
            </thead>
            <tbody className="text-sm">
              {paginated.map((user) => (
                <tr key={user.id} className={`border-b border-gray-50 hover:bg-gray-50/50 transition ${user.isSuspended ? 'bg-red-50/30' : ''}`}>
                  <td className="p-5 pl-6">
                    <div className="flex items-center gap-4">
                      <div className="relative">
                        <div className="w-12 h-12 bg-gray-200 border-2 border-white shadow-sm flex-shrink-0 flex items-center justify-center text-sm font-bold text-gray-500">{user.name.split(' ').map(n=>n[0]).join('')}</div>
                        <div className={`absolute bottom-0 right-0 w-3 h-3 border-2 border-white ${user.isSuspended ? 'bg-red-500' : 'bg-[#006B32]'}`} />
                      </div>
                      <div><p className="font-extrabold text-[#191C1D] text-base leading-tight mb-1">{user.name}</p><p className="text-xs text-gray-500">{user.email}</p></div>
                    </div>
                  </td>
                  <td className="p-5"><div className="flex items-start gap-2 text-[#191C1D]"><MapPin size={16} className="text-[#006B32] mt-0.5 flex-shrink-0" /><div><p className="font-bold text-sm leading-tight">{user.location}</p>{user.subLocation && <p className="text-xs text-gray-500">{user.subLocation}</p>}</div></div></td>
                  <td className="p-5"><p className={`font-bold text-sm mb-1 ${user.loginColor}`}>{user.lastLoginTime}</p><p className="text-[9px] font-extrabold text-gray-400 uppercase tracking-widest">{user.lastLoginLabel}</p></td>
                  <td className="p-5"><StatusBadge status={user.status} /></td>
                  <td className="p-5 pr-6">
                    <div className="flex justify-end gap-2">
                      <button onClick={() => setViewUser(user)} className="bg-[#006B32] text-white px-4 py-2 text-xs font-bold hover:bg-[#005a2a] transition shadow-sm">View Activity</button>
                      {user.isSuspended ? (
                        <button onClick={() => setReinstateUser(user)} className="bg-white text-[#006B32] border border-[#006B32] px-4 py-2 text-xs font-bold hover:bg-[#E6F0EB] transition">Reinstate</button>
                      ) : (
                        <button onClick={() => setSuspendUser(user)} className="bg-white text-gray-700 border border-gray-200 px-4 py-2 text-xs font-bold hover:bg-gray-50 transition">Suspend</button>
                      )}
                    </div>
                  </td>
                </tr>
              ))}
              {paginated.length === 0 && <tr><td colSpan={5} className="p-10 text-center text-gray-400 font-medium">No users found matching your criteria.</td></tr>}
            </tbody>
          </table>
        </div>
        <Pagination currentPage={currentPage} totalItems={filtered.length} itemsPerPage={itemsPerPage} onPageChange={setCurrentPage} itemLabel="users" />
      </div>

      {/* INSIGHT BANNER */}
      <div className="bg-[#006B32] p-8 md:p-10 shadow-lg relative overflow-hidden flex flex-col md:flex-row items-center justify-between">
        <div className="absolute -right-20 -top-20 opacity-10 pointer-events-none"><TrendingUp size={400} strokeWidth={1} /></div>
        <div className="relative z-10 max-w-2xl mb-6 md:mb-0">
          <span className="inline-block bg-white/20 text-white text-[10px] font-extrabold px-3 py-1.5 uppercase tracking-widest mb-4">Platform Insight</span>
          <h2 className="text-3xl font-extrabold text-white mb-4 leading-tight">Growth among NYSC members has spiked by 42% in Southwest cities this quarter.</h2>
          <p className="text-sm text-white/80 leading-relaxed">Consider launching new &quot;Artisan Spotlights&quot; for Lagos and Ibadan to accommodate the influx of new movers seeking relocation services.</p>
        </div>
        <div className="relative z-10 flex-shrink-0"><button onClick={() => setExportModalOpen(true)} className="bg-white text-[#006B32] px-8 py-4 font-extrabold hover:bg-gray-100 transition shadow-lg text-sm">Download<br/>Report</button></div>
      </div>

      {/* MODALS */}
      <Modal isOpen={filterModalOpen} onClose={() => setFilterModalOpen(false)} title="Filter by City" size="sm">
        <div className="space-y-3">
          {allCities.map((city) => (
            <label key={city} className="flex items-center gap-3 p-3 hover:bg-gray-50 cursor-pointer transition">
              <input type="checkbox" checked={activeCities.includes(city)} onChange={() => toggleCity(city)} className="w-4 h-4 border-gray-300 text-[#006B32] focus:ring-[#006B32]" />
              <span className="text-sm font-semibold text-[#191C1D]">{city}</span>
            </label>
          ))}
        </div>
        <div className="flex justify-end gap-3 mt-6">
          <button onClick={() => { setActiveCities([]); setCurrentPage(1); }} className="text-sm font-bold text-gray-500 hover:text-[#191C1D]">Clear All</button>
          <button onClick={() => setFilterModalOpen(false)} className="bg-[#006B32] text-white px-5 py-2.5 text-sm font-bold hover:bg-[#005a2a] transition shadow-sm">Apply</button>
        </div>
      </Modal>

      <Modal isOpen={!!viewUser} onClose={() => setViewUser(null)} title="User Activity" size="lg">
        {viewUser && (
          <div className="space-y-6">
            <div className="flex items-center gap-4">
              <div className="w-16 h-16 bg-gray-200 flex items-center justify-center text-lg font-bold text-gray-500">{viewUser.name.split(' ').map(n=>n[0]).join('')}</div>
              <div><p className="text-xl font-extrabold text-[#191C1D]">{viewUser.name}</p><p className="text-sm text-gray-500">{viewUser.email}</p></div>
            </div>
            <div className="grid grid-cols-2 gap-4">
              <InfoBlock label="Location" value={`${viewUser.location} ${viewUser.subLocation}`} />
              <InfoBlock label="Status" value={viewUser.status} />
              <InfoBlock label="Last Login" value={viewUser.lastLoginTime} />
              <InfoBlock label="Member Since" value="Jan 2024" />
            </div>
            <div>
              <p className="text-[10px] font-extrabold text-gray-400 uppercase tracking-widest mb-3">Recent Activity</p>
              <div className="space-y-3">
                <ActivityItem time="2 hours ago" action="Booked plumbing service in Ikeja" />
                <ActivityItem time="Yesterday" action="Updated profile information" />
                <ActivityItem time="3 days ago" action="Completed booking #ENQ-4521" />
                <ActivityItem time="1 week ago" action="Saved 2 artisans to favourites" />
              </div>
            </div>
          </div>
        )}
      </Modal>

      <ConfirmModal isOpen={!!suspendUser} onClose={() => { setSuspendUser(null); setSuspendReason(''); }} onConfirm={() => setSuspendUser(null)} title="Suspend User" message={`Are you sure you want to suspend ${suspendUser?.name}? They will lose access to browsing and booking services.`} confirmLabel="Suspend Account" variant="danger">
        <div><label className="block text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-2">Reason for Suspension</label><textarea value={suspendReason} onChange={(e) => setSuspendReason(e.target.value)} placeholder="Explain why this account is being suspended..." className="w-full border border-gray-200 px-4 py-3 text-sm focus:outline-none focus:border-[#006B32] resize-none h-24" /></div>
      </ConfirmModal>

      <ConfirmModal isOpen={!!reinstateUser} onClose={() => setReinstateUser(null)} onConfirm={() => setReinstateUser(null)} title="Reinstate User" message={`Are you sure you want to reinstate ${reinstateUser?.name}? They will regain full platform access.`} confirmLabel="Reinstate Account" variant="success" />

      <Modal isOpen={exportModalOpen} onClose={() => setExportModalOpen(false)} title="Export Data" size="sm">
        <p className="text-sm text-gray-600 mb-6">Choose a format to export the user data.</p>
        <div className="space-y-3">
          <button onClick={() => setExportModalOpen(false)} className="w-full text-left p-4 border border-gray-200 hover:bg-gray-50 transition"><p className="font-bold text-[#191C1D] text-sm">CSV File (.csv)</p><p className="text-xs text-gray-500">Spreadsheet-compatible format</p></button>
          <button onClick={() => setExportModalOpen(false)} className="w-full text-left p-4 border border-gray-200 hover:bg-gray-50 transition"><p className="font-bold text-[#191C1D] text-sm">PDF Report (.pdf)</p><p className="text-xs text-gray-500">Formatted report for printing</p></button>
        </div>
      </Modal>
    </div>
  );
}

function MetricCard({ title, value, icon, trend, trendColor }: { title: string; value: string; icon: React.ReactNode; trend: string; trendColor: string }) {
  return (
    <div className="bg-white p-6 shadow-sm border border-gray-100 flex flex-col justify-between">
      <p className="text-xs font-bold text-gray-500 uppercase tracking-widest mb-2">{title}</p>
      <p className="text-4xl font-extrabold text-[#191C1D] mb-4">{value}</p>
      <p className={`text-[10px] font-bold ${trendColor} flex items-center gap-1`}>{icon} {trend}</p>
    </div>
  );
}
function InfoBlock({ label, value }: { label: string; value: string }) {
  return (<div className="bg-[#F8F9FA] p-4 border border-gray-100"><p className="text-[9px] font-bold text-gray-400 uppercase tracking-widest mb-1">{label}</p><p className="font-bold text-[#191C1D] text-sm">{value}</p></div>);
}
function ActivityItem({ time, action }: { time: string; action: string }) {
  return (<div className="flex items-start gap-3 text-sm"><div className="w-2 h-2 rounded-full bg-[#006B32] mt-1.5 flex-shrink-0" /><div><p className="text-[#191C1D] font-medium">{action}</p><p className="text-xs text-gray-400">{time}</p></div></div>);
}

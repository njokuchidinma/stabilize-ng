"use client";

import { useState } from 'react';
import { MapPin, TrendingUp, Clock, CheckCircle, AlertCircle, User, MessageSquare } from 'lucide-react';
import TabBar from '@/components/admin/generics/TabBar';
import Pagination from '@/components/admin/generics/Pagination';
import StatusBadge from '@/components/admin/generics/StatusBadge';
import ExportButton from '@/components/admin/generics/ExportButton';
import FilterDropdown from '@/components/admin/generics/FilterDropdown';
import Modal from '@/components/admin/generics/Modal';
import StatCard from '@/components/admin/generics/StatCard';

const enquiriesData = [
  { id: 1, user: "Chidi Okoro", service: "Plumbing - Pipe Repair", city: "Lagos", status: "Pending", date: "2024-01-15", description: "Kitchen sink leak needs urgent repair", artisan: null },
  { id: 2, user: "Amina Bello", service: "Electrical - Panel Installation", city: "Abuja", status: "Confirmed", date: "2024-01-14", description: "Full panel upgrade for 3-bedroom flat", artisan: "Bola Electricals" },
  { id: 3, user: "Femi Adeyemi", service: "AC Installation", city: "Port Harcourt", status: "Completed", date: "2024-01-12", description: "2HP split unit installation in living room", artisan: "Chioma Electronics" },
  { id: 4, user: "Ngozi Eze", service: "Deep Cleaning", city: "Abuja", status: "Cancelled", date: "2024-01-11", description: "Post-renovation deep cleaning for 4-bedroom house", artisan: null },
  { id: 5, user: "Tolu Balogun", service: "Carpentry - Cabinet Making", city: "Lagos", status: "Confirmed", date: "2024-01-10", description: "Custom kitchen cabinets with granite top", artisan: "Grace Furniture" },
];

const bookingsData = [
  { id: 1, user: "Chidi Okoro", artisan: "Ahmed the Plumber", service: "Pipe Repair", city: "Lagos", status: "Completed", date: "2024-01-16", amount: "₦15,000", rating: 4.8 },
  { id: 2, user: "Amina Bello", artisan: "Bola Electricals", service: "Panel Installation", city: "Abuja", status: "In Progress", date: "2024-01-15", amount: "₦45,000", rating: null },
  { id: 3, user: "Tolu Balogun", artisan: "Grace Furniture", service: "Cabinet Making", city: "Lagos", status: "Scheduled", date: "2024-01-20", amount: "₦120,000", rating: null },
];

const tabs = [{ label: "Enquiries", value: "enquiries" }, { label: "Bookings", value: "bookings" }];
const cityOptions = [{ label: "All Cities", value: "all" }, { label: "Lagos", value: "Lagos" }, { label: "Abuja", value: "Abuja" }, { label: "Port Harcourt", value: "Port Harcourt" }];
const statusOptionsEnq = [{ label: "All", value: "all" }, { label: "Pending", value: "Pending" }, { label: "Confirmed", value: "Confirmed" }, { label: "Completed", value: "Completed" }, { label: "Cancelled", value: "Cancelled" }];
const statusOptionsBook = [{ label: "All", value: "all" }, { label: "Completed", value: "Completed" }, { label: "In Progress", value: "In Progress" }, { label: "Scheduled", value: "Scheduled" }];

export default function EnquiryPage() {
  const [activeTab, setActiveTab] = useState('enquiries');
  const [cityFilter, setCityFilter] = useState('all');
  const [statusFilter, setStatusFilter] = useState('all');
  const [currentPage, setCurrentPage] = useState(1);
  const itemsPerPage = 10;

  const [viewEnquiry, setViewEnquiry] = useState<typeof enquiriesData[0] | null>(null);
  const [viewBooking, setViewBooking] = useState<typeof bookingsData[0] | null>(null);
  const [exportModalOpen, setExportModalOpen] = useState(false);

  const filteredEnquiries = enquiriesData.filter((e) => {
    if (cityFilter !== 'all' && e.city !== cityFilter) return false;
    if (statusFilter !== 'all' && e.status !== statusFilter) return false;
    return true;
  });
  const filteredBookings = bookingsData.filter((b) => {
    if (cityFilter !== 'all' && b.city !== cityFilter) return false;
    if (statusFilter !== 'all' && b.status !== statusFilter) return false;
    return true;
  });

  const paginatedEnquiries = filteredEnquiries.slice((currentPage - 1) * itemsPerPage, currentPage * itemsPerPage);
  const paginatedBookings = filteredBookings.slice((currentPage - 1) * itemsPerPage, currentPage * itemsPerPage);

  const handleTabChange = (tab: string) => { setActiveTab(tab); setCurrentPage(1); setStatusFilter('all'); };

  return (
    <div className="p-4 md:p-8 max-w-[1400px] mx-auto">
      <div className="mb-10">
        <h1 className="text-2xl md:text-4xl font-extrabold text-[#191C1D] mb-3 tracking-tight">Enquiries &amp; Bookings</h1>
        <p className="text-gray-600 text-base max-w-2xl leading-relaxed">Track service requests from discovery to completion. Monitor enquiry conversion and booking success rates.</p>
      </div>

      {/* STATS */}
      <div className="grid grid-cols-2 md:grid-cols-4 gap-4 mb-10">
        <StatCard icon={<MessageSquare size={20} />} iconBg="bg-[#E6F0EB] text-[#006B32]" title="Total Enquiries" value="1,247" trend="+12.5%" trendColor="text-[#006B32]" />
        <StatCard icon={<Clock size={20} />} iconBg="bg-[#FDE8D7] text-[#8A5100]" title="Pending" value="38" trend="" trendColor="text-gray-400" />
        <StatCard icon={<CheckCircle size={20} />} iconBg="bg-[#E6F0EB] text-[#006B32]" title="Confirmed" value="892" trend="+8.3%" trendColor="text-[#006B32]" />
        <StatCard icon={<TrendingUp size={20} />} iconBg="bg-[#E6F0EB] text-[#006B32]" title="Conversion Rate" value="71.5%" trend="+2.1%" trendColor="text-[#006B32]" />
      </div>

      {/* TABS + FILTERS */}
      <div className="flex flex-col md:flex-row justify-between items-start md:items-end mb-8 gap-4">
        <TabBar tabs={tabs} activeTab={activeTab} onTabChange={handleTabChange} />
        <div className="flex flex-wrap items-center gap-3">
          <FilterDropdown label="City" options={cityOptions} value={cityFilter} onChange={(v) => { setCityFilter(v); setCurrentPage(1); }} />
          <FilterDropdown label="Status" options={activeTab === 'enquiries' ? statusOptionsEnq : statusOptionsBook} value={statusFilter} onChange={(v) => { setStatusFilter(v); setCurrentPage(1); }} />
          <ExportButton label="Export" onClick={() => setExportModalOpen(true)} variant="secondary" />
        </div>
      </div>

      {/* ENQUIRIES TAB */}
      {activeTab === 'enquiries' && (
        <div className="bg-white shadow-sm border border-gray-100 overflow-hidden">
          <div className="overflow-x-auto">
            <table className="w-full min-w-[850px] text-left border-collapse">
              <thead>
                <tr className="bg-gray-50/50 text-[10px] font-extrabold text-gray-400 uppercase tracking-widest border-b border-gray-100">
                  <th className="p-5 pl-6">Customer</th>
                  <th className="p-5">Service Needed</th>
                  <th className="p-5">Location</th>
                  <th className="p-5">Status</th>
                  <th className="p-5 pr-6 text-right">Actions</th>
                </tr>
              </thead>
              <tbody className="text-sm">
                {paginatedEnquiries.map((enq) => (
                  <tr key={enq.id} className={`border-b border-gray-50 hover:bg-gray-50/50 transition ${enq.status === 'Pending' ? 'border-l-4 border-l-[#8A5100]' : ''}`}>
                    <td className="p-5 pl-6">
                      <div className="flex items-center gap-3">
                        <div className="w-10 h-10 bg-gray-100 flex items-center justify-center flex-shrink-0"><User size={18} className="text-gray-400" /></div>
                        <div><p className="font-extrabold text-[#191C1D] text-sm">{enq.user}</p><p className="text-[11px] text-gray-400">{enq.date}</p></div>
                      </div>
                    </td>
                    <td className="p-5"><p className="text-sm font-medium text-[#191C1D]">{enq.service}</p></td>
                    <td className="p-5"><p className="text-sm text-gray-500 flex items-center gap-1"><MapPin size={12} /> {enq.city}</p></td>
                    <td className="p-5"><StatusBadge status={enq.status} /></td>
                    <td className="p-5 pr-6 text-right">
                      <button onClick={() => setViewEnquiry(enq)} className="text-[#006B32] text-xs font-bold bg-[#E6F0EB] px-4 py-2 hover:bg-[#d5e8de] transition">View Details</button>
                    </td>
                  </tr>
                ))}
                {paginatedEnquiries.length === 0 && <tr><td colSpan={5} className="p-10 text-center text-gray-400 font-medium">No enquiries match the current filters.</td></tr>}
              </tbody>
            </table>
          </div>
          <div className="mt-8"><Pagination currentPage={currentPage} totalItems={filteredEnquiries.length} itemsPerPage={itemsPerPage} onPageChange={setCurrentPage} itemLabel="enquiries" /></div>
        </div>
      )}

      {/* BOOKINGS TAB */}
      {activeTab === 'bookings' && (
        <div className="bg-white shadow-sm border border-gray-100 overflow-hidden">
          <div className="overflow-x-auto">
            <table className="w-full min-w-[950px] text-left border-collapse">
              <thead>
                <tr className="bg-gray-50/50 text-[10px] font-extrabold text-gray-400 uppercase tracking-widest border-b border-gray-100">
                  <th className="p-5 pl-6">Customer</th>
                  <th className="p-5">Artisan</th>
                  <th className="p-5">Service</th>
                  <th className="p-5">City</th>
                  <th className="p-5">Amount</th>
                  <th className="p-5">Status</th>
                  <th className="p-5 pr-6 text-right">Actions</th>
                </tr>
              </thead>
              <tbody className="text-sm">
                {paginatedBookings.map((bk) => (
                  <tr key={bk.id} className="border-b border-gray-50 hover:bg-gray-50/50 transition">
                    <td className="p-5 pl-6"><p className="font-bold text-sm text-[#191C1D]">{bk.user}</p><p className="text-[11px] text-gray-400">{bk.date}</p></td>
                    <td className="p-5"><p className="text-sm font-medium text-[#191C1D]">{bk.artisan}</p></td>
                    <td className="p-5"><p className="text-sm text-gray-600">{bk.service}</p></td>
                    <td className="p-5"><p className="text-sm text-gray-500">{bk.city}</p></td>
                    <td className="p-5"><p className="font-bold text-sm text-[#191C1D]">{bk.amount}</p></td>
                    <td className="p-5"><StatusBadge status={bk.status} /></td>
                    <td className="p-5 pr-6 text-right">
                      <button onClick={() => setViewBooking(bk)} className="text-[#006B32] text-xs font-bold bg-[#E6F0EB] px-4 py-2 hover:bg-[#d5e8de] transition">View</button>
                    </td>
                  </tr>
                ))}
                {paginatedBookings.length === 0 && <tr><td colSpan={7} className="p-10 text-center text-gray-400 font-medium">No bookings match the current filters.</td></tr>}
              </tbody>
            </table>
          </div>
          <div className="mt-8"><Pagination currentPage={currentPage} totalItems={filteredBookings.length} itemsPerPage={itemsPerPage} onPageChange={setCurrentPage} itemLabel="bookings" /></div>
        </div>
      )}

      {/* MODALS */}
      <Modal isOpen={!!viewEnquiry} onClose={() => setViewEnquiry(null)} title="Enquiry Details" size="md">
        {viewEnquiry && (
          <div className="space-y-5">
            <div className="flex items-center gap-3"><div className="w-12 h-12 bg-gray-100 flex items-center justify-center"><User size={22} className="text-gray-400" /></div><div><p className="font-extrabold text-[#191C1D]">{viewEnquiry.user}</p><p className="text-xs text-gray-400">{viewEnquiry.date}</p></div></div>
            <div className="grid grid-cols-2 gap-4">
              <InfoBlock label="Service" value={viewEnquiry.service} />
              <InfoBlock label="City" value={viewEnquiry.city} />
              <InfoBlock label="Status" value={viewEnquiry.status} />
              <InfoBlock label="Assigned Artisan" value={viewEnquiry.artisan || "Not yet assigned"} />
            </div>
            <div className="bg-[#F8F9FA] p-4 border border-gray-100"><p className="text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-2">Description</p><p className="text-sm text-[#191C1D]">{viewEnquiry.description}</p></div>
            {viewEnquiry.status === 'Pending' && (
              <div className="flex items-center gap-2 text-sm text-[#8A5100] bg-[#FFF8F0] p-4 border border-[#8A5100]/10"><AlertCircle size={16} /> This enquiry is awaiting artisan assignment.</div>
            )}
          </div>
        )}
      </Modal>

      <Modal isOpen={!!viewBooking} onClose={() => setViewBooking(null)} title="Booking Details" size="md">
        {viewBooking && (
          <div className="space-y-5">
            <div className="grid grid-cols-2 gap-4">
              <InfoBlock label="Customer" value={viewBooking.user} />
              <InfoBlock label="Artisan" value={viewBooking.artisan} />
              <InfoBlock label="Service" value={viewBooking.service} />
              <InfoBlock label="City" value={viewBooking.city} />
              <InfoBlock label="Amount" value={viewBooking.amount} />
              <InfoBlock label="Status" value={viewBooking.status} />
              <InfoBlock label="Date" value={viewBooking.date} />
              <InfoBlock label="Rating" value={viewBooking.rating ? `${viewBooking.rating}/5` : "Not rated yet"} />
            </div>
          </div>
        )}
      </Modal>

      <Modal isOpen={exportModalOpen} onClose={() => setExportModalOpen(false)} title="Export Data" size="sm">
        <p className="text-sm text-gray-600 mb-6">Choose a format to export {activeTab} data.</p>
        <div className="space-y-3">
          <button onClick={() => setExportModalOpen(false)} className="w-full text-left p-4 border border-gray-200 hover:bg-gray-50 transition"><p className="font-bold text-[#191C1D] text-sm">CSV File (.csv)</p><p className="text-xs text-gray-500">Spreadsheet-compatible format</p></button>
          <button onClick={() => setExportModalOpen(false)} className="w-full text-left p-4 border border-gray-200 hover:bg-gray-50 transition"><p className="font-bold text-[#191C1D] text-sm">PDF Report (.pdf)</p><p className="text-xs text-gray-500">Formatted report for printing</p></button>
        </div>
      </Modal>
    </div>
  );
}

function InfoBlock({ label, value }: { label: string; value: string }) {
  return (
    <div className="bg-[#F8F9FA] p-4 border border-gray-100">
      <p className="text-[9px] font-bold text-gray-400 uppercase tracking-widest mb-1">{label}</p>
      <p className="font-bold text-[#191C1D] text-sm">{value}</p>
    </div>
  );
}

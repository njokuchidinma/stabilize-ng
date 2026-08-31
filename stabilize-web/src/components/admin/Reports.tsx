"use client";

import { useState } from 'react';
import {
  Calendar, Download, ArrowUp,
  Filter, Star
} from 'lucide-react';
import FilterDropdown from '@/components/admin/generics/FilterDropdown';
import ExportButton from '@/components/admin/generics/ExportButton';
import Modal from '@/components/admin/generics/Modal';

export default function AnalyticsReportsPage() {
  const [cityFilter, setCityFilter] = useState('all');
  const [exportModalOpen, setExportModalOpen] = useState(false);
  const [tableExportOpen, setTableExportOpen] = useState(false);

  const cityOptions = [
    { label: "All Cities", value: "all" }, { label: "Lagos", value: "Lagos" }, { label: "Abuja", value: "Abuja" },
    { label: "Port Harcourt", value: "Port Harcourt" }, { label: "Kano", value: "Kano" }, { label: "Ibadan", value: "Ibadan" },
  ];
  // --- MOCK DATA ---
  const topServices = [
    { name: "Plumbing", req: "3,240 req", percentage: 85, color: "bg-[#006B32]" },
    { name: "Electrical Works", req: "2,105 req", percentage: 65, color: "bg-[#006B32]" },
    { name: "HVAC Repair", req: "1,850 req", percentage: 45, color: "bg-[#006B32]" },
    { name: "Masonry", req: "940 req", percentage: 25, color: "bg-[#006B32]" },
  ];

  const cityPerformance = [
    { city: "Lagos (Ikeja)", artisans: "3,420", rating: "4.8", bookings: "12,402", revenue: "₦24.5M", growth: "+18.2%", isPositive: true },
    { city: "Abuja (FCT)", artisans: "2,105", rating: "4.6", bookings: "8,931", revenue: "₦18.2M", growth: "+12.5%", isPositive: true },
    { city: "Port Harcourt", artisans: "1,850", rating: "4.5", bookings: "6,402", revenue: "₦14.1M", growth: "-2.1%", isPositive: false },
    { city: "Kano", artisans: "1,240", rating: "4.3", bookings: "4,209", revenue: "₦8.4M", growth: "+5.8%", isPositive: true },
    { city: "Ibadan", artisans: "980", rating: "4.7", bookings: "3,850", revenue: "₦6.2M", growth: "+24.1%", isPositive: true },
  ];

  return (
    <div className="p-4 md:p-8 max-w-[1400px] mx-auto">

      {/* =========================================
          1. PAGE HEADER & CONTROLS
          ========================================= */}
      <div className="flex flex-col md:flex-row justify-between items-start md:items-end mb-10 gap-6">
        <div>
          <h1 className="text-2xl md:text-4xl font-extrabold text-[#191C1D] mb-2 tracking-tight">Analytics Reports</h1>
          <p className="text-[#006B32] font-semibold text-sm">Performance insights across Nigeria</p>
        </div>

        <div className="flex flex-wrap items-center gap-3 w-full md:w-auto">
          <button className="flex items-center gap-2 bg-[#F3F4F5] text-[#191C1D] px-5 py-3 rounded-none font-bold text-sm hover:bg-gray-200 transition">
            <Calendar size={16} className="text-[#191C1D]" /> Oct 01 - Oct 31, 2023
          </button>
          <FilterDropdown label="All Cities" options={cityOptions} value={cityFilter} onChange={setCityFilter} />
          <ExportButton label="Export CSV" onClick={() => setExportModalOpen(true)} variant="primary" />
        </div>
      </div>

      {/* =========================================
          2. METRICS GRID
          ========================================= */}
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 mb-10">

        {/* Total Users */}
        <div className="bg-white rounded-none p-6 shadow-sm border border-gray-100 flex flex-col justify-between relative overflow-hidden">
          <p className="text-xs font-bold text-gray-500 mb-2">Total Users</p>
          <div className="flex items-end gap-3 mb-4">
            <p className="text-4xl font-extrabold text-[#191C1D]">42,892</p>
            <span className="flex items-center gap-0.5 text-[#006B32] bg-[#E6F0EB] px-2 py-0.5 rounded text-[10px] font-extrabold mb-1">
              <ArrowUp size={10} strokeWidth={3} /> 12%
            </span>
          </div>
          <div className="absolute bottom-0 left-6 right-6 h-1 bg-[#006B32] rounded-t-none"></div>
        </div>

        {/* Artisans */}
        <div className="bg-white rounded-none p-6 shadow-sm border border-gray-100 flex flex-col justify-between relative overflow-hidden">
          <p className="text-xs font-bold text-gray-500 mb-2">Artisans</p>
          <div className="flex items-end gap-3 mb-4">
            <p className="text-4xl font-extrabold text-[#191C1D]">8,420</p>
            <span className="flex items-center gap-0.5 text-[#8A5100] bg-[#FDE8D7] px-2 py-0.5 rounded text-[10px] font-extrabold mb-1">
              <ArrowUp size={10} strokeWidth={3} /> 8.4%
            </span>
          </div>
          <div className="absolute bottom-0 left-6 right-6 h-1 bg-[#8A5100] rounded-t-none"></div>
        </div>

        {/* New Enquiries */}
        <div className="bg-white rounded-none p-6 shadow-sm border border-gray-100 flex flex-col justify-between relative overflow-hidden">
          <p className="text-xs font-bold text-gray-500 mb-2">New Enquiries</p>
          <div className="flex items-end gap-3 mb-4">
            <p className="text-4xl font-extrabold text-[#191C1D]">1,204</p>
            <span className="flex items-center gap-0.5 text-[#006B32] bg-[#E6F0EB] px-2 py-0.5 rounded text-[10px] font-extrabold mb-1">
              <ArrowUp size={10} strokeWidth={3} /> 15%
            </span>
          </div>
          <div className="absolute bottom-0 left-6 right-6 h-1 bg-[#6EE7B7] rounded-t-none"></div>
        </div>

        {/* Bookings */}
        <div className="bg-white rounded-none p-6 shadow-sm border border-gray-100 flex flex-col justify-between relative overflow-hidden">
          <p className="text-xs font-bold text-gray-500 mb-2">Bookings</p>
          <div className="flex items-end gap-3 mb-4">
            <p className="text-4xl font-extrabold text-[#191C1D]">5,931</p>
            <span className="flex items-center gap-0.5 text-[#006B32] bg-[#E6F0EB] px-2 py-0.5 rounded text-[10px] font-extrabold mb-1">
              <ArrowUp size={10} strokeWidth={3} /> 21%
            </span>
          </div>
          <div className="absolute bottom-0 left-6 right-6 h-1 bg-[#004722] rounded-t-none"></div>
        </div>

      </div>

      {/* =========================================
          3. CHARTS AND TOP SERVICES
          ========================================= */}
      <div className="grid grid-cols-1 lg:grid-cols-3 gap-6 mb-10">

        {/* Growth Overview Line Chart */}
        <div className="lg:col-span-2 bg-white rounded-none p-8 shadow-sm border border-gray-100 flex flex-col min-h-[350px]">
          <div className="flex justify-between items-start mb-8">
            <div>
              <h3 className="text-xl font-extrabold text-[#191C1D]">Growth Overview</h3>
              <p className="text-xs text-gray-500 mt-1">Monthly user vs artisan registration</p>
            </div>
            <div className="flex items-center gap-4 text-xs font-extrabold">
              <span className="flex items-center gap-1.5 text-[#191C1D]"><div className="w-2.5 h-2.5 rounded-full bg-[#006B32]"></div> Users</span>
              <span className="flex items-center gap-1.5 text-[#191C1D]"><div className="w-2.5 h-2.5 rounded-full bg-[#8A5100]"></div> Artisans</span>
            </div>
          </div>

          {/* Custom SVG Line Chart */}
          <div className="flex-1 relative w-full h-full mt-4">
            <svg viewBox="0 0 800 300" className="w-full h-full overflow-visible" preserveAspectRatio="none">
              {/* Users Line (Green) */}
              <path
                d="M 0 250 L 100 220 L 200 240 L 300 120 L 400 160 L 500 50 L 600 70 L 700 0 L 800 20"
                fill="none"
                stroke="#006B32"
                strokeWidth="4"
                strokeLinecap="round"
                strokeLinejoin="round"
              />
              {/* Artisans Line (Brown/Orange) */}
              <path
                d="M 0 280 L 100 250 L 200 245 L 300 220 L 400 200 L 500 170 L 600 160 L 700 140 L 800 100"
                fill="none"
                stroke="#8A5100"
                strokeWidth="4"
                strokeLinecap="round"
                strokeLinejoin="round"
              />
            </svg>

            {/* X-Axis Labels */}
            <div className="absolute -bottom-6 left-0 right-0 flex justify-between text-[10px] font-extrabold text-gray-400 uppercase tracking-widest">
              <span>Jan</span>
              <span>Mar</span>
              <span>May</span>
              <span>Jul</span>
              <span>Sep</span>
              <span>Nov</span>
            </div>
          </div>
        </div>

        {/* Top Services Bars */}
        <div className="bg-white rounded-none p-8 shadow-sm border border-gray-100 flex flex-col justify-between">
          <div>
            <h3 className="text-xl font-extrabold text-[#191C1D] mb-8">Top Services</h3>

            <div className="space-y-6">
              {topServices.map((service, index) => (
                <div key={index}>
                  <div className="flex justify-between items-center mb-2">
                    <span className="text-xs font-extrabold text-[#191C1D]">{service.name}</span>
                    <span className="text-[11px] font-bold text-[#006B32]">{service.req}</span>
                  </div>
                  <div className="w-full h-2.5 bg-[#E6F0EB] rounded-full overflow-hidden">
                    <div className={`h-full ${service.color} rounded-full`} style={{ width: `${service.percentage}%` }}></div>
                  </div>
                </div>
              ))}
            </div>
          </div>

          <button className="w-full mt-8 bg-[#F8F9FA] text-[#006B32] font-extrabold py-3.5 rounded-none text-xs hover:bg-[#E6F0EB] transition">
            View Detailed Category Report
          </button>
        </div>

      </div>

      {/* =========================================
          4. CITY PERFORMANCE TABLE
          ========================================= */}
      <div className="bg-white rounded-none shadow-sm border border-gray-100 overflow-hidden">

        {/* Table Header Controls */}
        <div className="p-6 md:p-8 border-b border-gray-100 flex flex-col md:flex-row items-start md:items-center justify-between gap-4">
          <div>
            <h3 className="text-xl font-extrabold text-[#191C1D]">City Performance</h3>
            <p className="text-xs text-gray-500 mt-1">Comparison of activity across major Nigerian hubs</p>
          </div>
          <div className="flex items-center gap-3">
            <button className="flex items-center gap-2 text-xs font-bold text-gray-700 bg-white border border-gray-200 px-5 py-2.5 rounded-none hover:bg-gray-50 transition shadow-sm">
              <Filter size={14} /> Filter Columns
            </button>
            <button onClick={() => setTableExportOpen(true)} className="flex items-center gap-2 text-xs font-bold text-gray-700 bg-white border border-gray-200 px-5 py-2.5 rounded-none hover:bg-gray-50 transition shadow-sm">
              <Download size={14} /> Export Table
            </button>
          </div>
        </div>

        {/* Table Content */}
        <div className="overflow-x-auto">
          <table className="w-full text-left border-collapse">
            <thead>
              <tr className="bg-gray-50/50 text-[10px] font-extrabold text-gray-400 uppercase tracking-widest border-b border-gray-100">
                <th className="p-5 pl-8">City</th>
                <th className="p-5">Active Artisans</th>
                <th className="p-5">Avg. Rating</th>
                <th className="p-5">Total Bookings</th>
                <th className="p-5">Revenue (₦)</th>
                <th className="p-5 pr-8 text-right">Growth</th>
              </tr>
            </thead>
            <tbody className="text-sm">
              {cityPerformance.map((row, index) => (
                <tr key={index} className="border-b border-gray-50 hover:bg-gray-50/50 transition">
                  <td className="p-5 pl-8">
                    <p className="font-extrabold text-[#191C1D]">{row.city.split(' ')[0]}</p>
                    {row.city.split(' ')[1] && (
                      <p className="text-xs text-gray-500">{row.city.split(' ')[1]}</p>
                    )}
                  </td>
                  <td className="p-5 font-semibold text-[#191C1D]">{row.artisans}</td>
                  <td className="p-5">
                    <span className="flex items-center gap-1.5 font-bold text-[#8A5100]">
                      <Star size={14} fill="currentColor" /> {row.rating}
                    </span>
                  </td>
                  <td className="p-5 font-semibold text-[#191C1D]">{row.bookings}</td>
                  <td className="p-5 font-extrabold text-[#006B32]">{row.revenue}</td>
                  <td className="p-5 pr-8 text-right">
                    <span className={`font-extrabold text-xs ${row.isPositive ? 'text-[#006B32]' : 'text-red-500'}`}>
                      {row.growth}
                    </span>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>

      </div>

      {/* MODALS */}
      <Modal isOpen={exportModalOpen} onClose={() => setExportModalOpen(false)} title="Export Report" size="sm">
        <p className="text-sm text-gray-600 mb-6">Choose a format to export analytics data.</p>
        <div className="space-y-3">
          <button onClick={() => setExportModalOpen(false)} className="w-full text-left p-4 rounded-none border border-gray-200 hover:bg-gray-50 transition"><p className="font-bold text-[#191C1D] text-sm">CSV File (.csv)</p><p className="text-xs text-gray-500">Spreadsheet-compatible format</p></button>
          <button onClick={() => setExportModalOpen(false)} className="w-full text-left p-4 rounded-none border border-gray-200 hover:bg-gray-50 transition"><p className="font-bold text-[#191C1D] text-sm">PDF Report (.pdf)</p><p className="text-xs text-gray-500">Formatted report for printing</p></button>
        </div>
      </Modal>

      <Modal isOpen={tableExportOpen} onClose={() => setTableExportOpen(false)} title="Export Table" size="sm">
        <p className="text-sm text-gray-600 mb-6">Export city performance table data.</p>
        <div className="space-y-3">
          <button onClick={() => setTableExportOpen(false)} className="w-full text-left p-4 rounded-none border border-gray-200 hover:bg-gray-50 transition"><p className="font-bold text-[#191C1D] text-sm">CSV File (.csv)</p><p className="text-xs text-gray-500">Raw tabular data</p></button>
          <button onClick={() => setTableExportOpen(false)} className="w-full text-left p-4 rounded-none border border-gray-200 hover:bg-gray-50 transition"><p className="font-bold text-[#191C1D] text-sm">PDF Report (.pdf)</p><p className="text-xs text-gray-500">Formatted table report</p></button>
        </div>
      </Modal>

    </div>
  );
}

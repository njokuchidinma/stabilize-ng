"use client";

import { useState } from 'react';
import Image from 'next/image';
import {
  Users, UserCheck, TrendingUp, ShieldCheck,
  AlertTriangle, Zap, Star,
  Lightbulb, MapPin
} from 'lucide-react';
import Modal from '@/components/admin/generics/Modal';
import ExportButton from '@/components/admin/generics/ExportButton';

export default function DashboardOverviewPage() {
  const [chartPeriod, setChartPeriod] = useState<'7d' | '30d'>('7d');
  const [exportModalOpen, setExportModalOpen] = useState(false);
  const [campaignModalOpen, setCampaignModalOpen] = useState(false);
  const [campaignName, setCampaignName] = useState('');
  const [campaignDesc, setCampaignDesc] = useState('');

  return (
    <div className="p-4 md:p-8 max-w-[1400px] mx-auto">

      {/* =========================================
          1. PAGE HEADER
          ========================================= */}
      <div className="flex flex-col md:flex-row justify-between items-start md:items-center mb-8 gap-4">
        <div>
          <h1 className="text-3xl font-extrabold text-[#191C1D]">Overview</h1>
          <p className="text-sm text-gray-500 mt-1">Real-time performance metrics for Stabilize NG</p>
        </div>

        <div className="flex items-center gap-3 w-full md:w-auto">
          <ExportButton label="Export Report" onClick={() => setExportModalOpen(true)} variant="secondary" />
          <button onClick={() => setCampaignModalOpen(true)} className="bg-[#006B32] text-white px-5 py-2.5 font-bold flex items-center gap-2 hover:bg-[#005a2a] transition shadow-sm whitespace-nowrap text-sm">
            Create New Campaign
          </button>
        </div>
      </div>

      {/* =========================================
          2. TOP METRICS GRID
          ========================================= */}
      <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-6">

        {/* Total Users */}
        <div className="bg-white p-8 shadow-sm border border-gray-100 flex flex-col justify-between">
          <div className="w-12 h-12 bg-[#E6F0EB] text-[#006B32] flex items-center justify-center mb-6">
            <Users size={24} />
          </div>
          <div>
            <p className="text-[10px] font-extrabold text-gray-500 uppercase tracking-widest mb-2">Total Users</p>
            <p className="text-5xl font-extrabold text-[#191C1D] mb-4">25k</p>
            <div className="inline-flex items-center gap-1.5 bg-[#E6F0EB] px-2.5 py-1">
              <TrendingUp size={12} className="text-[#006B32]" />
              <span className="text-[10px] font-extrabold text-[#006B32] tracking-wide">+12% vs last month</span>
            </div>
          </div>
        </div>

        {/* Total Artisans */}
        <div className="bg-white p-8 shadow-sm border border-gray-100 flex flex-col justify-between">
          <div className="w-12 h-12 bg-[#FDE8D7] text-[#8A5100] flex items-center justify-center mb-6">
            <UserCheck size={24} />
          </div>
          <div>
            <p className="text-[10px] font-extrabold text-gray-500 uppercase tracking-widest mb-2">Total Artisans</p>
            <p className="text-5xl font-extrabold text-[#191C1D] mb-4">5k</p>
            <div className="inline-flex items-center gap-1.5 bg-[#FDF9F1] px-2.5 py-1 border border-[#FDE8D7]">
              <ShieldCheck size={12} className="text-[#8A5100]" />
              <span className="text-[10px] font-extrabold text-[#8A5100] tracking-wide">98% Verification Rate</span>
            </div>
          </div>
        </div>

        {/* Right Stack (Enquiries/Bookings & Rating) */}
        <div className="flex flex-col gap-6">

          {/* Split Row */}
          <div className="grid grid-cols-2 gap-6 flex-1">
            <div className="bg-white p-6 shadow-sm border border-gray-100 flex flex-col justify-center">
              <p className="text-[9px] font-extrabold text-gray-500 uppercase tracking-widest mb-1">Pending Enquiries</p>
              <p className="text-3xl font-extrabold text-[#191C1D] mb-2">124</p>
              <p className="text-[10px] font-bold text-red-500 flex items-center gap-1">
                <AlertTriangle size={12} /> Priority
              </p>
            </div>

            <div className="bg-white p-6 shadow-sm border border-gray-100 flex flex-col justify-center">
              <p className="text-[9px] font-extrabold text-gray-500 uppercase tracking-widest mb-1">Active Bookings</p>
              <p className="text-3xl font-extrabold text-[#191C1D] mb-2">45</p>
              <p className="text-[10px] font-bold text-[#006B32] flex items-center gap-1">
                <Zap size={12} /> Live now
              </p>
            </div>
          </div>

          {/* Average Rating (Green Solid Card) */}
          <div className="bg-[#006B32] p-6 shadow-sm flex items-center justify-between text-white flex-1 relative overflow-hidden">
            <div>
              <p className="text-[10px] font-extrabold text-white/80 uppercase tracking-widest mb-1">Average Rating</p>
              <p className="text-4xl font-extrabold">4.9</p>
            </div>
            <div className="text-right z-10">
              <div className="flex gap-1 mb-1.5 justify-end">
                {[1, 2, 3, 4, 5].map((i) => (
                  <Star key={i} size={16} className="text-[#F59E0B]" fill="currentColor" />
                ))}
              </div>
              <p className="text-[9px] font-extrabold text-white/80">Global Service Standard</p>
            </div>
          </div>

        </div>
      </div>

      {/* =========================================
          3. CHARTS & HEALTH GRID
          ========================================= */}
      <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-6">

        {/* City Booking Trends */}
        <div className="md:col-span-2 bg-white p-8 shadow-sm border border-gray-100 flex flex-col">
          <div className="flex justify-between items-start mb-8">
            <div>
              <h3 className="text-xl font-extrabold text-[#191C1D]">City Booking Trends</h3>
              <p className="text-xs text-gray-500">Daily volume for Abuja Metro Area</p>
            </div>
            <div className="flex bg-[#F8F9FA] p-1 border border-gray-100">
              <button onClick={() => setChartPeriod('7d')} className={`text-xs font-bold px-4 py-1.5 transition ${chartPeriod === '7d' ? 'bg-[#006B32] text-white shadow-sm' : 'text-gray-500 hover:text-[#191C1D]'}`}>7 Days</button>
              <button onClick={() => setChartPeriod('30d')} className={`text-xs font-bold px-4 py-1.5 transition ${chartPeriod === '30d' ? 'bg-[#006B32] text-white shadow-sm' : 'text-gray-500 hover:text-[#191C1D]'}`}>30 Days</button>
            </div>
          </div>

          {/* Simple Chart Skeleton */}
          <div className="flex-1 flex flex-col justify-end relative min-h-[180px]">
            {/* Horizontal Grid Lines */}
            <div className="absolute inset-0 flex flex-col justify-between">
              <div className="border-b border-gray-100 w-full h-0"></div>
              <div className="border-b border-gray-100 w-full h-0"></div>
              <div className="border-b border-gray-100 w-full h-0"></div>
              <div className="border-b border-gray-100 w-full h-0"></div>
            </div>

            {/* X-Axis Labels */}
            <div className="flex justify-between text-[10px] font-bold text-gray-400 mt-4 relative z-10 px-2 uppercase tracking-widest">
              <span>Mon</span><span>Tue</span><span>Wed</span><span>Thu</span><span>Fri</span><span>Sat</span><span>Sun</span>
            </div>
          </div>
        </div>

        {/* Market Health */}
        <div className="md:col-span-1 bg-white p-8 shadow-sm border border-gray-100 flex flex-col justify-between">
          <h3 className="text-xl font-extrabold text-[#191C1D] mb-6">Market Health</h3>

          <div className="space-y-6 mb-8">
            {/* Progress Bar 1 */}
            <div>
              <div className="flex justify-between items-center mb-2">
                <span className="text-xs font-extrabold text-[#191C1D]">Server Uptime</span>
                <span className="text-[10px] font-extrabold text-[#006B32] tracking-wider">99.9%</span>
              </div>
              <div className="w-full h-1.5 bg-gray-100 overflow-hidden">
                <div className="w-full h-full bg-[#006B32]"></div>
              </div>
            </div>

            {/* Progress Bar 2 */}
            <div>
              <div className="flex justify-between items-center mb-2">
                <span className="text-xs font-extrabold text-[#191C1D]">Payment Processing</span>
                <span className="text-[10px] font-extrabold tracking-wider text-[#006B32]">Stable</span>
              </div>
              <div className="w-full h-1.5 bg-gray-100 overflow-hidden">
                <div className="w-[85%] h-full bg-[#6EE7B7]"></div>
              </div>
            </div>

            {/* Progress Bar 3 */}
            <div>
              <div className="flex justify-between items-center mb-2">
                <span className="text-xs font-extrabold text-[#191C1D]">API Latency</span>
                <span className="text-[10px] font-extrabold text-[#8A5100] tracking-wider">42ms</span>
              </div>
              <div className="w-full h-1.5 bg-gray-100 overflow-hidden">
                <div className="w-[45%] h-full bg-[#8A5100]"></div>
              </div>
            </div>
          </div>

          {/* Optimization Tip Card */}
          <div className="bg-[#FDF9F1] p-4 border border-[#FDE8D7] flex items-start gap-3">
            <div className="text-[#8A5100] mt-0.5">
              <Lightbulb size={16} />
            </div>
            <div>
              <p className="text-[10px] font-extrabold text-[#191C1D] mb-1 uppercase tracking-widest">Optimization Tip</p>
              <p className="text-[11px] text-gray-600 leading-relaxed">
                Lagos demand is up 40%. Increase artisan outreach.
              </p>
            </div>
          </div>
        </div>

      </div>

      {/* =========================================
          4. REGIONAL FOCUS MAP AREA
          ========================================= */}
      <div className="bg-white shadow-sm border border-gray-100 overflow-hidden relative flex flex-col md:flex-row min-h-[400px]">

        {/* Left Content Area */}
        <div className="w-full md:w-[40%] p-10 md:p-12 relative z-20 bg-white">
          <p className="text-[10px] font-extrabold text-[#006B32] uppercase tracking-widest mb-4">Regional Focus</p>
          <h2 className="text-2xl md:text-4xl font-extrabold text-[#191C1D] leading-[1.1] mb-6">
            Abuja Federal <br /> Capital Territory
          </h2>
          <p className="text-sm text-gray-600 leading-relaxed mb-10 max-w-sm">
            Currently seeing the highest density of plumbing and electrical enquiries. Artisan availability is currently &quot;Sufficient&quot;.
          </p>

          <div className="space-y-4">
            <p className="flex items-center gap-3 text-sm font-extrabold text-[#191C1D]">
              <span className="w-2 h-2 bg-[#006B32]"></span> 12 High-Priority Hubs
            </p>
            <p className="flex items-center gap-3 text-sm font-extrabold text-[#191C1D]">
              <span className="w-2 h-2 bg-[#8A5100]"></span> 3 Active Logistics Delays
            </p>
          </div>
        </div>

        {/* Right Map Image Area */}
        {/* Using a pseudo-element gradient to smoothly fade the image into the white left panel */}
        <div className="w-full md:w-[60%] min-h-[300px] relative z-10">
          <div className="absolute inset-0 bg-gradient-to-r from-white via-white/40 to-transparent z-10 hidden md:block"></div>

          <div className="w-full h-full bg-gray-900 overflow-hidden relative">
            <Image
              src="/images/admin/map-city.png" // Place your dark city map here
              alt="Abuja Map Dashboard"
              fill
              className="object-cover object-left opacity-80"
            />
          </div>

          {/* Floating Map Pins */}
          <div className="absolute z-20 top-[30%] left-[40%]">
            <div className="w-8 h-8 bg-[#006B32] flex items-center justify-center text-white shadow-lg border-2 border-[#1A2E25]">
              <MapPin size={14} />
            </div>
          </div>
          <div className="absolute z-20 bottom-[40%] left-[60%]">
            <div className="w-8 h-8 bg-[#8A5100] flex items-center justify-center text-white shadow-lg border-2 border-[#1A2E25]">
              <Zap size={14} />
            </div>
          </div>
          <div className="absolute z-20 bottom-[20%] right-[20%]">
            <div className="w-8 h-8 bg-[#6EE7B7] flex items-center justify-center text-[#004722] shadow-lg border-2 border-[#1A2E25]">
              <ShieldCheck size={14} />
            </div>
          </div>
        </div>

      </div>

      {/* MODALS */}
      <Modal isOpen={exportModalOpen} onClose={() => setExportModalOpen(false)} title="Export Report" size="sm">
        <p className="text-sm text-gray-600 mb-6">Choose a format to export the dashboard report.</p>
        <div className="space-y-3">
          <button onClick={() => setExportModalOpen(false)} className="w-full text-left p-4 border border-gray-200 hover:bg-gray-50 transition"><p className="font-bold text-[#191C1D] text-sm">CSV File (.csv)</p><p className="text-xs text-gray-500">Raw data for spreadsheet analysis</p></button>
          <button onClick={() => setExportModalOpen(false)} className="w-full text-left p-4 border border-gray-200 hover:bg-gray-50 transition"><p className="font-bold text-[#191C1D] text-sm">PDF Report (.pdf)</p><p className="text-xs text-gray-500">Formatted executive summary</p></button>
        </div>
      </Modal>

      <Modal isOpen={campaignModalOpen} onClose={() => { setCampaignModalOpen(false); setCampaignName(''); setCampaignDesc(''); }} title="Create New Campaign" size="md">
        <div className="space-y-5">
          <div><label className="block text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-2">Campaign Name</label><input type="text" value={campaignName} onChange={(e) => setCampaignName(e.target.value)} placeholder="e.g. Lagos Artisan Outreach" className="w-full border border-gray-200 px-4 py-3 text-sm focus:outline-none focus:border-[#006B32]" /></div>
          <div><label className="block text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-2">Description</label><textarea value={campaignDesc} onChange={(e) => setCampaignDesc(e.target.value)} placeholder="Describe the campaign objective..." className="w-full border border-gray-200 px-4 py-3 text-sm focus:outline-none focus:border-[#006B32] resize-none h-24" /></div>
          <button onClick={() => { setCampaignModalOpen(false); setCampaignName(''); setCampaignDesc(''); }} className="w-full bg-[#006B32] text-white py-3 text-sm font-bold hover:bg-[#005a2a] transition">Launch Campaign</button>
        </div>
      </Modal>

    </div>
  );
}

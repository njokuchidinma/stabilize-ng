"use client";

import { useState } from 'react';
import Image from 'next/image';
import { MapPin, Plus, Clock, Building2, Eye, Edit2, MoreVertical } from 'lucide-react';
import ProgressBar from '@/components/admin/generics/ProgressBar';
import StatusBadge from '@/components/admin/generics/StatusBadge';
import FilterDropdown from '@/components/admin/generics/FilterDropdown';
import ExportButton from '@/components/admin/generics/ExportButton';
import Modal from '@/components/admin/generics/Modal';
import { cityAvailability, getAvailabilityByRegion } from '@/lib/admin/cityAvailability';

export default function CityManagementPage() {
  const [statusFilter, setStatusFilter] = useState('all');
  const [addCityOpen, setAddCityOpen] = useState(false);
  const [viewCity, setViewCity] = useState<typeof citiesData[number] | null>(null);
  const [editCity, setEditCity] = useState<typeof citiesData[number] | null>(null);
  const [exportModalOpen, setExportModalOpen] = useState(false);
  const [menuOpen, setMenuOpen] = useState<number | null>(null);
  const [formName, setFormName] = useState('');
  const [formState, setFormState] = useState('');
  const [formRegion, setFormRegion] = useState(cityAvailability[0]?.region ?? '');

  const citiesData = [
    { name: "Lagos", state: "Lagos State", status: "ACTIVE", users: "8,421", artisans: "1,204", bookings: "15.2k", isReviewing: false },
    { name: "Abuja", state: "FCT", status: "ACTIVE", users: "3,105", artisans: "452", bookings: "6.8k", isReviewing: false },
    { name: "Owerri", state: "Imo State", status: "ACTIVE", users: "942", artisans: "128", bookings: "2.1k", isReviewing: false },
    { name: "Port Harcourt", state: "Rivers State", status: "ACTIVE", users: "1,824", artisans: "310", bookings: "4.5k", isReviewing: false },
    { name: "Kaduna", state: "Kaduna State", status: "REVIEWING", users: "420", artisans: "84", bookings: "1.2k", isReviewing: true },
  ];

  const statusOptions = [{ label: "All", value: "all" }, { label: "Active", value: "ACTIVE" }, { label: "Reviewing", value: "REVIEWING" }];

  const filteredCities = citiesData.filter((c) => statusFilter === 'all' || c.status === statusFilter);
  const selectedAvailability = getAvailabilityByRegion(formRegion) ?? cityAvailability[0];
  const addCityOptions = selectedAvailability?.cities ?? [];
  const resetAddCityForm = () => {
    const firstRegion = cityAvailability[0];
    setFormRegion(firstRegion.region);
    setFormName(firstRegion.cities[0] ?? '');
    setFormState(firstRegion.state);
  };

  return (
    <div className="p-4 md:p-8">
      {/* 1. TOP DASHBOARD CARDS */}
      <div className="grid grid-cols-1 lg:grid-cols-3 gap-6 mb-8">
        {/* Main Expansion Hub Card */}
        <div className="lg:col-span-2 bg-[#006B32] p-8 text-white relative overflow-hidden shadow-sm flex flex-col justify-between min-h-[220px]">
          <Building2 size={180} className="absolute -bottom-10 -right-10 text-white opacity-10 pointer-events-none" strokeWidth={1} />

          <div className="relative z-10 max-w-lg mb-8">
            <h2 className="text-3xl font-extrabold mb-2">Expansion Hub</h2>
            <p className="text-sm text-white/80 leading-relaxed">Manage operational territories across Nigeria. Ensure artisan coverage and local service quality standards.</p>
          </div>

          <div className="relative z-10 flex gap-12">
            <div><p className="text-[10px] font-bold text-white/60 tracking-widest uppercase mb-1">Active Cities</p><p className="text-3xl font-extrabold">05</p></div>
            <div><p className="text-[10px] font-bold text-white/60 tracking-widest uppercase mb-1">Regional Coverage</p><p className="text-3xl font-extrabold">4/6</p></div>
            <div><p className="text-[10px] font-bold text-white/60 tracking-widest uppercase mb-1">Total Users</p><p className="text-3xl font-extrabold">12.8k</p></div>
          </div>
        </div>

        {/* Right Side Actions */}
        <div className="lg:col-span-1 flex flex-col gap-6">
          <button onClick={() => { resetAddCityForm(); setAddCityOpen(true); }} className="flex-1 bg-white p-6 shadow-sm border border-gray-100 flex flex-col items-center justify-center hover:bg-gray-50 transition group">
            <div className="w-12 h-12 bg-[#E6F0EB] text-[#006B32] rounded-full flex items-center justify-center mb-3 group-hover:scale-110 transition-transform relative">
              <MapPin size={20} />
              <div className="absolute top-0 right-0 bg-white rounded-full"><Plus size={12} className="text-[#006B32]" /></div>
            </div>
            <span className="font-extrabold text-[#191C1D]">Add New City</span>
          </button>

          <div className="bg-[#8A5100] p-6 text-white shadow-sm relative overflow-hidden flex flex-col justify-center">
            <div className="absolute top-4 right-4 bg-white/20 px-2 py-1 rounded text-[9px] font-bold tracking-wider uppercase">Alert</div>
            <div className="flex items-center gap-3 mb-2"><Clock size={16} className="text-white/80" /><span className="text-xs font-semibold text-white/80">Pending Requests</span></div>
            <p className="text-xl font-extrabold">Kano (84)</p>
          </div>
        </div>
      </div>

      {/* 2. TERRITORY DIRECTORY TABLE */}
      <div className="bg-white shadow-sm border border-gray-100 mb-8 overflow-hidden">
        <div className="p-6 border-b border-gray-100 flex items-center justify-between">
          <div>
            <h3 className="text-xl font-extrabold text-[#191C1D]">Territory Directory</h3>
            <p className="text-xs text-gray-500 mt-1">Overview of all active and inactive operational zones</p>
          </div>
          <div className="flex items-center gap-4">
            <FilterDropdown label="Status" options={statusOptions} value={statusFilter} onChange={setStatusFilter} />
            <ExportButton label="Export" onClick={() => setExportModalOpen(true)} variant="secondary" />
          </div>
        </div>

        <div className="overflow-x-auto">
          <table className="w-full text-left border-collapse">
            <thead>
              <tr className="bg-gray-50/50 text-[10px] font-bold text-gray-400 uppercase tracking-widest border-b border-gray-100">
                <th className="p-4 pl-6">City Name</th><th className="p-4">State</th><th className="p-4">Status</th><th className="p-4">Users</th><th className="p-4">Artisans</th><th className="p-4">Bookings</th><th className="p-4 pr-6">Actions</th>
              </tr>
            </thead>
            <tbody className="text-sm">
              {filteredCities.map((city, index) => (
                <tr key={index} className={`border-b border-gray-50 hover:bg-gray-50/50 transition ${city.isReviewing ? 'bg-[#FDF9F1]/30' : ''}`}>
                  <td className="p-4 pl-6"><p className="font-extrabold text-[#191C1D]">{city.name}</p></td>
                  <td className="p-4 text-gray-600">{city.state}</td>
                  <td className="p-4"><StatusBadge status={city.status === 'REVIEWING' ? 'Pending' : 'Active'} variant="dot" /></td>
                  <td className="p-4 font-semibold text-[#191C1D]">{city.users}</td>
                  <td className="p-4 font-semibold text-[#191C1D]">{city.artisans}</td>
                  <td className="p-4 font-semibold text-[#191C1D]">{city.bookings}</td>
                  <td className="p-4 pr-6">
                    <div className="relative inline-block">
                      <button onClick={() => setMenuOpen(menuOpen === index ? null : index)} className="p-2 hover:bg-gray-100 transition"><MoreVertical size={18} className="text-gray-400" /></button>
                      {menuOpen === index && (
                        <div className="absolute right-0 top-full mt-1 bg-white border border-gray-200 shadow-lg py-1 z-30 min-w-[140px]">
                          <button onClick={() => { setViewCity(city); setMenuOpen(null); }} className="w-full text-left px-4 py-2.5 text-sm font-medium hover:bg-gray-50 flex items-center gap-2"><Eye size={14} /> View</button>
                          <button onClick={() => { setEditCity(city); setFormName(city.name); setFormState(city.state); setMenuOpen(null); }} className="w-full text-left px-4 py-2.5 text-sm font-medium hover:bg-gray-50 flex items-center gap-2"><Edit2 size={14} /> Edit</button>
                        </div>
                      )}
                    </div>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>

      {/* 3. BOTTOM METRICS & MAP */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">

        {/* Regional Distribution */}
        <div className="bg-white p-8 shadow-sm border border-gray-100 flex flex-col justify-between">
          <div>
            <h3 className="text-xl font-extrabold text-[#191C1D] mb-1">Regional Distribution</h3>
            <p className="text-xs text-gray-500 mb-8">Breakdown of operational capacity by geopolitical zone</p>

            <div className="space-y-6">
              <ProgressBar label="SOUTH WEST" percentage={45} />
              <ProgressBar label="NORTH CENTRAL" percentage={25} />
              <ProgressBar label="SOUTH EAST" percentage={15} />
              <ProgressBar label="SOUTH SOUTH" percentage={15} />
            </div>
          </div>

          <div className="flex gap-4 mt-8">
            <div className="flex-1 bg-[#F8F9FA] p-4 border border-gray-100">
              <p className="text-[9px] font-bold text-gray-400 tracking-widest uppercase mb-1">Top Performing</p>
              <p className="text-lg font-extrabold text-[#006B32]">Lagos</p>
            </div>
            <div className="flex-1 bg-[#F8F9FA] p-4 border border-gray-100">
              <p className="text-[9px] font-bold text-gray-400 tracking-widest uppercase mb-1">Fastest Growth</p>
              <p className="text-lg font-extrabold text-[#8A5100]">Abuja</p>
            </div>
          </div>
        </div>

        {/* Real-time Connectivity Map */}
        <div className="bg-gradient-to-br from-[#0B1519] to-[#1A2E25] p-8 shadow-sm relative overflow-hidden flex flex-col justify-end min-h-[350px]">
          <div className="absolute inset-0 flex items-center justify-center p-8 opacity-90">
             <Image src="/images/admin/nigeria-map.png" alt="Nigeria Map" fill className="object-contain p-8" />
          </div>
          <div className="relative z-10">
            <div className="flex items-center gap-2 mb-2">
              <div className="w-2 h-2 rounded-full bg-[#6EE7B7] animate-pulse"></div>
              <span className="text-[10px] font-bold text-[#6EE7B7] tracking-widest uppercase">Network Map</span>
            </div>
            <h3 className="text-xl font-extrabold text-white mb-1">Real-time Service Connectivity</h3>
            <p className="text-xs text-white/60">Updated every 5 minutes from city node points</p>
          </div>
        </div>

      </div>

      {/* MODALS */}
      <Modal isOpen={addCityOpen} onClose={() => setAddCityOpen(false)} title="Add New City" size="md">
        <div className="space-y-5">
          <div>
            <label className="block text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-2">Region</label>
            <select
              value={formRegion}
              onChange={(e) => {
                const nextRegion = e.target.value;
                const nextAvailability = getAvailabilityByRegion(nextRegion);
                setFormRegion(nextRegion);
                setFormName(nextAvailability?.cities[0] ?? '');
                setFormState(nextAvailability?.state ?? '');
              }}
              className="w-full border border-gray-200 px-4 py-3 text-sm focus:outline-none focus:border-[#006B32] bg-white"
            >
              {cityAvailability.map((entry) => (
                <option key={`${entry.region}-${entry.state}`} value={entry.region}>{entry.region}</option>
              ))}
            </select>
          </div>
          <div>
            <label className="block text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-2">Available City</label>
            <select
              value={formName}
              onChange={(e) => {
                setFormName(e.target.value);
                setFormState(selectedAvailability?.state ?? '');
              }}
              className="w-full border border-gray-200 px-4 py-3 text-sm focus:outline-none focus:border-[#006B32] bg-white"
            >
              {addCityOptions.map((city) => (
                <option key={city} value={city}>{city}</option>
              ))}
            </select>
          </div>
          <div>
            <label className="block text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-2">State</label>
            <input type="text" value={formState} readOnly className="w-full border border-gray-200 bg-[#F8F9FA] px-4 py-3 text-sm focus:outline-none" />
          </div>
          <button onClick={() => setAddCityOpen(false)} className="w-full bg-[#006B32] text-white py-3 text-sm font-bold hover:bg-[#005a2a] transition mt-4">Add City</button>
        </div>
      </Modal>

      <Modal isOpen={!!viewCity} onClose={() => setViewCity(null)} title="City Details" size="md">
        {viewCity && (
          <div className="grid grid-cols-2 gap-4">
            <div className="bg-[#F8F9FA] p-4 border border-gray-100"><p className="text-[9px] font-bold text-gray-400 uppercase tracking-widest mb-1">City</p><p className="font-bold text-[#191C1D] text-sm">{viewCity.name}</p></div>
            <div className="bg-[#F8F9FA] p-4 border border-gray-100"><p className="text-[9px] font-bold text-gray-400 uppercase tracking-widest mb-1">State</p><p className="font-bold text-[#191C1D] text-sm">{viewCity.state}</p></div>
            <div className="bg-[#F8F9FA] p-4 border border-gray-100"><p className="text-[9px] font-bold text-gray-400 uppercase tracking-widest mb-1">Users</p><p className="font-bold text-[#191C1D] text-sm">{viewCity.users}</p></div>
            <div className="bg-[#F8F9FA] p-4 border border-gray-100"><p className="text-[9px] font-bold text-gray-400 uppercase tracking-widest mb-1">Artisans</p><p className="font-bold text-[#191C1D] text-sm">{viewCity.artisans}</p></div>
            <div className="bg-[#F8F9FA] p-4 border border-gray-100"><p className="text-[9px] font-bold text-gray-400 uppercase tracking-widest mb-1">Bookings</p><p className="font-bold text-[#191C1D] text-sm">{viewCity.bookings}</p></div>
            <div className="bg-[#F8F9FA] p-4 border border-gray-100"><p className="text-[9px] font-bold text-gray-400 uppercase tracking-widest mb-1">Status</p><p className="font-bold text-[#191C1D] text-sm">{viewCity.status}</p></div>
          </div>
        )}
      </Modal>

      <Modal isOpen={!!editCity} onClose={() => setEditCity(null)} title="Edit City" size="md">
        <div className="space-y-5">
          <div><label className="block text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-2">City Name</label><input type="text" value={formName} onChange={(e) => setFormName(e.target.value)} className="w-full border border-gray-200 px-4 py-3 text-sm focus:outline-none focus:border-[#006B32]" /></div>
          <div><label className="block text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-2">State</label><input type="text" value={formState} onChange={(e) => setFormState(e.target.value)} className="w-full border border-gray-200 px-4 py-3 text-sm focus:outline-none focus:border-[#006B32]" /></div>
          <button onClick={() => setEditCity(null)} className="w-full bg-[#006B32] text-white py-3 text-sm font-bold hover:bg-[#005a2a] transition mt-4">Save Changes</button>
        </div>
      </Modal>

      <Modal isOpen={exportModalOpen} onClose={() => setExportModalOpen(false)} title="Export Data" size="sm">
        <p className="text-sm text-gray-600 mb-6">Choose a format to export city data.</p>
        <div className="space-y-3">
          <button onClick={() => setExportModalOpen(false)} className="w-full text-left p-4 border border-gray-200 hover:bg-gray-50 transition"><p className="font-bold text-[#191C1D] text-sm">CSV File (.csv)</p><p className="text-xs text-gray-500">Spreadsheet-compatible</p></button>
          <button onClick={() => setExportModalOpen(false)} className="w-full text-left p-4 border border-gray-200 hover:bg-gray-50 transition"><p className="font-bold text-[#191C1D] text-sm">PDF Report (.pdf)</p><p className="text-xs text-gray-500">Formatted report</p></button>
        </div>
      </Modal>

    </div>
  );
}

"use client";

import { useState } from 'react';
import {
  Edit2, MapPin, Plus, SlidersHorizontal, Palette,
  ShieldAlert, Mail, MessageSquare, CheckCircle, AlertCircle
} from 'lucide-react';
import ToggleRow from '@/components/admin/generics/ToggleRow';
import Modal from '@/components/admin/generics/Modal';
import ConfirmModal from '@/components/admin/generics/ConfirmModal';

export default function SystemSettingsPage() {
  const [editPlatformOpen, setEditPlatformOpen] = useState(false);
  const [configModalOpen, setConfigModalOpen] = useState(false);
  const [assetsModalOpen, setAssetsModalOpen] = useState(false);
  const [auditModalOpen, setAuditModalOpen] = useState(false);
  const [shutdownModalOpen, setShutdownModalOpen] = useState(false);
  const [editNotifOpen, setEditNotifOpen] = useState(false);

  return (
    <div className="p-4 md:p-8 max-w-7xl mx-auto">

      {/* =========================================
          PAGE HEADER
          ========================================= */}
      <div className="flex items-center gap-4 mb-12">
        <h1 className="text-2xl md:text-3xl font-extrabold text-[#006B32]">System Settings</h1>
        <span className="bg-[#E6F0EB] text-[#006B32] text-[10px] font-extrabold px-3 py-1.5 rounded-full uppercase tracking-widest">
          Super Admin Only
        </span>
      </div>

      <div className="space-y-12">

        {/* =========================================
            1. PLATFORM IDENTITY
            ========================================= */}
        <section className="grid lg:grid-cols-12 gap-8 border-b border-gray-100 pb-12">
          <div className="lg:col-span-4">
            <h2 className="text-xl font-extrabold text-[#191C1D] mb-2">Platform Identity</h2>
            <p className="text-sm text-gray-500 leading-relaxed max-w-sm">
              Core branding and deployment metadata for Stabilize NG portal.
            </p>
          </div>
          <div className="lg:col-span-8 bg-white rounded-none p-8 shadow-sm border border-gray-100 relative">
            <button onClick={() => setEditPlatformOpen(true)} className="absolute top-6 right-6 flex items-center gap-2 text-sm font-bold text-[#006B32] hover:underline">
              <Edit2 size={14} /> Edit Card
            </button>

            <div className="grid md:grid-cols-2 gap-8">
              <div>
                <p className="text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-1">Platform Name</p>
                <p className="text-lg font-extrabold text-[#191C1D]">Stabilize NG Admin</p>
              </div>
              <div>
                <p className="text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-1">Environment</p>
                <p className="text-lg font-extrabold text-[#006B32]">Production (V 2.4.1)</p>
              </div>
              <div className="md:col-span-2">
                <p className="text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-1">Global Support Email</p>
                <p className="text-lg font-extrabold text-[#191C1D]">ops-support@stabilize.ng</p>
              </div>
            </div>
          </div>
        </section>

        {/* =========================================
            2. CITY AVAILABILITY
            ========================================= */}
        <section className="grid lg:grid-cols-12 gap-8 border-b border-gray-100 pb-12">
          <div className="lg:col-span-4">
            <h2 className="text-xl font-extrabold text-[#191C1D] mb-2">City Availability</h2>
            <p className="text-sm text-gray-500 leading-relaxed max-w-sm">
              Toggle service availability across major Nigerian metropolitan hubs.
            </p>
          </div>
          <div className="lg:col-span-8 bg-white rounded-none p-8 shadow-sm border border-gray-100">
            <div className="flex items-center justify-between mb-6">
              <h3 className="font-extrabold text-sm text-[#191C1D]">Manage Node Status</h3>
              <button className="flex items-center gap-1 text-[10px] font-bold text-[#006B32] uppercase tracking-widest hover:underline">
                <Plus size={12} /> New Region
              </button>
            </div>

            <div className="space-y-4">
              <ToggleRow icon={MapPin} title="Lagos State" subtitle="2,450 Artisans Active" isActive={true} />
              <ToggleRow icon={MapPin} title="Abuja (FCT)" subtitle="1,120 Artisans Active" isActive={true} />
              <ToggleRow icon={MapPin} title="Port Harcourt" subtitle="Maintenance Mode" isActive={false} />
            </div>
          </div>
        </section>

        {/* =========================================
            3. CONFIGS, APPEARANCE, SECURITY (3 Cols)
            ========================================= */}
        <section className="grid md:grid-cols-3 gap-6 border-b border-gray-100 pb-12">

          {/* Default Configs */}
          <div className="bg-white rounded-none p-8 shadow-sm border border-gray-100 flex flex-col h-full">
            <div className="w-10 h-10 bg-[#FDE8D7] text-[#8A5100] rounded-none flex items-center justify-center mb-6">
              <SlidersHorizontal size={20} />
            </div>
            <h3 className="text-lg font-extrabold text-[#191C1D] mb-2">Default Configs</h3>
            <p className="text-xs text-gray-500 mb-6 flex-1">Global variables for pricing and timeout limits.</p>

            <div className="space-y-3 mb-6">
              <div className="bg-[#F8F9FA] rounded-none p-3 border border-gray-100">
                <p className="text-[9px] font-bold text-gray-400 uppercase tracking-widest mb-1">Service Fee</p>
                <p className="font-bold text-[#191C1D] text-sm">15.00%</p>
              </div>
              <div className="bg-[#F8F9FA] rounded-none p-3 border border-gray-100">
                <p className="text-[9px] font-bold text-gray-400 uppercase tracking-widest mb-1">Payout Cycle</p>
                <p className="font-bold text-[#191C1D] text-sm">Every 48 Hours</p>
              </div>
            </div>
            <button onClick={() => setConfigModalOpen(true)} className="w-full bg-[#F3F4F5] text-gray-700 font-bold py-2.5 rounded-none text-sm hover:bg-gray-200 transition mt-auto">
              Configure System
            </button>
          </div>

          {/* Appearance */}
          <div className="bg-white rounded-none p-8 shadow-sm border border-gray-100 flex flex-col h-full">
            <div className="w-10 h-10 bg-[#E6F0EB] text-[#006B32] rounded-none flex items-center justify-center mb-6">
              <Palette size={20} />
            </div>
            <h3 className="text-lg font-extrabold text-[#191C1D] mb-2">Appearance</h3>
            <p className="text-xs text-gray-500 mb-6 flex-1">UI Theme, Logo assets, and editorial styles.</p>

            <div className="mb-6">
              <div className="flex items-center gap-2 mb-4">
                <div className="w-6 h-6 rounded bg-[#006B32] border border-gray-200"></div>
                <div className="w-6 h-6 rounded bg-[#8A5100] border border-gray-200"></div>
                <div className="w-6 h-6 rounded bg-gray-200 border border-gray-300"></div>
                <span className="text-xs text-gray-500 ml-2 font-medium">Active Theme</span>
              </div>
              <p className="text-xs text-gray-500 leading-relaxed">
                Current: <span className="font-bold text-[#191C1D]">Patriot Light</span>. Editorial typography (Plus Jakarta) enabled across headers.
              </p>
            </div>
            <button onClick={() => setAssetsModalOpen(true)} className="w-full bg-[#F3F4F5] text-gray-700 font-bold py-2.5 rounded-none text-sm hover:bg-gray-200 transition mt-auto">
              Manage Assets
            </button>
          </div>

          {/* Security */}
          <div className="bg-white rounded-none p-8 shadow-sm border border-gray-100 flex flex-col h-full">
            <div className="w-10 h-10 bg-red-50 text-red-600 rounded-none flex items-center justify-center mb-6">
              <ShieldAlert size={20} />
            </div>
            <h3 className="text-lg font-extrabold text-[#191C1D] mb-2">Security</h3>
            <p className="text-xs text-gray-500 mb-6 flex-1">2FA, session TTL, and access protocols.</p>

            <div className="space-y-3 mb-6">
              <p className="flex items-center gap-2 text-xs font-bold text-[#006B32]">
                <CheckCircle size={14} /> MFA Enforced
              </p>
              <p className="flex items-center gap-2 text-xs font-bold text-[#8A5100]">
                <AlertCircle size={14} /> Last Audit: 3 days ago
              </p>
            </div>
            <button onClick={() => setAuditModalOpen(true)} className="w-full bg-[#F3F4F5] text-gray-700 font-bold py-2.5 rounded-none text-sm hover:bg-gray-200 transition mt-auto">
              Security Audit
            </button>
          </div>

        </section>

        {/* =========================================
            4. NOTIFICATION ENGINE
            ========================================= */}
        <section className="grid lg:grid-cols-12 gap-8 pb-12">
          <div className="lg:col-span-4">
            <h2 className="text-xl font-extrabold text-[#191C1D] mb-2">Notification Engine</h2>
            <p className="text-sm text-gray-500 leading-relaxed max-w-sm">
              Central gateway for SMS, Email, and Push notifications triggers.
            </p>
          </div>
          <div className="lg:col-span-8 bg-white rounded-none p-8 shadow-sm border border-gray-100">
            <div className="flex items-center justify-between mb-6">
              <h3 className="font-extrabold text-sm text-[#191C1D]">Active Gateways</h3>
              <button onClick={() => setEditNotifOpen(true)} className="text-[10px] font-bold text-[#006B32] uppercase tracking-widest hover:underline">
                Edit Settings
              </button>
            </div>

            <div className="space-y-4 mb-6">
              <div className="flex items-center justify-between bg-[#F8F9FA] p-4 rounded-none border border-gray-100">
                <div className="flex items-center gap-4">
                  <div className="w-10 h-10 bg-white shadow-sm rounded-none flex items-center justify-center text-gray-400">
                    <Mail size={18} />
                  </div>
                  <div>
                    <p className="font-bold text-[#191C1D] text-sm">Email (SendGrid)</p>
                    <p className="text-xs text-gray-500">System alerts and transactional receipts</p>
                  </div>
                </div>
                <span className="bg-[#E6F0EB] text-[#006B32] text-[9px] font-extrabold px-2 py-1 rounded uppercase tracking-wider">
                  Operational
                </span>
              </div>

              <div className="flex items-center justify-between bg-[#F8F9FA] p-4 rounded-none border border-gray-100">
                <div className="flex items-center gap-4">
                  <div className="w-10 h-10 bg-white shadow-sm rounded-none flex items-center justify-center text-gray-400">
                    <MessageSquare size={18} />
                  </div>
                  <div>
                    <p className="font-bold text-[#191C1D] text-sm">SMS Gateway (Twilio)</p>
                    <p className="text-xs text-gray-500">OTP and urgent artisan bookings</p>
                  </div>
                </div>
                <span className="bg-[#E6F0EB] text-[#006B32] text-[9px] font-extrabold px-2 py-1 rounded uppercase tracking-wider">
                  Operational
                </span>
              </div>
            </div>

            <div className="flex justify-center mt-8">
              <button className="text-sm font-bold text-[#191C1D] hover:underline">
                View Logs & Error History
              </button>
            </div>
          </div>
        </section>

        {/* =========================================
            5. SYSTEM MAINTENANCE MODE
            ========================================= */}
        <section className="bg-[#006B32] rounded-none p-8 md:p-12 shadow-lg relative overflow-hidden flex flex-col md:flex-row items-center justify-between">
          <div className="relative z-10 max-w-lg mb-8 md:mb-0">
            <h2 className="text-3xl font-extrabold text-white mb-4">System Maintenance Mode</h2>
            <p className="text-sm text-white/80 leading-relaxed mb-8">
              Activating this will suspend all client-facing applications. Only administrators with Level 10 clearance can proceed.
            </p>
            <button onClick={() => setShutdownModalOpen(true)} className="bg-[#F59E0B] text-white px-8 py-3.5 rounded-none font-bold hover:bg-[#d97706] transition shadow-md">
              Emergency Shutdown
            </button>
          </div>

          {/* Abstract Terminal/Server Graphic */}
          <div className="relative z-10 w-full md:w-[320px] h-[180px] bg-[#0A1A12] rounded-none border border-white/10 shadow-2xl p-4 overflow-hidden flex-shrink-0">
            <div className="flex gap-1.5 mb-4">
              <div className="w-2.5 h-2.5 rounded-full bg-red-500/80"></div>
              <div className="w-2.5 h-2.5 rounded-full bg-yellow-500/80"></div>
              <div className="w-2.5 h-2.5 rounded-full bg-green-500/80"></div>
            </div>
            <div className="space-y-2 opacity-60">
              <div className="h-1.5 w-3/4 bg-[#6EE7B7] rounded-full"></div>
              <div className="h-1.5 w-1/2 bg-[#6EE7B7] rounded-full"></div>
              <div className="h-1.5 w-5/6 bg-[#6EE7B7] rounded-full"></div>
              <div className="h-1.5 w-1/3 bg-[#6EE7B7] rounded-full"></div>
              <div className="h-1.5 w-2/3 bg-white/20 rounded-full mt-4"></div>
              <div className="h-1.5 w-1/2 bg-white/20 rounded-full"></div>
            </div>
          </div>
        </section>

        {/* PAGE FOOTER */}
        <div className="pt-12 pb-6 flex flex-col md:flex-row justify-between items-center text-xs text-gray-400 font-semibold gap-4">
          <p><span className="font-bold text-[#006B32]">Stabilize NG</span> © 2024 Federal Republic Admin Console</p>
          <div className="flex gap-6 uppercase tracking-widest text-[9px] font-bold">
            <span className="hover:text-gray-600 cursor-pointer text-gray-500">System Policy</span>
            <span className="hover:text-gray-600 cursor-pointer text-gray-500">Privacy Node</span>
            <span className="hover:text-gray-600 cursor-pointer text-gray-500">Super-Admin Access Logs</span>
          </div>
        </div>

      </div>

      {/* MODALS */}
      <Modal isOpen={editPlatformOpen} onClose={() => setEditPlatformOpen(false)} title="Edit Platform Identity" size="md">
        <div className="space-y-5">
          <div><label className="block text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-2">Platform Name</label><input type="text" defaultValue="Stabilize NG Admin" className="w-full border border-gray-200 rounded-none px-4 py-3 text-sm focus:outline-none focus:border-[#006B32]" /></div>
          <div><label className="block text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-2">Support Email</label><input type="email" defaultValue="ops-support@stabilize.ng" className="w-full border border-gray-200 rounded-none px-4 py-3 text-sm focus:outline-none focus:border-[#006B32]" /></div>
          <button onClick={() => setEditPlatformOpen(false)} className="w-full bg-[#006B32] text-white py-3 rounded-full text-sm font-bold hover:bg-[#005a2a] transition">Save Changes</button>
        </div>
      </Modal>

      <Modal isOpen={configModalOpen} onClose={() => setConfigModalOpen(false)} title="Configure System" size="md">
        <div className="space-y-5">
          <div><label className="block text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-2">Service Fee (%)</label><input type="number" defaultValue="15" className="w-full border border-gray-200 rounded-none px-4 py-3 text-sm focus:outline-none focus:border-[#006B32]" /></div>
          <div><label className="block text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-2">Payout Cycle (Hours)</label><input type="number" defaultValue="48" className="w-full border border-gray-200 rounded-none px-4 py-3 text-sm focus:outline-none focus:border-[#006B32]" /></div>
          <button onClick={() => setConfigModalOpen(false)} className="w-full bg-[#006B32] text-white py-3 rounded-full text-sm font-bold hover:bg-[#005a2a] transition">Save Configuration</button>
        </div>
      </Modal>

      <Modal isOpen={assetsModalOpen} onClose={() => setAssetsModalOpen(false)} title="Manage Assets" size="sm">
        <p className="text-sm text-gray-600 mb-4">Upload and manage theme assets for the platform.</p>
        <div className="border-2 border-dashed border-gray-200 rounded-none p-8 text-center mb-4"><p className="text-sm text-gray-400">Drag and drop files here, or click to browse</p></div>
        <button onClick={() => setAssetsModalOpen(false)} className="w-full bg-[#006B32] text-white py-3 rounded-full text-sm font-bold hover:bg-[#005a2a] transition">Upload Assets</button>
      </Modal>

      <Modal isOpen={auditModalOpen} onClose={() => setAuditModalOpen(false)} title="Security Audit" size="md">
        <div className="space-y-4">
          <div className="flex items-center gap-3 bg-[#E6F0EB] rounded-none p-4"><CheckCircle size={18} className="text-[#006B32]" /><p className="text-sm font-bold text-[#006B32]">MFA enforcement is active across all admin accounts.</p></div>
          <div className="flex items-center gap-3 bg-[#FDF9F1] rounded-none p-4 border border-[#FDE8D7]"><AlertCircle size={18} className="text-[#8A5100]" /><p className="text-sm font-bold text-[#8A5100]">Last full platform audit: 3 days ago</p></div>
          <button onClick={() => setAuditModalOpen(false)} className="w-full bg-[#006B32] text-white py-3 rounded-full text-sm font-bold hover:bg-[#005a2a] transition">Run Full Audit</button>
        </div>
      </Modal>

      <Modal isOpen={editNotifOpen} onClose={() => setEditNotifOpen(false)} title="Notification Settings" size="md">
        <div className="space-y-5">
          <div className="flex items-center justify-between bg-[#F8F9FA] p-4 rounded-none border border-gray-100">
            <div><p className="font-bold text-[#191C1D] text-sm">Email (SendGrid)</p><p className="text-xs text-gray-500">System alerts and receipts</p></div>
            <div className="w-12 h-6 rounded-full p-1 bg-[#006B32] cursor-pointer"><div className="w-4 h-4 bg-white rounded-full translate-x-6"></div></div>
          </div>
          <div className="flex items-center justify-between bg-[#F8F9FA] p-4 rounded-none border border-gray-100">
            <div><p className="font-bold text-[#191C1D] text-sm">SMS Gateway (Twilio)</p><p className="text-xs text-gray-500">OTP and urgent bookings</p></div>
            <div className="w-12 h-6 rounded-full p-1 bg-[#006B32] cursor-pointer"><div className="w-4 h-4 bg-white rounded-full translate-x-6"></div></div>
          </div>
          <button onClick={() => setEditNotifOpen(false)} className="w-full bg-[#006B32] text-white py-3 rounded-full text-sm font-bold hover:bg-[#005a2a] transition">Save Settings</button>
        </div>
      </Modal>

      <ConfirmModal isOpen={shutdownModalOpen} onClose={() => setShutdownModalOpen(false)} onConfirm={() => setShutdownModalOpen(false)} title="Emergency Shutdown" message="This will suspend ALL client-facing applications immediately. Only Level 10 clearance admins can restart. Are you absolutely sure?" confirmLabel="Shutdown Now" variant="danger" />

    </div>
  );
}

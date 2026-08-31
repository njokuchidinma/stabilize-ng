"use client";

import { useState } from 'react';
import Image from 'next/image';
import {
  Camera, Lock, ShieldCheck, History, Edit2,
  MapPin, Plus, SlidersHorizontal, Palette,
  ShieldAlert, Mail, MessageSquare, AlertTriangle,
  type LucideIcon,
} from 'lucide-react';
import Modal from '@/components/admin/generics/Modal';
import ConfirmModal from '@/components/admin/generics/ConfirmModal';

export default function AdminSettingsPage() {
  const [passwordModalOpen, setPasswordModalOpen] = useState(false);
  const [twoFAModalOpen, setTwoFAModalOpen] = useState(false);
  const [editPlatformOpen, setEditPlatformOpen] = useState(false);
  const [configModalOpen, setConfigModalOpen] = useState(false);
  const [assetsModalOpen, setAssetsModalOpen] = useState(false);
  const [auditModalOpen, setAuditModalOpen] = useState(false);
  const [shutdownModalOpen, setShutdownModalOpen] = useState(false);

  return (
    <div className="p-4 md:p-8 max-w-7xl mx-auto">

      {/* =========================================
          PAGE HEADER
          ========================================= */}
      <div className="flex items-center gap-4 mb-12">
        <h1 className="text-3xl font-extrabold text-[#006B32]">System Settings</h1>
        <span className="bg-[#E6F0EB] text-[#006B32] text-[10px] font-extrabold px-3 py-1.5 rounded-full uppercase tracking-widest">
          Super Admin Only
        </span>
      </div>

      <div className="space-y-12">

        {/* =========================================
            1. ADMIN PROFILE
            ========================================= */}
        <section className="grid lg:grid-cols-12 gap-8 border-b border-gray-100 pb-12">
          <div className="lg:col-span-4">
            <h2 className="text-xl font-extrabold text-[#191C1D] mb-2">Admin Profile</h2>
            <p className="text-sm text-gray-500 leading-relaxed max-w-sm">
              Update your personal account details and public display name.
            </p>
          </div>
          <div className="lg:col-span-8 bg-white rounded-none p-8 shadow-sm border border-gray-100">
            <div className="flex items-center gap-6 mb-8">
              <div className="relative">
                <div className="w-20 h-20 rounded-full bg-gray-800 overflow-hidden border-2 border-gray-100">
                  <Image src="/images/admin/avatar1.jpg" alt="Profile" width={80} height={80} className="object-cover" />
                </div>
                <button className="absolute bottom-0 right-0 w-6 h-6 bg-[#006B32] rounded-full flex items-center justify-center border-2 border-white text-white hover:bg-[#005a2a]">
                  <Camera size={10} />
                </button>
              </div>
              <div>
                <p className="text-lg font-extrabold text-[#191C1D]">Olusegun Adeyemi</p>
                <p className="text-xs text-gray-500">Super Admin • Lagos Hub</p>
              </div>
            </div>

            <div className="grid md:grid-cols-2 gap-6 mb-6">
              <div>
                <label className="block text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-2">Display Name</label>
                <input
                  type="text"
                  defaultValue="Olusegun Adeyemi"
                  className="w-full bg-white border border-gray-200 rounded-none px-4 py-3 text-sm font-semibold text-[#191C1D] focus:outline-none focus:border-[#006B32]"
                />
              </div>
              <div>
                <label className="block text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-2">Official Email Address</label>
                <input
                  type="email"
                  defaultValue="o.adeyemi@stabilize.ng"
                  className="w-full bg-white border border-gray-200 rounded-none px-4 py-3 text-sm font-semibold text-[#191C1D] focus:outline-none focus:border-[#006B32]"
                />
              </div>
            </div>
            <div className="flex justify-end">
              <button className="bg-[#006B32] text-white px-6 py-3 rounded-none font-bold text-sm hover:bg-[#005a2a] transition shadow-sm">
                Save Profile Changes
              </button>
            </div>
          </div>
        </section>

        {/* =========================================
            2. SECURITY & ACCESS
            ========================================= */}
        <section className="grid lg:grid-cols-12 gap-8 border-b border-gray-100 pb-12">
          <div className="lg:col-span-4">
            <h2 className="text-xl font-extrabold text-[#191C1D] mb-2">Security & Access</h2>
            <p className="text-sm text-gray-500 leading-relaxed max-w-sm">
              Manage your credentials and view recent security audits.
            </p>
          </div>
          <div className="lg:col-span-8 space-y-4">

            <div className="bg-white rounded-none p-6 shadow-sm border border-gray-100 flex flex-col md:flex-row md:items-center justify-between gap-4">
              <div>
                <div className="flex items-center gap-2 mb-1">
                  <Lock size={16} className="text-[#006B32]" />
                  <h3 className="font-extrabold text-[#191C1D] text-sm">Account Password</h3>
                </div>
                <p className="text-xs text-gray-500">Last changed 45 days ago. We recommend a refresh every 90 days.</p>
              </div>
              <button onClick={() => setPasswordModalOpen(true)} className="text-sm font-bold text-gray-700 bg-white border border-gray-200 px-4 py-2 rounded-none hover:bg-gray-50 whitespace-nowrap">
                Change Password
              </button>
            </div>

            <div className="bg-white rounded-none p-6 shadow-sm border border-gray-100 flex flex-col md:flex-row md:items-center justify-between gap-4">
              <div>
                <div className="flex items-center gap-2 mb-1">
                  <ShieldCheck size={16} className="text-[#8A5100]" />
                  <h3 className="font-extrabold text-[#191C1D] text-sm">Two-Factor Authentication</h3>
                </div>
                <p className="text-xs text-gray-500">Status: <span className="text-[#006B32] font-bold">Active</span> via Authenticator App</p>
              </div>
              <button onClick={() => setTwoFAModalOpen(true)} className="text-sm font-bold text-[#8A5100] hover:underline whitespace-nowrap">
                Configure
              </button>
            </div>

            <div className="bg-[#F8F9FA] rounded-none p-4 border border-gray-100 flex items-center justify-between">
              <div className="flex items-center gap-3">
                <History size={16} className="text-gray-400" />
                <span className="text-xs text-gray-500">Last login from 192.168.1.1 (Lagos, NG) — 2 hours ago</span>
              </div>
              <button className="text-[10px] font-bold text-gray-400 uppercase tracking-widest hover:text-[#191C1D]">
                View Log
              </button>
            </div>

          </div>
        </section>

        {/* =========================================
            3. PLATFORM IDENTITY
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
            4. CITY AVAILABILITY
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
            5. CONFIGS, APPEARANCE, SECURITY (3 Cols)
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
            <button onClick={() => setConfigModalOpen(true)} className="w-full bg-[#F3F4F5] text-gray-700 font-bold py-2.5 rounded-none text-sm hover:bg-gray-200 transition">
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
              <div className="flex gap-2 mb-4">
                <div className="w-6 h-6 rounded bg-[#006B32] border border-gray-200"></div>
                <div className="w-6 h-6 rounded bg-[#8A5100] border border-gray-200"></div>
                <div className="w-6 h-6 rounded bg-gray-200 border border-gray-300"></div>
                <span className="text-xs text-gray-500 ml-2 font-medium">Active Theme</span>
              </div>
              <p className="text-xs text-gray-500 leading-relaxed">
                Current: <span className="font-bold text-[#191C1D]">Patriot Light</span>. Editorial typography (Plus Jakarta) enabled across headers.
              </p>
            </div>
            <button onClick={() => setAssetsModalOpen(true)} className="w-full bg-[#F3F4F5] text-gray-700 font-bold py-2.5 rounded-none text-sm mt-auto hover:bg-gray-200 transition">
              Manage Assets
            </button>
          </div>

          {/* Global Security */}
          <div className="bg-white rounded-none p-8 shadow-sm border border-gray-100 flex flex-col h-full">
            <div className="w-10 h-10 bg-red-50 text-red-600 rounded-none flex items-center justify-center mb-6">
              <ShieldAlert size={20} />
            </div>
            <h3 className="text-lg font-extrabold text-[#191C1D] mb-2">Global Security</h3>
            <p className="text-xs text-gray-500 mb-6 flex-1">MFA, session TTL, and portal-wide access protocols.</p>

            <div className="space-y-3 mb-6">
              <p className="flex items-center gap-2 text-xs font-bold text-[#006B32]">
                <ShieldCheck size={14} /> MFA Enforced
              </p>
              <p className="flex items-center gap-2 text-xs font-bold text-[#8A5100]">
                <AlertTriangle size={14} /> Last Platform Audit: 3 days ago
              </p>
            </div>
            <button onClick={() => setAuditModalOpen(true)} className="w-full bg-[#F3F4F5] text-gray-700 font-bold py-2.5 rounded-none text-sm mt-auto hover:bg-gray-200 transition">
              Platform Audit
            </button>
          </div>

        </section>

        {/* =========================================
            6. NOTIFICATION ENGINE
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
              <button className="text-[10px] font-bold text-[#006B32] uppercase tracking-widest hover:underline">
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

            <div className="flex justify-center">
              <button className="text-sm font-bold text-[#191C1D] hover:underline">
                View Logs & Error History
              </button>
            </div>
          </div>
        </section>

        {/* =========================================
            7. SYSTEM MAINTENANCE MODE
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
          <div className="relative z-10 w-full md:w-[300px] h-[180px] bg-[#0A1A12] rounded-none border border-white/10 shadow-2xl p-4 overflow-hidden flex-shrink-0">
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
          <p>Stabilize NG © 2024 Federal Republic Admin Console</p>
          <div className="flex gap-6 uppercase tracking-widest text-[9px]">
            <span className="hover:text-gray-600 cursor-pointer">System Policy</span>
            <span className="hover:text-gray-600 cursor-pointer">Privacy Node</span>
            <span className="hover:text-gray-600 cursor-pointer">Super-Admin Access Logs</span>
          </div>
        </div>

      </div>

      {/* MODALS */}
      <Modal isOpen={passwordModalOpen} onClose={() => setPasswordModalOpen(false)} title="Change Password" size="sm">
        <div className="space-y-5">
          <div><label className="block text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-2">Current Password</label><input type="password" placeholder="••••••••" className="w-full border border-gray-200 rounded-none px-4 py-3 text-sm focus:outline-none focus:border-[#006B32]" /></div>
          <div><label className="block text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-2">New Password</label><input type="password" placeholder="••••••••" className="w-full border border-gray-200 rounded-none px-4 py-3 text-sm focus:outline-none focus:border-[#006B32]" /></div>
          <div><label className="block text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-2">Confirm New Password</label><input type="password" placeholder="••••••••" className="w-full border border-gray-200 rounded-none px-4 py-3 text-sm focus:outline-none focus:border-[#006B32]" /></div>
          <button onClick={() => setPasswordModalOpen(false)} className="w-full bg-[#006B32] text-white py-3 rounded-full text-sm font-bold hover:bg-[#005a2a] transition">Update Password</button>
        </div>
      </Modal>

      <Modal isOpen={twoFAModalOpen} onClose={() => setTwoFAModalOpen(false)} title="Two-Factor Authentication" size="sm">
        <div className="space-y-5">
          <div className="bg-[#E6F0EB] rounded-none p-4 border border-[#006B32]/10"><p className="text-sm text-[#006B32] font-bold">2FA is currently active via Authenticator App.</p></div>
          <p className="text-sm text-gray-600">You can reconfigure your 2FA method or disable it temporarily.</p>
          <div className="flex gap-3">
            <button onClick={() => setTwoFAModalOpen(false)} className="flex-1 bg-[#006B32] text-white py-3 rounded-full text-sm font-bold hover:bg-[#005a2a] transition">Reconfigure</button>
            <button onClick={() => setTwoFAModalOpen(false)} className="flex-1 bg-red-50 text-red-600 py-3 rounded-full text-sm font-bold hover:bg-red-100 transition border border-red-100">Disable</button>
          </div>
        </div>
      </Modal>

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
          <div className="flex items-center gap-3 bg-[#E6F0EB] rounded-none p-4"><ShieldCheck size={18} className="text-[#006B32]" /><p className="text-sm font-bold text-[#006B32]">MFA enforcement is active across all admin accounts.</p></div>
          <div className="flex items-center gap-3 bg-[#FDF9F1] rounded-none p-4 border border-[#FDE8D7]"><AlertTriangle size={18} className="text-[#8A5100]" /><p className="text-sm font-bold text-[#8A5100]">Last full platform audit: 3 days ago</p></div>
          <button onClick={() => setAuditModalOpen(false)} className="w-full bg-[#006B32] text-white py-3 rounded-full text-sm font-bold hover:bg-[#005a2a] transition">Run Full Audit</button>
        </div>
      </Modal>

      <ConfirmModal isOpen={shutdownModalOpen} onClose={() => setShutdownModalOpen(false)} onConfirm={() => setShutdownModalOpen(false)} title="Emergency Shutdown" message="This will suspend ALL client-facing applications immediately. Only Level 10 clearance admins can restart. Are you absolutely sure?" confirmLabel="Shutdown Now" variant="danger" />

    </div>
  );
}

// --- HELPER COMPONENT ---

function ToggleRow({
  icon: Icon,
  title,
  subtitle,
  isActive,
}: {
  icon: LucideIcon;
  title: string;
  subtitle: string;
  isActive: boolean;
}) {
  return (
    <div className="flex items-center justify-between bg-[#F8F9FA] p-4 rounded-none border border-gray-100">
      <div className="flex items-center gap-4">
        <div className={`w-10 h-10 shadow-sm rounded-none flex items-center justify-center ${isActive ? 'bg-white text-[#006B32]' : 'bg-gray-100 text-gray-400'}`}>
          <Icon size={18} />
        </div>
        <div>
          <p className={`font-bold text-sm ${isActive ? 'text-[#191C1D]' : 'text-gray-500'}`}>{title}</p>
          <p className="text-xs text-gray-500">{subtitle}</p>
        </div>
      </div>

      {/* Custom Tailwind Toggle */}
      <div className={`w-12 h-6 rounded-full p-1 transition-colors duration-300 ease-in-out cursor-pointer ${isActive ? 'bg-[#006B32]' : 'bg-gray-300'}`}>
        <div className={`w-4 h-4 bg-white rounded-full shadow-sm transition-transform duration-300 ease-in-out ${isActive ? 'translate-x-6' : 'translate-x-0'}`}></div>
      </div>
    </div>
  );
}

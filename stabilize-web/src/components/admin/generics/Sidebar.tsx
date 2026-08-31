"use client";

import { usePathname } from 'next/navigation';
import Link from 'next/link';
import Image from 'next/image';
import {
  LayoutDashboard, Users, Wrench, CalendarCheck,
  List, BarChart2, ShieldCheck, Map, FileText, Settings,
  User, X, LogOut, ChevronLeft, ChevronRight,
} from 'lucide-react';

interface SidebarProps {
  isOpen: boolean;
  onClose: () => void;
  collapsed: boolean;
  onToggle: () => void;
}

export default function Sidebar({ isOpen, onClose, collapsed, onToggle }: SidebarProps) {
  const pathname = usePathname();

  const menuItems = [
    { icon: LayoutDashboard, label: 'Dashboard', href: '/admin' },
    { icon: Users, label: 'User Management', href: '/admin/user-management' },
    { icon: Wrench, label: 'Artisan Management', href: '/admin/workforce' },
    { icon: CalendarCheck, label: 'Enquiries & Bookings', href: '/admin/enquiries' },
    { icon: List, label: 'Categories & Services', href: '/admin/category' },
    { icon: BarChart2, label: 'Reports', href: '/admin/reports' },
    { icon: ShieldCheck, label: 'Admin Management', href: '/admin/admin-management' },
    { icon: Map, label: 'City Management', href: '/admin/city-management' },
    { icon: FileText, label: 'Audit Logs', href: '/admin/audit-logs' },
    { icon: User, label: 'Profile', href: '/admin/profile-settings' },
    { icon: Settings, label: 'Settings', href: '/admin/settings' },
  ];

  const isActive = (href: string) => {
    if (href === '/admin') return pathname === '/admin';
    return pathname.startsWith(href);
  };

  return (
    <>
      {/* Mobile Backdrop */}
      {isOpen && (
        <div
          className="fixed inset-0 bg-black/40 z-40 md:hidden"
          onClick={onClose}
        />
      )}

      <aside
        className={`${collapsed ? 'w-[72px]' : 'w-64'} bg-[#F8F9FA] border-r border-gray-200 h-screen fixed left-0 top-0 overflow-y-auto overflow-x-hidden flex flex-col z-50 transition-all duration-300 ease-in-out ${
          isOpen ? 'translate-x-0' : '-translate-x-full'
        } md:translate-x-0`}
      >
        {/* Logo Header */}
        <div className={`${collapsed ? 'px-3' : 'px-6'} mt-4 border-b border-gray-200 pb-4 transition-all duration-300`}>
          <div className="flex items-center justify-between">
            <div className={`flex items-center ${collapsed ? 'justify-center w-full' : 'gap-3'}`}>
              <Image
                src="/images/logo.png"
                alt="Stabilize NG Logo"
                width={collapsed ? 36 : 140}
                height={collapsed ? 36 : 42}
                className={`${collapsed ? 'h-9 w-9 object-contain' : 'h-12 w-auto'} transition-all duration-300`}
                priority
              />
              {!collapsed && (
                <h1 className="text-lg font-extrabold text-[#006B32] whitespace-nowrap">
                  Stabilize NG
                </h1>
              )}
            </div>

            {/* Mobile Close Button */}
            <button
              onClick={onClose}
              className="md:hidden text-gray-400 hover:text-[#191C1D] transition"
            >
              <X size={20} />
            </button>
          </div>
        </div>

        {/* Navigation */}
        <nav className={`flex-1 py-6 ${collapsed ? 'px-2' : 'px-4'} space-y-1 transition-all duration-300`}>
          {menuItems.map((item) => {
            const Icon = item.icon;
            const active = isActive(item.href);
            return (
              <Link
                key={item.href}
                href={item.href}
                onClick={onClose}
                title={collapsed ? item.label : undefined}
                className={`flex items-center ${collapsed ? 'justify-center' : 'gap-3'} ${collapsed ? 'px-0 py-3' : 'px-4 py-3'} text-sm font-semibold border-l-2 transition-colors ${
                  active
                    ? 'bg-[#E6F0EB] text-[#006B32] border-l-[#006B32]'
                    : 'border-l-transparent text-gray-600 hover:bg-gray-100 hover:text-[#191C1D]'
                }`}
              >
                <Icon size={18} className={`flex-shrink-0 ${active ? 'text-[#006B32]' : 'text-gray-400'}`} />
                {!collapsed && <span className="whitespace-nowrap">{item.label}</span>}
              </Link>
            );
          })}
        </nav>

        {/* Collapse Toggle (desktop only) */}
        <div className="hidden md:block p-2 border-t border-gray-200">
          <button
            onClick={onToggle}
            className={`flex items-center ${collapsed ? 'justify-center' : 'justify-between px-4'} w-full py-3 text-sm font-semibold text-gray-500 hover:bg-gray-100 hover:text-[#191C1D] transition-colors`}
          >
            {!collapsed && <span className="whitespace-nowrap">Collapse</span>}
            {collapsed ? <ChevronRight size={18} /> : <ChevronLeft size={18} />}
          </button>
        </div>

        {/* Logout */}
        <div className={`${collapsed ? 'p-2' : 'p-4'} border-t border-gray-200 mt-auto transition-all duration-300`}>
          <Link
            href="/admin/login"
            onClick={onClose}
            title={collapsed ? 'Log Out' : undefined}
            className={`flex items-center ${collapsed ? 'justify-center' : 'gap-3 px-4'} py-3 text-sm font-semibold text-gray-600 hover:bg-gray-100 hover:text-red-500 transition-colors`}
          >
            <LogOut size={18} className="text-gray-400 flex-shrink-0" />
            {!collapsed && <span className="whitespace-nowrap">Log Out</span>}
          </Link>
        </div>
      </aside>
    </>
  );
}

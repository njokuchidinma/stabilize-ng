"use client";

import { usePathname } from 'next/navigation';
import { Search, Bell, Building, Menu } from 'lucide-react';

const pageTitles: Record<string, string> = {
  '/admin': 'Dashboard',
  '/admin/user-management': 'User Management',
  '/admin/workforce': 'Artisan Management',
  '/admin/enquiries': 'Enquiries & Bookings',
  '/admin/category': 'Categories',
  '/admin/reports': 'Reports & Analytics',
  '/admin/admin-management': 'Admin Management',
  '/admin/city-management': 'City Management',
  '/admin/audit-logs': 'Audit Logs',
  '/admin/profile-settings': 'Profile Settings',
  '/admin/settings': 'Settings',
};

export default function Header({ onMenuToggle, sidebarCollapsed }: { onMenuToggle: () => void; sidebarCollapsed: boolean }) {
  const pathname = usePathname();
  const title = pageTitles[pathname] ?? 'Dashboard';

  return (
    <header className={`h-16 md:h-20 bg-white border-b border-gray-200 fixed top-0 right-0 left-0 ${sidebarCollapsed ? 'md:left-[72px]' : 'md:left-64'} z-10 px-4 md:px-8 flex items-center justify-between transition-all duration-300`}>
      {/* Hamburger (mobile only) */}
      <button onClick={onMenuToggle} className="md:hidden text-[#191C1D] mr-3">
        <Menu size={24} />
      </button>

      <h2 className="text-lg md:text-xl font-extrabold text-[#006B32] truncate">{title}</h2>

      <div className="flex items-center gap-4 md:gap-8">
        {/* Search — hidden on mobile */}
        <div className="relative w-80 hidden md:block">
          <Search size={16} className="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400" />
          <input
            type="text"
            placeholder="Search ID, User or Artisan..."
            className="w-full bg-[#F3F4F5] rounded-none pl-10 pr-4 py-2 text-sm text-black placeholder:text-gray-400 focus:outline-none focus:ring-2 focus:ring-[#006B32]/20"
          />
        </div>

        {/* Actions & Profile */}
        <div className="flex items-center gap-3 md:gap-5">
          <button className="text-gray-500 hover:text-[#191C1D] relative">
            <Bell size={20} />
            <span className="absolute top-0 right-0 w-2 h-2 bg-red-500 rounded-full border border-white"></span>
          </button>
          <button className="text-gray-500 hover:text-[#191C1D]">
            <Building size={20} />
          </button>
          <div className="w-px h-6 bg-gray-200"></div>
          <div className="w-8 h-8 rounded-full bg-[#006B32] flex items-center justify-center text-white text-xs font-bold">
            AD
          </div>
        </div>
      </div>
    </header>
  );
}
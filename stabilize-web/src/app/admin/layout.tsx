"use client";

import { useState } from 'react';
import { usePathname } from 'next/navigation';
import Sidebar from '@/components/admin/generics/Sidebar';
import Header from '@/components/admin/generics/Header';

export default function AdminLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  const pathname = usePathname();
  const [sidebarOpen, setSidebarOpen] = useState(false);
  const [sidebarCollapsed, setSidebarCollapsed] = useState(false);

  // Login page gets a clean layout — no sidebar or header
  if (pathname === '/admin/login') {
    return <>{children}</>;
  }

  return (
    <div className="min-h-screen bg-[#F3F4F5] font-sans selection:bg-[#006B32] selection:text-white">
      <Sidebar
        isOpen={sidebarOpen}
        onClose={() => setSidebarOpen(false)}
        collapsed={sidebarCollapsed}
        onToggle={() => setSidebarCollapsed((prev) => !prev)}
      />
      <Header
        onMenuToggle={() => setSidebarOpen((prev) => !prev)}
        sidebarCollapsed={sidebarCollapsed}
      />

      <main className={`${sidebarCollapsed ? 'md:ml-[72px]' : 'md:ml-64'} pt-16 md:pt-20 transition-all duration-300`}>
        {children}
      </main>
    </div>
  );
}
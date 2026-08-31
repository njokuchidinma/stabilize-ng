'use client';

import Link from 'next/link';
import Image from 'next/image';
import { usePathname } from 'next/navigation';
import { useState } from 'react';
import { Download, Menu, X } from 'lucide-react';

const navLinks = [
  { href: '/', label: 'Home' },
  { href: '/users', label: 'For Users' },
  { href: '/workforce', label: 'For Artisans' },
  { href: '/feature', label: 'Features' },
  { href: '/about', label: 'About' },
  { href: '/admin', label: 'Admin' },
];

export default function Navbar() {
  const pathname = usePathname();
  const [mobileOpen, setMobileOpen] = useState(false);

  const isActive = (href: string) =>
    href === '/' ? pathname === '/' : pathname.startsWith(href);

  return (
    <nav className="fixed top-0 left-0 right-0 z-50 bg-white/80 backdrop-blur-md border-b border-gray-100">
      <div className="max-w-7xl mx-auto px-6 h-20 flex items-center justify-between">
        {/* Logo */}
        <Link href="/" className="flex items-center gap-2">
          <Image
            src="/images/logo.png"
            alt="Stabilize NG Logo"
            width={140}        // Adjust based on your logo size
            height={40}        // Adjust based on your logo size
            className="w-auto h-16"   // This controls visual size
            priority
          />
          <span className="text-2xl font-bold text-[#006B32]">Stabilize</span>
        </Link>

        {/* Desktop Links */}
        <div className="hidden md:flex items-center gap-8">
          {navLinks.map(({ href, label }) => (
            <Link
              key={href}
              href={href}
              className={
                isActive(href)
                  ? 'text-sm font-semibold text-[#191C1D] border-b-2 border-[#006B32] pb-1'
                  : 'text-sm font-medium text-gray-600 hover:text-[#191C1D]'
              }
            >
              {label}
            </Link>
          ))}
        </div>

        {/* Desktop Action Button */}
        <Link
          href="#"
          className="hidden md:flex items-center gap-2 bg-[#006B32] text-white px-5 py-2.5 rounded-lg text-sm font-semibold hover:bg-[#005a2a] transition-colors"
        >
          <Download size={16} /> Download
        </Link>

        {/* Mobile Hamburger */}
        <button
          className="md:hidden p-2 text-[#191C1D]"
          onClick={() => setMobileOpen(!mobileOpen)}
          aria-label={mobileOpen ? 'Close menu' : 'Open menu'}
        >
          {mobileOpen ? <X size={24} /> : <Menu size={24} />}
        </button>
      </div>

      {/* Mobile Drawer */}
      {mobileOpen && (
        <div className="md:hidden bg-white border-t border-gray-100 px-6 pb-6 pt-4 space-y-4">
          {navLinks.map(({ href, label }) => (
            <Link
              key={href}
              href={href}
              onClick={() => setMobileOpen(false)}
              className={
                isActive(href)
                  ? 'block text-sm font-semibold text-[#006B32]'
                  : 'block text-sm font-medium text-gray-600 hover:text-[#191C1D]'
              }
            >
              {label}
            </Link>
          ))}
          <Link
            href="#"
            onClick={() => setMobileOpen(false)}
            className="flex items-center justify-center gap-2 bg-[#006B32] text-white px-5 py-2.5 rounded-lg text-sm font-semibold hover:bg-[#005a2a] transition-colors w-full"
          >
            <Download size={16} /> Download
          </Link>
        </div>
      )}
    </nav>
  );
}
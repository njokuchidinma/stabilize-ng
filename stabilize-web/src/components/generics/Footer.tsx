import Link from 'next/link';
import { Globe, Share2 } from 'lucide-react';

export default function Footer() {
  return (
    <footer className="bg-[#F8F9FA] pt-20 pb-10 border-t border-gray-200">
      <div className="max-w-7xl mx-auto px-6">
        <div className="grid grid-cols-1 md:grid-cols-4 gap-12 mb-16">
          {/* Brand Col */}
          <div className="col-span-1 md:col-span-2">
            <h3 className="text-xl font-bold text-[#006B32] mb-4">Stabilize</h3>
            <p className="text-sm text-gray-600 max-w-sm leading-relaxed mb-6">
              The premier digital bridge connecting high-intent users with world-class Nigerian artisans across major cities.
            </p>
            <div className="flex gap-3">
              <button className="w-8 h-8 rounded-full bg-gray-200 flex items-center justify-center text-gray-600 hover:bg-[#006B32] hover:text-white transition">
                <Globe size={16} />
              </button>
              <button className="w-8 h-8 rounded-full bg-gray-200 flex items-center justify-center text-gray-600 hover:bg-[#006B32] hover:text-white transition">
                <Share2 size={16} />
              </button>
            </div>
          </div>

          {/* Product Links */}
          <div>
            <h4 className="text-sm font-bold text-[#191C1D] mb-4">Product</h4>
            <ul className="space-y-3">
              <li><Link href="/feature" className="text-sm text-gray-600 hover:text-[#006B32]">Features</Link></li>
              <li><Link href="/users" className="text-sm text-gray-600 hover:text-[#006B32]">For Users</Link></li>
              <li><Link href="/workforce" className="text-sm text-gray-600 hover:text-[#006B32]">For Artisans</Link></li>
              <li><Link href="/about" className="text-sm text-gray-600 hover:text-[#006B32]">About</Link></li>
            </ul>
          </div>

          {/* Legal Links */}
          <div>
            <h4 className="text-sm font-bold text-[#191C1D] mb-4">Legal & Support</h4>
            <ul className="space-y-3">
              <li><Link href="/privacy-policy" className="text-sm text-gray-600 hover:text-[#006B32]">Privacy Policy</Link></li>
              <li><Link href="/terms-of-service" className="text-sm text-gray-600 hover:text-[#006B32]">Terms of Service</Link></li>
              <li><Link href="/contact" className="text-sm text-gray-600 hover:text-[#006B32]">Contact Us</Link></li>
              <li><Link href="/support" className="text-sm text-gray-600 hover:text-[#006B32]">Support</Link></li>
            </ul>
          </div>
        </div>

        {/* Bottom Bar */}
        <div className="pt-8 border-t border-gray-200 flex flex-col md:flex-row items-center justify-between">
          <p className="text-xs text-gray-500">
            © 2024 Stabilize NG. All rights reserved. Built for the Digital Patriot.
          </p>
        </div>
      </div>
    </footer>
  );
}
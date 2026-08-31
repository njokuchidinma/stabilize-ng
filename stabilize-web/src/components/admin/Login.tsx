"use client";

import { useState } from 'react';
import Link from 'next/link';
import { Eye, EyeOff, ShieldCheck } from 'lucide-react';

export default function LoginPage() {
  const [showPassword, setShowPassword] = useState(false);

  return (
    <div className="min-h-screen bg-[#F3F4F5] flex items-center justify-center px-4">
      <div className="w-full max-w-md">
        {/* Branding */}
        <div className="text-center mb-10">
          <div className="inline-flex items-center justify-center w-14 h-14 bg-[#006B32] rounded-none text-white mb-5">
            <ShieldCheck size={28} />
          </div>
          <h1 className="text-2xl font-extrabold text-[#191C1D]">Stabilize NG</h1>
          <p className="text-[10px] font-bold text-gray-500 uppercase tracking-widest mt-1">
            Central Admin Console
          </p>
        </div>

        {/* Login Card */}
        <div className="bg-white rounded-none p-8 md:p-10 shadow-sm border border-gray-100">
          <h2 className="text-xl font-extrabold text-[#191C1D] mb-1">Welcome back</h2>
          <p className="text-sm text-gray-500 mb-8">Sign in to access the admin dashboard.</p>

          <form onSubmit={(e) => e.preventDefault()} className="space-y-5">
            {/* Email */}
            <div>
              <label className="block text-xs font-bold text-[#191C1D] uppercase tracking-widest mb-2">
                Email Address
              </label>
              <input
                type="email"
                placeholder="admin@stabilize.ng"
                className="w-full bg-[#F8F9FA] rounded-none px-4 py-3 text-sm focus:outline-none focus:ring-2 focus:ring-[#006B32]/20 border border-transparent focus:border-[#006B32]/30 transition"
              />
            </div>

            {/* Password */}
            <div>
              <label className="block text-xs font-bold text-[#191C1D] uppercase tracking-widest mb-2">
                Password
              </label>
              <div className="relative">
                <input
                  type={showPassword ? 'text' : 'password'}
                  placeholder="••••••••"
                  className="w-full bg-[#F8F9FA] rounded-none px-4 py-3 pr-12 text-sm focus:outline-none focus:ring-2 focus:ring-[#006B32]/20 border border-transparent focus:border-[#006B32]/30 transition"
                />
                <button
                  type="button"
                  onClick={() => setShowPassword(!showPassword)}
                  className="absolute right-4 top-1/2 -translate-y-1/2 text-gray-400 hover:text-[#191C1D] transition"
                >
                  {showPassword ? <EyeOff size={18} /> : <Eye size={18} />}
                </button>
              </div>
            </div>

            {/* Remember + Forgot */}
            <div className="flex items-center justify-between">
              <label className="flex items-center gap-2 cursor-pointer">
                <input
                  type="checkbox"
                  className="w-4 h-4 rounded border-gray-300 text-[#006B32] focus:ring-[#006B32]"
                />
                <span className="text-xs text-gray-600">Remember me</span>
              </label>
              <button type="button" className="text-xs font-bold text-[#006B32] hover:underline">
                Forgot password?
              </button>
            </div>

            {/* Submit */}
            <Link
              href="/admin"
              className="block w-full bg-[#006B32] text-white text-center py-3.5 rounded-none font-bold hover:bg-[#005a2a] transition shadow-sm text-sm"
            >
              Sign In
            </Link>
          </form>
        </div>

        {/* Footer */}
        <p className="text-center text-xs text-gray-400 mt-8">
          &copy; 2026 Stabilize NG. All rights reserved.
        </p>
      </div>
    </div>
  );
}

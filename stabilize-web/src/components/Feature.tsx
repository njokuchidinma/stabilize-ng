import Image from 'next/image';
import Link from 'next/link';
import Navbar from '@/components/generics/Navbar';
import Footer from '@/components/generics/Footer';
import {
  ShieldCheck, Target, MessageSquare, CalendarCheck,
  User, PenTool, Shield, MapPin, FileCheck, Zap
} from 'lucide-react';

export default function FeaturesPage() {
  return (
    <div className="min-h-screen bg-[#F8F9FA] font-sans selection:bg-[#006B32] selection:text-white">
      <Navbar />

      <main className="pt-28 pb-16 px-6 max-w-7xl mx-auto">

        {/* =========================================
            1. HERO SECTION
            ========================================= */}
        <section className="mb-32">
          <div className="grid lg:grid-cols-2 gap-16 items-center">
            {/* Left Text */}
            <div className="max-w-xl">
              <h1 className="text-5xl md:text-6xl font-extrabold text-[#191C1D] leading-[1.1] mb-6 tracking-tight">
                The Power to <span className="text-[#006B32]">Stabilize</span><br />
                Your Workflow.
              </h1>
              <p className="text-gray-600 text-lg leading-relaxed mb-8">
                A dual-engine ecosystem designed for the modern Nigerian workforce. Secure, verified, and seamless interaction between talent and demand.
              </p>
            </div>

            {/* Right Image Graphic */}
            <div className="relative">
              <div className="relative w-full aspect-[4/3] rounded-[32px] overflow-hidden bg-gray-200">
                <Image
                  src="/images/feature/office-workspace.png" // Place your workspace image here
                  alt="Modern Workspace"
                  fill
                  className="object-cover"
                />
              </div>
              {/* Floating Green Card */}
              <div className="absolute -bottom-8 -left-8 bg-[#006B32] p-6 rounded-2xl shadow-xl max-w-[280px]">
                <h3 className="text-white font-bold text-lg mb-2">Dual-App Tech</h3>
                <p className="text-white/80 text-sm leading-relaxed">
                  Unified data infrastructure for both providers and customers.
                </p>
              </div>
            </div>
          </div>
        </section>

        {/* =========================================
            2. CORE UTILITIES (BENTO GRID)
            ========================================= */}
        <section className="mb-32">
          <div className="mb-12">
            <h2 className="text-3xl md:text-4xl font-extrabold text-[#191C1D]">Core Utilities</h2>
            <div className="w-16 h-1 bg-[#006B32] mt-4 rounded-full"></div>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
            {/* Bulletproof Verification (Wide) */}
            <div className="md:col-span-2 bg-white rounded-[32px] p-8 shadow-sm flex flex-col justify-between min-h-[300px]">
              <div>
                <div className="w-10 h-10 bg-[#E6F0EB] rounded-xl flex items-center justify-center text-[#006B32] mb-6">
                  <ShieldCheck size={20} />
                </div>
                <h3 className="text-2xl font-bold text-[#191C1D] mb-4">Bulletproof Verification</h3>
                <p className="text-sm text-gray-600 leading-relaxed max-w-md">
                  Our multi-stage verification process integrates national identity databases with localized vetting. Trust isn&apos;t just a word; it&apos;s our architecture.
                </p>
              </div>
              <div className="flex items-center gap-3 mt-8">
                <span className="bg-[#6EE7B7] text-[#004722] text-[10px] font-bold px-3 py-1.5 rounded-full uppercase tracking-wider">
                  NIN Integrated
                </span>
                <span className="bg-gray-100 text-gray-500 text-[10px] font-bold px-3 py-1.5 rounded-full uppercase tracking-wider">
                  Biometric Check
                </span>
              </div>
            </div>

            {/* Precision Discovery (Tall Solid Green) */}
            <div className="md:col-span-1 bg-[#006B32] rounded-[32px] p-8 text-white flex flex-col justify-between min-h-[300px] shadow-sm">
              <div>
                <div className="w-10 h-10 bg-white/20 rounded-xl flex items-center justify-center text-white mb-6">
                  <Target size={20} />
                </div>
                <h3 className="text-2xl font-bold mb-4">Precision Discovery</h3>
                <p className="text-sm text-white/80 leading-relaxed">
                  Find exactly who you need based on location, skill-tier, and verified rating history.
                </p>
              </div>
              {/* Decorative Progress Bar */}
              <div className="w-full h-1.5 bg-white/20 rounded-full mt-8 overflow-hidden">
                <div className="w-2/3 h-full bg-white rounded-full"></div>
              </div>
            </div>

            {/* Direct Sync (Small) */}
            <div className="md:col-span-1 bg-[#F3F4F5] rounded-[32px] p-8 shadow-sm min-h-[260px]">
              <div className="w-10 h-10 bg-[#EEDDCC] rounded-xl flex items-center justify-center text-[#8A5100] mb-6">
                <MessageSquare size={20} />
              </div>
              <h3 className="text-xl font-bold text-[#191C1D] mb-3">Direct Sync</h3>
              <p className="text-sm text-gray-600 leading-relaxed">
                Real-time messaging with attachment support for quotes, sketches, and site photos.
              </p>
            </div>

            {/* Seamless Bookings (Wide with Image Background) */}
            <div className="md:col-span-2 bg-[#F3F4F5] rounded-[32px] p-8 shadow-sm min-h-[260px] relative overflow-hidden flex flex-col justify-center">
              <div className="relative z-10 max-w-sm">
                <div className="w-10 h-10 bg-[#E6F0EB] rounded-xl flex items-center justify-center text-[#006B32] mb-6">
                  <CalendarCheck size={20} />
                </div>
                <h3 className="text-xl font-bold text-[#191C1D] mb-3">Seamless Bookings</h3>
                <p className="text-sm text-gray-600 leading-relaxed">
                  Manage availability, deposits, and milestone payments through a single dashboard. Designed to handle the complexity of Nigerian service delivery.
                </p>
              </div>
              {/* Background Fade Image */}
              <div className="absolute right-0 bottom-0 top-0 w-1/2 opacity-30 pointer-events-none mix-blend-multiply">
                 <Image src="/images/landing/booking-bg.png" alt="Bookings" fill className="object-cover object-right" />
              </div>
            </div>
          </div>
        </section>

        {/* =========================================
            3. TWO WORLDS SECTION
            ========================================= */}
        <section className="mb-32">
          <div className="grid lg:grid-cols-12 gap-16">

            {/* Left Side: Context & Apps */}
            <div className="lg:col-span-4">
              <h2 className="text-3xl md:text-4xl font-extrabold text-[#191C1D] mb-6">
                Designed for <br/>Two Worlds.
              </h2>
              <p className="text-sm text-gray-600 leading-relaxed mb-8">
                Whether you&apos;re looking to hire or looking to work, Stabilize NG provides a bespoke interface optimized for your specific goals.
              </p>

              <div className="space-y-4">
                <div className="flex items-center gap-4 bg-[#F3F4F5] p-4 rounded-xl border border-transparent hover:border-gray-200 transition cursor-pointer">
                  <div className="text-[#006B32]"><User size={20} /></div>
                  <span className="text-sm font-bold text-[#191C1D]">The User App</span>
                </div>
                <div className="flex items-center gap-4 bg-[#F3F4F5] p-4 rounded-xl border border-transparent hover:border-gray-200 transition cursor-pointer">
                  <div className="text-[#8A5100]"><PenTool size={20} /></div>
                  <span className="text-sm font-bold text-[#191C1D]">The Workforce App</span>
                </div>
              </div>
            </div>

            {/* Right Side: Feature Grid */}
            <div className="lg:col-span-8 grid sm:grid-cols-2 gap-6">

              <div className="bg-[#F3F4F5] rounded-3xl p-8">
                <div className="w-8 h-8 bg-white rounded-lg flex items-center justify-center text-[#006B32] mb-6 shadow-sm">
                  <Shield size={16} />
                </div>
                <h4 className="text-lg font-bold text-[#191C1D] mb-2">Escrow Guard</h4>
                <p className="text-xs text-gray-600 leading-relaxed">
                  Funds are only released when both parties confirm milestone completion. Total peace of mind.
                </p>
              </div>

              <div className="bg-[#F3F4F5] rounded-3xl p-8">
                <div className="w-8 h-8 bg-white rounded-lg flex items-center justify-center text-[#006B32] mb-6 shadow-sm">
                  <MapPin size={16} />
                </div>
                <h4 className="text-lg font-bold text-[#191C1D] mb-2">Smart Geo-Tagging</h4>
                <p className="text-xs text-gray-600 leading-relaxed">
                  Hyper-local search ensures you find the nearest qualified artisan, reducing transport delays.
                </p>
              </div>

              <div className="bg-[#F3F4F5] rounded-3xl p-8">
                <div className="w-8 h-8 bg-white rounded-lg flex items-center justify-center text-[#006B32] mb-6 shadow-sm">
                  <FileCheck size={16} />
                </div>
                <h4 className="text-lg font-bold text-[#191C1D] mb-2">Proof of Work</h4>
                <p className="text-xs text-gray-600 leading-relaxed">
                  Digital portfolios linked to real, uneditable customer reviews and verified completed projects.
                </p>
              </div>

              <div className="bg-[#F3F4F5] rounded-3xl p-8">
                <div className="w-8 h-8 bg-white rounded-lg flex items-center justify-center text-[#006B32] mb-6 shadow-sm">
                  <Zap size={16} />
                </div>
                <h4 className="text-lg font-bold text-[#191C1D] mb-2">Instant Payouts</h4>
                <p className="text-xs text-gray-600 leading-relaxed">
                  Artisans get paid within minutes of job completion, fueling the cycle of economic stability.
                </p>
              </div>

            </div>
          </div>
        </section>

        {/* =========================================
            4. CTA BANNER
            ========================================= */}
        <section className="mb-12">
          <div className="bg-gradient-to-br from-[#006B32] to-[#004722] rounded-[40px] px-6 py-20 text-center relative overflow-hidden shadow-lg">
            {/* Background glowing effect */}
            <div className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[500px] h-[500px] bg-[#6EE7B7] rounded-full blur-[120px] opacity-20 pointer-events-none"></div>

            <div className="relative z-10 max-w-2xl mx-auto">
              <h2 className="text-4xl font-extrabold text-white mb-6">
                Ready to stabilize your future?
              </h2>
              <p className="text-white/80 text-sm mb-10 max-w-md mx-auto">
                Join thousands of Nigerians building a more reliable service economy today.
              </p>
              <div className="flex flex-col sm:flex-row justify-center gap-4">
                <Link href="#" className="bg-white text-[#006B32] px-8 py-3.5 rounded-xl font-bold hover:bg-gray-100 transition shadow-sm text-center">
                  Download User App
                </Link>
                <Link href="/workforce" className="bg-[#8A5100] text-white px-8 py-3.5 rounded-xl font-bold hover:bg-[#704200] transition shadow-sm text-center">
                  Become an Artisan
                </Link>
              </div>
            </div>
          </div>
        </section>

      </main>

      <Footer />
    </div>
  );
}
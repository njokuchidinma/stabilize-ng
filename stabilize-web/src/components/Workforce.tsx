import Image from 'next/image';
import Link from 'next/link';
import Navbar from '@/components/generics/Navbar';
import Footer from '@/components/generics/Footer';
import {
  ArrowRight, Star, Briefcase, Calendar,
  MessageSquare, Zap, ShieldCheck
} from 'lucide-react';

export default function ForArtisansPage() {
  return (
    <div className="min-h-screen bg-[#F8F9FA] font-sans selection:bg-[#006B32] selection:text-white">
      <Navbar />

      <main className="pt-28 pb-16 px-6 max-w-7xl mx-auto">

        {/* =========================================
            1. HERO SECTION
            ========================================= */}
        <section className="mb-32">
          <div className="grid lg:grid-cols-12 gap-12 items-center">
            {/* Left Copy */}
            <div className="lg:col-span-5 z-10">
              <div className="inline-block bg-[#6EE7B7]/20 text-[#006B32] text-[10px] font-bold px-3 py-1.5 rounded-full tracking-widest uppercase mb-6">
                Artisan Ecosystem
              </div>
              <h1 className="text-5xl md:text-[64px] font-extrabold text-[#191C1D] leading-[1.05] mb-6 tracking-tight">
                Elevate your <br />
                <span className="text-[#006B32] italic">Craftsmanship.</span>
              </h1>
              <p className="text-gray-600 text-lg mb-8 max-w-md leading-relaxed">
                Stabilize Workforce is the premier digital toolkit for Nigerian artisans. Manage enquiries, secure bookings, and scale your business with editorial precision.
              </p>

              <div className="flex flex-col sm:flex-row gap-4">
                <Link href="#" className="bg-[#006B32] text-white px-8 py-3.5 rounded-xl font-bold flex items-center justify-center gap-2 hover:bg-[#005a2a] transition">
                  Join the Workforce <ArrowRight size={18} />
                </Link>
                <Link href="/feature" className="bg-gray-200 text-[#191C1D] px-8 py-3.5 rounded-xl font-bold hover:bg-gray-300 transition text-center">
                  Learn More
                </Link>
              </div>
            </div>

            {/* Right Graphic */}
            <div className="lg:col-span-7 relative flex justify-end">
              <div className="relative w-full max-w-lg aspect-[4/5] sm:aspect-square rounded-[40px] overflow-hidden bg-gray-200 shadow-xl">
                <Image
                  src="/images/workforce/craftsman.png" // Place your artisan image here
                  alt="Craftsman using tablet"
                  fill
                  className="object-cover"
                />
              </div>
              {/* Floating Success Rate Badge */}
              <div className="absolute -bottom-8 left-4 md:left-12 bg-white p-5 rounded-2xl shadow-xl z-20 flex items-center gap-4">
                <div className="w-12 h-12 bg-[#F59E0B] rounded-full flex items-center justify-center text-white shadow-sm">
                  <Star size={24} fill="currentColor" />
                </div>
                <div>
                  <p className="text-[10px] font-bold text-gray-400 tracking-wider uppercase">Success Rate</p>
                  <p className="text-xl font-extrabold text-[#191C1D]">98.4%</p>
                  <div className="w-full h-1.5 bg-gray-100 rounded-full mt-2">
                    <div className="w-[98%] h-full bg-[#006B32] rounded-full"></div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>

        {/* =========================================
            2. THE WORKFORCE TOOLKIT (BENTO GRID)
            ========================================= */}
        <section className="mb-32">
          <div className="flex flex-col md:flex-row justify-between items-end mb-12">
            <div>
              <h2 className="text-3xl md:text-4xl font-extrabold text-[#191C1D] mb-2">
                The Workforce <span className="text-[#006B32]">Toolkit</span>
              </h2>
              <p className="text-gray-600 text-sm max-w-md">Every feature is designed to eliminate friction between your skill and your client&apos;s needs.</p>
            </div>
            <Link href="/feature" className="flex items-center gap-2 text-[#006B32] font-bold text-sm hover:underline mt-4 md:mt-0">
              See all features <ArrowRight size={16} />
            </Link>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-3 gap-6">

            {/* Digital Shopfront (Wide) */}
            <div className="md:col-span-2 bg-[#ffffff] rounded-[32px] p-8 md:p-10 flex flex-col justify-between overflow-hidden shadow-sm min-h-[340px]">
              <div className="flex justify-between items-start mb-8 z-10 relative">
                <div className="max-w-xs">
                  <div className="text-[10px] font-bold text-[#8A5100] tracking-widest uppercase mb-3">Brand Identity</div>
                  <h3 className="text-2xl font-bold text-[#191C1D] mb-2">Digital Shopfront</h3>
                  <p className="text-sm text-gray-600 leading-relaxed">
                    Curate your portfolio with high-resolution imagery and verified credentials that build instant trust.
                  </p>
                </div>
                <div className="w-10 h-10 bg-[#E6F0EB] rounded-xl flex items-center justify-center text-[#006B32]">
                  <Briefcase size={20} />
                </div>
              </div>

              {/* Mockup embedded in the card */}
              <div className="w-full bg-[#191C1D] rounded-t-2xl p-4 flex gap-4 translate-y-4 shadow-2xl mx-auto max-w-lg">
                <div className="w-24 h-32 bg-gray-700 rounded-xl overflow-hidden flex-shrink-0">
                  <Image src="/images/landing/avatar1.jpg" alt="Profile" width={96} height={128} className="object-cover opacity-80" />
                </div>
                <div className="flex-1 py-2 space-y-3">
                  <div className="w-1/2 h-3 bg-gray-600 rounded-full"></div>
                  <div className="w-3/4 h-2 bg-gray-700 rounded-full"></div>
                  <div className="w-1/3 h-2 bg-gray-700 rounded-full"></div>
                  <div className="flex gap-1 mt-4">
                    {[1,2,3,4,5].map(i => <Star key={i} size={10} className="text-[#F59E0B]" fill="currentColor" />)}
                  </div>
                </div>
              </div>
            </div>

            {/* Handle Bookings (Solid Green Square) */}
            <div className="md:col-span-1 bg-[#006B32] rounded-[32px] p-8 md:p-10 text-white flex flex-col justify-between shadow-sm min-h-[340px] relative overflow-hidden">
              <div className="w-10 h-10 bg-white/20 rounded-xl flex items-center justify-center text-white mb-6">
                <Calendar size={20} />
              </div>
              <div className="relative z-10 mt-auto">
                <h3 className="text-2xl font-bold mb-3">Handle Bookings</h3>
                <p className="text-sm text-white/80 leading-relaxed mb-6">
                  Automated scheduling that respects your workflow. No double bookings, no confusion.
                </p>
                {/* Floating Notification Mock */}
                <div className="bg-[#005a2a] border border-white/10 rounded-xl p-3 flex flex-col gap-1">
                  <div className="flex justify-between items-center">
                    <span className="text-[9px] font-bold text-white/60 tracking-wider">NEW REQUEST</span>
                    <span className="bg-[#F59E0B] text-white text-[9px] font-bold px-2 py-0.5 rounded-full">URGENT</span>
                  </div>
                  <span className="text-sm font-bold text-white">Kitchen Remodel</span>
                  <span className="text-[10px] text-white/70">Oluwa Avenue • Tomorrow, 10:00 AM</span>
                </div>
              </div>
            </div>

            {/* Live Enquiries (Square) */}
            <div className="md:col-span-1 bg-[#FDF9F1] rounded-[32px] p-8 md:p-10 flex flex-col justify-between shadow-sm min-h-[280px]">
              <div>
                <div className="w-10 h-10 bg-[#EEDDCC] rounded-xl flex items-center justify-center text-[#8A5100] mb-6">
                  <MessageSquare size={20} />
                </div>
                <h3 className="text-2xl font-bold text-[#191C1D] mb-3">Live Enquiries</h3>
                <p className="text-sm text-gray-600 leading-relaxed mb-8">
                  Direct messaging pipeline with integrated quoting tools for instant conversions.
                </p>
              </div>
              {/* Avatar Stack */}
              <div className="flex -space-x-3 mt-auto">
                <div className="w-8 h-8 rounded-full border-2 border-[#FDF9F1] bg-gray-300 overflow-hidden"><Image src="/images/landing/avatar2.jpg" alt="A1" width={32} height={32}/></div>
                <div className="w-8 h-8 rounded-full border-2 border-[#FDF9F1] bg-gray-400 overflow-hidden"><Image src="/images/landing/avatar3.jpg" alt="A2" width={32} height={32}/></div>
                <div className="w-8 h-8 rounded-full border-2 border-[#FDF9F1] bg-[#6EE7B7] flex items-center justify-center text-[10px] font-bold text-[#004722] z-10">+12</div>
              </div>
            </div>

            {/* Analytics Engine (Dark Wide) */}
            <div className="md:col-span-2 bg-[#191C1D] rounded-[32px] p-8 md:p-10 flex flex-col md:flex-row items-center justify-between shadow-sm min-h-[280px]">
              <div className="max-w-xs z-10 mb-8 md:mb-0">
                <div className="text-[10px] font-bold text-[#6EE7B7] tracking-widest uppercase mb-3">Analytics Engine</div>
                <h3 className="text-2xl font-bold text-white mb-3">Grow your <span className="text-[#6EE7B7]">Business</span>.</h3>
                <p className="text-sm text-white/60 leading-relaxed mb-8">
                  Leverage data to understand your peak hours, most requested services, and revenue trends.
                </p>
                <div className="flex gap-8">
                  <div>
                    <p className="text-2xl font-extrabold text-white">24%</p>
                    <p className="text-[9px] font-bold text-white/40 tracking-wider uppercase">Avg Growth</p>
                  </div>
                  <div>
                    <p className="text-2xl font-extrabold text-white">4.9</p>
                    <p className="text-[9px] font-bold text-white/40 tracking-wider uppercase">Rating</p>
                  </div>
                </div>
              </div>

              {/* Minimal Bar Chart */}
              <div className="bg-[#24282A] rounded-2xl p-6 flex items-end gap-3 h-40 w-full max-w-[240px]">
                {/* Custom inline chart using Flexbox */}
                <div className="flex-1 bg-[#006B32]/40 rounded-t-lg h-[30%] relative"><span className="absolute -bottom-5 left-1/2 -translate-x-1/2 text-[9px] text-white/40">MON</span></div>
                <div className="flex-1 bg-[#006B32]/60 rounded-t-lg h-[50%] relative"><span className="absolute -bottom-5 left-1/2 -translate-x-1/2 text-[9px] text-white/40">TUE</span></div>
                <div className="flex-1 bg-[#006B32]/80 rounded-t-lg h-[70%] relative"><span className="absolute -bottom-5 left-1/2 -translate-x-1/2 text-[9px] text-white/40">WED</span></div>
                <div className="flex-1 bg-[#6EE7B7] rounded-t-lg h-[90%] relative shadow-[0_0_15px_rgba(110,231,183,0.3)]"><span className="absolute -bottom-5 left-1/2 -translate-x-1/2 text-[9px] text-white/40">THU</span></div>
              </div>
            </div>

          </div>
        </section>

        {/* =========================================
            3. CRAFTED FOR THE NIGERIAN EDGE
            ========================================= */}
        <section className="mb-32">
          <div className="grid lg:grid-cols-2 gap-16 items-center">

            {/* Left Graphics (App Floating) */}
            <div className="relative w-full aspect-square flex items-center justify-center">
               <div className="absolute inset-4 sm:inset-12 bg-gradient-to-br from-[#E6F0EB] to-white rounded-[40px] shadow-sm"></div>
               {/* Decorative faint circles */}
               <div className="absolute w-[120%] h-[120%] border border-gray-200 rounded-full opacity-50"></div>
               <div className="absolute w-[90%] h-[90%] border border-gray-200 rounded-full opacity-50"></div>

               <Image
                  src="/images/landing/workforce-app.png" // The green dashboard mockup
                  alt="Workforce Dashboard"
                  width={280}
                  height={560}
                  className="relative z-10 drop-shadow-2xl rounded-[32px]"
               />
            </div>

            {/* Right Text Content */}
            <div className="max-w-md mx-auto lg:mx-0">
              <h2 className="text-4xl md:text-5xl font-extrabold text-[#191C1D] leading-[1.1] mb-10">
                Crafted for the <br />
                <span className="text-[#006B32] italic">Nigerian Edge.</span>
              </h2>

              <div className="space-y-10">
                {/* Feature 1 */}
                <div className="flex gap-5">
                  <div className="w-12 h-12 bg-[#E6F0EB] rounded-2xl flex items-center justify-center text-[#006B32] flex-shrink-0">
                    <Zap size={22} />
                  </div>
                  <div>
                    <h4 className="text-[#191C1D] font-bold text-base mb-2">Instant Settlement</h4>
                    <p className="text-sm text-gray-500 leading-relaxed">
                      No more waiting. Receive payments directly into your account as soon as the job is marked complete.
                    </p>
                  </div>
                </div>
                {/* Feature 2 */}
                <div className="flex gap-5">
                  <div className="w-12 h-12 bg-[#FDE8D7] rounded-2xl flex items-center justify-center text-[#8A5100] flex-shrink-0">
                    <ShieldCheck size={22} />
                  </div>
                  <div>
                    <h4 className="text-[#191C1D] font-bold text-base mb-2">Escrow Protection</h4>
                    <p className="text-sm text-gray-500 leading-relaxed">
                      Both you and your client are protected. We hold the funds until you deliver your excellence.
                    </p>
                  </div>
                </div>
              </div>

            </div>
          </div>
        </section>

        {/* =========================================
            4. CTA BANNER
            ========================================= */}
        <section className="mb-12">
          <div className="bg-[#006B32] rounded-[40px] px-6 py-20 text-center relative overflow-hidden shadow-lg">
            {/* Soft top gradient highlight */}
            <div className="absolute top-0 left-0 right-0 h-32 bg-gradient-to-b from-white/10 to-transparent pointer-events-none"></div>

            <div className="relative z-10 max-w-3xl mx-auto">
              <h2 className="text-4xl md:text-5xl font-extrabold text-white mb-6">
                Ready to stabilize your future?
              </h2>
              <p className="text-white/80 text-sm mb-10 max-w-lg mx-auto leading-relaxed">
                Join over 15,000 artisans across Nigeria who have modernized their business with Stabilize Workforce.
              </p>
              <div className="flex flex-col sm:flex-row justify-center gap-4">
                <Link href="#" className="bg-white text-[#191C1D] px-6 py-3 rounded-xl font-bold hover:bg-gray-100 transition shadow-sm flex items-center gap-3">
                  <svg viewBox="0 0 384 512" className="w-5 h-5 fill-current" xmlns="http://www.w3.org/2000/svg">
                    <path d="M318.7 268.7c-.2-36.7 16.4-64.4 50-84.8-18.8-26.9-47.2-41.7-84.7-44.6-35.5-2.8-74.3 20.7-88.5 20.7-15 0-49.4-19.7-76.4-19.7C63.3 141.2 4 184.8 4 273.5q0 39.3 14.4 81.2c12.8 36.7 59 126.7 107.2 125.2 25.2-.6 43-17.9 75.8-17.9 31.8 0 48.3 17.9 76.4 17.9 48.6-.7 90.4-82.5 102.6-119.3-65.2-30.7-61.7-90-61.7-91.9zm-56.6-164.2c27.3-32.4 24.8-61.9 24-72.5-24.1 1.4-52 16.4-67.9 34.9-17.5 19.8-27.8 44.3-25.6 71.9 26.1 2 49.9-11.4 69.5-34.3z"/>
                  </svg>
                  <div className="text-left">
                    <div className="text-[10px] font-medium leading-none">Download on the</div>
                    <div className="text-base font-bold leading-tight">App Store</div>
                  </div>
                </Link>
                <Link href="#" className="bg-transparent border-2 border-white text-white px-6 py-3 rounded-xl font-bold hover:bg-white/10 transition shadow-sm flex items-center gap-3">
                  <svg viewBox="0 0 512 512" className="w-5 h-5 fill-current" xmlns="http://www.w3.org/2000/svg">
                    <path d="M325.3 234.3L104.6 13l280.8 161.2-60.1 60.1zM47 0C34 6.8 25.3 19.2 25.3 35.3v441.3c0 16.1 8.7 28.5 21.7 35.3l256.6-256L47 0zm425.2 225.6l-58.9-34.1-65.7 64.5 65.7 64.5 60.1-34.1c18-14.3 18-46.5-1.2-60.8zM104.6 499l280.8-161.2-60.1-60.1L104.6 499z"/>
                  </svg>
                  <div className="text-left">
                    <div className="text-[10px] font-medium leading-none">Get it on</div>
                    <div className="text-base font-bold leading-tight">Google Play</div>
                  </div>
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
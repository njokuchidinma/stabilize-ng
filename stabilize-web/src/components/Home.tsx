import Image from 'next/image';
import Link from 'next/link';
import Navbar from '@/components/generics/Navbar';
import Footer from '@/components/generics/Footer';
import {
  ArrowRight, CheckCircle2, ShoppingCart, Home,
  ArrowUpRight, Download, Briefcase, Monitor
} from 'lucide-react';

export default function HomePage() {
  return (
    <div className="min-h-screen bg-[#F8F9FA] font-sans selection:bg-[#006B32] selection:text-white">
      <Navbar />

      <main className="pt-20">
        {/* =========================================
            1. HERO SECTION
            ========================================= */}
        <section className="relative overflow-hidden pt-20 pb-16 px-6 max-w-7xl mx-auto">
          <div className="grid lg:grid-cols-2 gap-12 items-center">
            {/* Left Copy */}
            <div className="z-10">
              <div className="inline-block bg-[#E6F0EB] text-[#006B32] text-xs font-bold px-3 py-1.5 rounded-full tracking-wider mb-6">
                THE DIGITAL PATRIOT
              </div>
              <h1 className="text-5xl md:text-6xl font-extrabold text-[#191C1D] leading-[1.1] mb-6 tracking-tight">
                Stabilize Fast in <br />
                <span className="text-[#006B32] italic">Any City.</span>
              </h1>
              <p className="text-gray-600 text-lg mb-8 max-w-md leading-relaxed">
                From the bustling streets of Lagos to the serenity of Abuja, Stabilize connects you with elite Nigerian artisans and neighborhood essentials instantly.
              </p>

              <div className="flex flex-col sm:flex-row gap-4 mb-10">
                <Link href="/users" className="bg-[#006B32] text-white px-6 py-3.5 rounded-xl font-bold flex items-center justify-center gap-2 hover:bg-[#005a2a] transition">
                  Get Started <ArrowRight size={18} />
                </Link>
                <Link href="/feature" className="bg-gray-200 text-[#191C1D] px-6 py-3.5 rounded-xl font-bold hover:bg-gray-300 transition text-center">
                  How it works
                </Link>
              </div>

              <div className="flex items-center gap-3 text-xs font-semibold text-gray-500 flex-wrap">
                <span>AVAILABLE IN</span>
                {['Lagos', 'Abuja', 'Port Harcourt', 'Owerri', 'Kaduna'].map((city) => (
                  <span key={city} className="bg-gray-200 px-3 py-1 rounded-full">{city}</span>
                ))}
              </div>
            </div>

            {/* Right Graphic/Mockup */}
            <div className="relative h-[500px] w-full hidden lg:block">
               {/* Mocking the skewed white background and phone image */}
               <div className="absolute inset-0 bg-gradient-to-tr from-gray-100 to-white rounded-3xl transform rotate-3 shadow-xl"></div>
               <div className="absolute inset-4 z-10 flex items-center justify-center">
                  <Image
                    src="/images/landing/user-mockup.png" // Update with your actual image path
                    alt="Stabilize App Mockup"
                    width={300}
                    height={600}
                    className="object-contain drop-shadow-2xl"
                  />
               </div>
               {/* Floating Widget */}
               <div className="absolute bottom-12 left-0 z-20 bg-white p-4 rounded-xl shadow-lg flex items-center gap-4">
                  <div className="w-10 h-10 bg-[#8A5100] rounded-full flex items-center justify-center text-white">
                    <Briefcase size={18} />
                  </div>
                  <div>
                    <p className="text-[10px] font-bold text-gray-500 tracking-wider">ACTIVE TASK</p>
                    <p className="text-sm font-bold text-[#191C1D]">Lagos Island - ₦25,000</p>
                  </div>
               </div>
            </div>
          </div>
        </section>

        {/* =========================================
            2. INFINITE TICKER
            ========================================= */}
        <div className="w-full border-y border-gray-200 bg-[#F3F4F5] py-4 overflow-hidden flex whitespace-nowrap">
          <div className="animate-marquee flex gap-8 text-xs font-bold text-gray-400 tracking-widest">
            {[...['IBADAN', 'ENUGU', 'BENIN CITY', 'JOS', 'WARRI', 'KANO'], ...['IBADAN', 'ENUGU', 'BENIN CITY', 'JOS', 'WARRI', 'KANO']].map((city, i) => (
              <span key={i} className="flex items-center gap-8">
                COMING SOON <ArrowRight size={12} className="mx-2" /> {city}
              </span>
            ))}
          </div>
        </div>

        {/* =========================================
            3. ECOSYSTEM SECTION
            ========================================= */}
        <section className="py-24 px-6 max-w-7xl mx-auto">
          <div className="text-center mb-16">
            <h2 className="text-3xl md:text-4xl font-extrabold text-[#191C1D] mb-4">A Powerful Two-Way Ecosystem</h2>
            <p className="text-gray-600">One platform, two distinct experiences designed for the digital patriot of Nigeria.</p>
          </div>

          <div className="grid md:grid-cols-2 gap-6">
            {/* Consumer Card */}
            <div className="bg-[#F3F4F5] rounded-[32px] p-10 relative overflow-hidden flex flex-col justify-between min-h-[400px]">
              <div className="relative z-10">
                <h3 className="text-2xl font-extrabold text-[#191C1D] mb-3">For Homeowners & Newcomers</h3>
                <p className="text-gray-600 text-sm mb-8 max-w-sm">Access the best plumbers in Maitama, fresh markets in Lagos, and premium housing in Owerri with one click.</p>
                <ul className="space-y-4 mb-8">
                  {[
                    'Nationwide Vetted Artisans',
                    'Local Neighborhood Insights',
                    'Secure Escrow Payments (₦)'
                  ].map((item, i) => (
                    <li key={i} className="flex items-center gap-3 text-sm font-semibold text-[#191C1D]">
                      <CheckCircle2 size={18} className="text-[#006B32]" /> {item}
                    </li>
                  ))}
                </ul>
                <Link href="/users" className="flex items-center gap-2 text-[#006B32] font-bold text-sm hover:underline">
                  Learn more <ArrowRight size={16} />
                </Link>
              </div>
              <Image src="/images/landing/user-mock.png" alt="App" width={200} height={400} className="absolute -bottom-10 -right-10 opacity-50" />
            </div>

            {/* Artisan Card */}
            <div className="bg-[#006B32] rounded-[32px] p-10 relative overflow-hidden flex flex-col justify-between min-h-[400px]">
              <div className="relative z-10">
                <h3 className="text-2xl font-extrabold text-white mb-3">For Artisans & Business Owners</h3>
                <p className="text-white/80 text-sm mb-8 max-w-sm">Professionalize your hustle in PH, Kaduna or Lagos. Manage bookings, invoices, and your reputation on the move.</p>
                <ul className="space-y-4 mb-8">
                  {[
                    'Smart Business Dashboard',
                    'Instant Digital Invoicing',
                    'Growth Analytics & CRM'
                  ].map((item, i) => (
                    <li key={i} className="flex items-center gap-3 text-sm font-semibold text-white">
                      <CheckCircle2 size={18} className="text-[#6EE7B7]" /> {item}
                    </li>
                  ))}
                </ul>
                <Link href="/workforce" className="bg-white text-[#006B32] px-6 py-3 rounded-xl font-bold text-sm hover:bg-gray-100 transition w-fit inline-block">
                  Join the Workforce
                </Link>
              </div>
              <Image src="/images/landing/artisan-mock.png" alt="App" width={200} height={400} className="absolute -bottom-10 -right-10 opacity-50" />
            </div>
          </div>
        </section>

        {/* =========================================
            4. BENTO GRID FEATURES
            ========================================= */}
        <section className="py-24 px-6 max-w-7xl mx-auto border-t border-gray-200">
          <div className="flex flex-col md:flex-row justify-between items-end mb-12">
            <div>
              <h2 className="text-3xl md:text-4xl font-extrabold text-[#191C1D] mb-4">
                Everything you need to <br/><span className="text-[#8A5100] italic">stabilize</span>.
              </h2>
              <p className="text-gray-600">We&apos;ve mapped Nigeria&apos;s top cities so you don&apos;t have to wander.</p>
            </div>
            <Link href="/feature" className="flex items-center gap-2 text-[#006B32] font-bold text-sm hover:underline mt-4 md:mt-0">
              View all services <ArrowRight size={16} />
            </Link>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
            {/* Top Row */}
            <div className="md:col-span-2 bg-[#E7E8E9] rounded-[24px] p-8 flex flex-col justify-between overflow-hidden relative min-h-[280px]">
              <div className="z-10 max-w-xs">
                <h3 className="text-xl font-bold text-[#191C1D] mb-2">Elite Artisans</h3>
                <p className="text-sm text-gray-600 mb-6">Plumbers, Electricians, and AC Technicians across Owerri, Lagos, and Abuja.</p>
                {/* Micro Profile Card */}
                <div className="bg-white p-3 rounded-xl flex items-center gap-3 w-fit shadow-sm">
                  <div className="w-10 h-10 bg-gray-800 rounded-full"></div>
                  <div>
                    <p className="text-sm font-bold text-[#191C1D]">Chinedu K.</p>
                    <p className="text-[10px] text-gray-500">Pro Specialist</p>
                  </div>
                </div>
              </div>
              {/* Decorative graphic right */}
              <div className="absolute right-[-40px] bottom-[-40px] opacity-30 pointer-events-none">
                 <Image src="/images/landing/pattern.png" width={250} height={250} alt="Pattern" />
              </div>
            </div>

            <div className="md:col-span-1 bg-[#8A5100] rounded-[24px] p-8 text-white relative overflow-hidden min-h-[280px]">
              <ShoppingCart size={28} className="mb-auto opacity-80" />
              <div className="absolute bottom-8 left-8 right-8 z-10">
                <h3 className="text-xl font-bold mb-2">Market Runner</h3>
                <p className="text-sm text-white/80">From Wuse to Mile 12. Fresh groceries delivered at fixed prices.</p>
              </div>
              <div className="absolute inset-0 bg-black/10 z-0"></div> {/* Dark overlay for image if you add one */}
            </div>

            {/* Bottom Row */}
            <div className="md:col-span-1 bg-[#F3F4F5] rounded-[24px] p-8 min-h-[240px] flex flex-col justify-between">
              <div className="w-12 h-12 bg-white rounded-xl flex items-center justify-center shadow-sm">
                <Home size={20} className="text-[#006B32]" />
              </div>
              <div>
                <h3 className="text-xl font-bold text-[#191C1D] mb-2">Housing Guide</h3>
                <p className="text-sm text-gray-600">Finding the right apartment in Kaduna or Owerri just got easier.</p>
              </div>
            </div>

            <div className="md:col-span-2 bg-[#E7E8E9] rounded-[24px] p-8 flex items-center justify-between min-h-[240px]">
              <div className="max-w-sm">
                <h3 className="text-xl font-bold text-[#191C1D] mb-2">Verified Gadget &amp; Workstation Vendors</h3>
                <p className="text-sm text-gray-600 mb-6">Discover trusted vendors for gadgets, tools, and workstation equipment across Nigeria&apos;s top cities.</p>
                <Link href="#" className="flex items-center gap-2 text-[#006B32] font-bold text-sm hover:underline">
                  Explore Vendors <ArrowUpRight size={16} />
                </Link>
              </div>
              <div className="hidden sm:block">
                 <div className="w-40 h-40 bg-[#F3F4F5] rounded-full flex items-center justify-center">
                   <Monitor size={48} className="text-[#006B32]" />
                 </div>
              </div>
            </div>
          </div>
        </section>

        {/* =========================================
            5. STATS SECTION
            ========================================= */}
        <section className="py-16 px-6 max-w-7xl mx-auto">
          <div className="grid grid-cols-2 md:grid-cols-4 gap-8 divide-x divide-gray-200 text-center">
            <div>
              <p className="text-4xl font-extrabold text-[#006B32] mb-2">25k+</p>
              <p className="text-xs font-bold text-gray-500 uppercase tracking-wider">Vetted Artisans</p>
            </div>
            <div>
              <p className="text-4xl font-extrabold text-[#006B32] mb-2">₦850M</p>
              <p className="text-xs font-bold text-gray-500 uppercase tracking-wider">Payouts Processed</p>
            </div>
            <div>
              <p className="text-4xl font-extrabold text-[#006B32] mb-2">5</p>
              <p className="text-xs font-bold text-gray-500 uppercase tracking-wider">Major City Hubs</p>
            </div>
            <div>
              <p className="text-4xl font-extrabold text-[#006B32] mb-2">4.9/5</p>
              <p className="text-xs font-bold text-gray-500 uppercase tracking-wider">User Rating</p>
            </div>
          </div>
        </section>

        {/* =========================================
            6. CTA SECTION
            ========================================= */}
        <section className="py-24 px-6 max-w-7xl mx-auto">
          <div className="bg-[#006B32] rounded-[40px] px-6 py-20 text-center relative overflow-hidden">
             {/* Optional background abstract waves here */}
            <div className="relative z-10 max-w-2xl mx-auto">
              <h2 className="text-4xl md:text-5xl font-extrabold text-white mb-6">
                Ready to stabilize your city experience?
              </h2>
              <p className="text-white/80 text-lg mb-10">
                Download the app today and join thousands of Digital Patriots building a better nationwide workflow.
              </p>
              <div className="flex flex-col sm:flex-row justify-center gap-4">
                <Link href="#" className="bg-white text-[#006B32] px-8 py-4 rounded-xl font-bold flex items-center justify-center gap-2 hover:bg-gray-100 transition">
                  <Download size={18} /> Download for Users
                </Link>
                <Link href="/workforce" className="bg-transparent border-2 border-white text-white px-8 py-4 rounded-xl font-bold hover:bg-white/10 transition text-center">
                  Join as Artisan
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
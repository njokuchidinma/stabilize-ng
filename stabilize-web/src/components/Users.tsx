import Image from 'next/image';
import Link from 'next/link';
import Navbar from '@/components/generics/Navbar';
import Footer from '@/components/generics/Footer';
import {
  Home, ShoppingBag, Wrench, ArrowRight,
  ShieldCheck, CreditCard
} from 'lucide-react';

export default function ForUsersPage() {
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
              <div className="inline-block bg-[#E6F0EB] text-[#006B32] text-[10px] font-bold px-3 py-1.5 rounded-full tracking-widest uppercase mb-6">
                The Digital Patriot
              </div>
              <h1 className="text-5xl md:text-[64px] font-extrabold text-[#191C1D] leading-[1.05] mb-6 tracking-tight">
                Settling in <br />
                <span className="text-[#006B32]">Naija</span> made easy.
              </h1>
              <p className="text-gray-600 text-lg mb-8 max-w-md leading-relaxed">
                Designed for Corps members and New Movers. Find trusted artisans, discover local food markets, and secure premium housing across Nigeria&apos;s major hubs.
              </p>

              <div className="flex flex-col sm:flex-row gap-4">
                <Link href="#" className="bg-[#006B32] text-white px-8 py-3.5 rounded-xl font-bold hover:bg-[#005a2a] transition text-center">
                  Start Your Journey
                </Link>
                <Link href="#" className="bg-gray-200 text-[#191C1D] px-8 py-3.5 rounded-xl font-bold hover:bg-gray-300 transition text-center">
                  Explore Owerri
                </Link>
              </div>
            </div>

            {/* Right Graphic */}
            <div className="lg:col-span-7 relative">
              <div className="relative w-full aspect-[4/5] sm:aspect-[4/3] lg:aspect-[4/4] rounded-[40px] overflow-hidden bg-gray-200 shadow-lg">
                <Image
                  src="/images/users/interior-plant.png" // Place your interior/home image here
                  alt="Beautiful Nigerian Apartment"
                  fill
                  className="object-cover"
                />
              </div>
              {/* Floating Trusted Card */}
              <div className="absolute -bottom-8 -left-8 bg-white p-6 rounded-2xl shadow-xl max-w-[280px] z-20">
                <div className="flex items-center gap-2 mb-2">
                  <ShieldCheck size={20} className="text-[#006B32]" />
                  <h3 className="text-[#191C1D] font-bold text-sm">Trusted Network</h3>
                </div>
                <p className="text-gray-500 text-xs leading-relaxed">
                  Access over 5,000 verified local artisans and vendors in 5 major cities.
                </p>
              </div>
            </div>
          </div>
        </section>

        {/* =========================================
            2. ESSENTIAL TOOLKIT (BENTO GRID)
            ========================================= */}
        <section className="mb-32">
          <div className="mb-12">
            <h2 className="text-3xl md:text-4xl font-extrabold text-[#191C1D] mb-2">Your Essential Toolkit</h2>
            <p className="text-gray-600 text-sm">Curated solutions for the modern patriot.</p>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-3 gap-6">

            {/* Housing & Sanctuaries (Wide) */}
            <div className="md:col-span-2 bg-[#F3F4F5] rounded-[32px] p-8 md:p-10 flex flex-col md:flex-row justify-between relative overflow-hidden shadow-sm min-h-[280px]">
              <div className="relative z-10 max-w-sm mb-8 md:mb-0">
                <div className="w-10 h-10 bg-white rounded-xl flex items-center justify-center text-[#006B32] mb-6 shadow-sm">
                  <Home size={20} />
                </div>
                <h3 className="text-2xl font-bold text-[#191C1D] mb-3">Housing & Sanctuaries</h3>
                <p className="text-sm text-gray-600 leading-relaxed mb-6">
                  Skip the stress of house hunting. We curate vetted apartments tailored for NYSC budgets and professional standards in Lagos, PH, and Abuja.
                </p>
                <Link href="#" className="flex items-center gap-2 text-[#006B32] font-bold text-sm hover:underline">
                  View Listings <ArrowRight size={16} />
                </Link>
              </div>
              {/* Building overlay graphic */}
              <div className="absolute right-0 bottom-0 top-0 w-1/2 md:w-[45%] opacity-40 pointer-events-none mix-blend-multiply">
                 <Image src="/images/users/building-fade.png" alt="Building" fill className="object-cover object-right" />
              </div>
            </div>

            {/* Market Intel (Square) */}
            <div className="md:col-span-1 bg-[#FDE8D7] rounded-[32px] p-8 md:p-10 flex flex-col justify-between shadow-sm min-h-[280px]">
              <div>
                <div className="w-10 h-10 bg-[#EEDDCC] rounded-xl flex items-center justify-center text-[#8A5100] mb-6">
                  <ShoppingBag size={20} />
                </div>
                <h3 className="text-2xl font-bold text-[#191C1D] mb-3">Market Intel</h3>
                <p className="text-sm text-[#8A5100]/80 leading-relaxed mb-8">
                  Real-time pricing for food markets in Owerri and Kaduna. Save up to 30% on groceries with local guides.
                </p>
              </div>
              {/* Mini Price Tag UI */}
              <div className="bg-white/50 backdrop-blur-sm rounded-xl p-3 flex justify-between items-center">
                <span className="text-xs font-semibold text-[#8A5100]">Garri (M. Paint)</span>
                <span className="text-sm font-extrabold text-[#191C1D]">₦2,800</span>
              </div>
            </div>

            {/* Top-Tier Artisans (Square) */}
            <div className="md:col-span-1 bg-[#F3F4F5] rounded-[32px] p-8 md:p-10 flex flex-col justify-between shadow-sm min-h-[280px]">
              <div>
                <div className="w-10 h-10 bg-white rounded-xl flex items-center justify-center text-[#006B32] mb-6 shadow-sm">
                  <Wrench size={20} />
                </div>
                <h3 className="text-2xl font-bold text-[#191C1D] mb-3">Top-Tier Artisans</h3>
                <p className="text-sm text-gray-600 leading-relaxed mb-8">
                  From plumbers to solar installers. Verified experts who show up on time.
                </p>
              </div>
              {/* Avatar Stack */}
              <div className="flex -space-x-3">
                <div className="w-10 h-10 rounded-full border-2 border-[#F3F4F5] bg-gray-300 overflow-hidden"><Image src="/images/landing/avatar1.jpg" alt="A1" width={40} height={40}/></div>
                <div className="w-10 h-10 rounded-full border-2 border-[#F3F4F5] bg-gray-400 overflow-hidden"><Image src="/images/landing/avatar2.jpg" alt="A2" width={40} height={40}/></div>
                <div className="w-10 h-10 rounded-full border-2 border-[#F3F4F5] bg-gray-500 overflow-hidden"><Image src="/images/landing/avatar3.jpg" alt="A3" width={40} height={40}/></div>
                <div className="w-10 h-10 rounded-full border-2 border-[#F3F4F5] bg-[#006B32] flex items-center justify-center text-[10px] font-bold text-white z-10">+5k</div>
              </div>
            </div>

            {/* National Presence (Wide) */}
            <div className="md:col-span-2 bg-[#FDF9F1] rounded-[32px] overflow-hidden shadow-sm min-h-[280px]">
              <div className="grid grid-cols-1 sm:grid-cols-2 h-full">
                <div className="p-8 md:p-10 flex flex-col justify-center">
                  <h3 className="text-2xl font-bold text-[#191C1D] mb-3">National Presence</h3>
                  <p className="text-sm text-gray-600 leading-relaxed mb-6">
                    Actively stabilizing life in Nigeria&apos;s key economic zones.
                  </p>
                  <ul className="space-y-2">
                    {['Lagos', 'Abuja', 'Port Harcourt', 'Owerri', 'Kaduna'].map((city) => (
                      <li key={city} className="flex items-center gap-2 text-xs font-bold text-[#191C1D]">
                        <div className="w-1.5 h-1.5 rounded-full bg-[#006B32]"></div> {city}
                      </li>
                    ))}
                  </ul>
                </div>
                <div className="relative min-h-[240px] w-1/2">
                  <Image src="/images/users/nigeria-map.png" alt="Map of Nigeria" fill className="object-contain p-6" />
                </div>
              </div>
            </div>

          </div>
        </section>

        {/* =========================================
            3. APP HIGHLIGHT SECTION (full-width bg)
            ========================================= */}
        <section className="mb-32 bg-[#F3F4F5] py-24 -mx-6 px-6" style={{ width: 'calc(100% + 3rem)' }}>
          <div className="max-w-7xl mx-auto">
            <div className="grid lg:grid-cols-2 gap-16 items-center">

              {/* Left Phone Mockup */}
              <div className="relative w-full aspect-square md:aspect-[4/3] lg:aspect-square flex items-center justify-center">
                <div className="absolute inset-0 bg-[#006B32] rounded-[40px] transform -rotate-3 scale-95 opacity-90 border-4 border-white shadow-2xl"></div>
                <Image
                    src="/images/landing/user-mockup.png"
                    alt="Stabilize App Interface"
                    width={300}
                    height={600}
                    className="relative z-10 drop-shadow-2xl"
                />
              </div>

              {/* Right Text Content */}
              <div className="max-w-md mx-auto lg:mx-0">
                <h2 className="text-4xl md:text-5xl font-extrabold text-[#191C1D] leading-[1.1] mb-6">
                  Your life, <br />
                  <span className="text-[#006B32] italic">stabilized</span> in an app.
                </h2>
                <p className="text-gray-600 text-sm leading-relaxed mb-10">
                  Access our full ecosystem from your pocket. Whether you&apos;re tracking your rent savings or booking a verified mechanic, our interface is built to be clean, fast, and remarkably intuitive.
                </p>

                <div className="space-y-8">
                  {/* Feature 1 */}
                  <div className="flex gap-4">
                    <div className="w-10 h-10 bg-[#E6F0EB] rounded-xl flex items-center justify-center text-[#006B32] flex-shrink-0">
                      <ShieldCheck size={20} />
                    </div>
                    <div>
                      <h4 className="text-[#191C1D] font-bold text-sm mb-1">Identity Verification</h4>
                      <p className="text-xs text-gray-500 leading-relaxed">
                        Every user and artisan undergoes rigorous KYC checks for your safety.
                      </p>
                    </div>
                  </div>
                  {/* Feature 2 */}
                  <div className="flex gap-4">
                    <div className="w-10 h-10 bg-[#E6F0EB] rounded-xl flex items-center justify-center text-[#006B32] flex-shrink-0">
                      <CreditCard size={20} />
                    </div>
                    <div>
                      <h4 className="text-[#191C1D] font-bold text-sm mb-1">Escrow Payments</h4>
                      <p className="text-xs text-gray-500 leading-relaxed">
                        Pay through the app and only release funds when you&apos;re 100% satisfied.
                      </p>
                    </div>
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
            {/* Optional glowing gradient in the background */}
            <div className="absolute bottom-0 left-1/2 -translate-x-1/2 w-[600px] h-[300px] bg-[#6EE7B7] rounded-full blur-[100px] opacity-10 pointer-events-none"></div>

            <div className="relative z-10 max-w-2xl mx-auto">
              <h2 className="text-4xl font-extrabold text-white mb-6">
                Ready to move with confidence?
              </h2>
              <p className="text-white/80 text-sm mb-10 max-w-md mx-auto">
                Join 50,000+ users who have simplified their relocation and daily living with Stabilize NG.
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
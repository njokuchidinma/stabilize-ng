import Image from 'next/image';
import Link from 'next/link';
import Navbar from '@/components/generics/Navbar';
import Footer from '@/components/generics/Footer';
import { Shield, Lock } from 'lucide-react';

export default function AboutPage() {
  return (
    <div className="min-h-screen bg-[#F8F9FA] font-sans selection:bg-[#006B32] selection:text-white">
      <Navbar />

      <main className="pt-28 pb-16 px-6 max-w-7xl mx-auto">

        {/* =========================================
            1. MANIFESTO HEADER
            ========================================= */}
        <section className="mb-20">
          <div className="text-[10px] font-bold text-[#006B32] tracking-[0.2em] uppercase mb-6">
            Our Manifesto
          </div>
          <div className="grid lg:grid-cols-12 gap-12 items-end">
            <div className="lg:col-span-7">
              <h1 className="text-5xl md:text-6xl lg:text-[72px] font-extrabold text-[#191C1D] leading-[1.05] tracking-tight">
                Empowering the <br />
                <span className="text-[#006B32]">Digital Patriots</span> of <br />
                Nigeria.
              </h1>
            </div>
            <div className="lg:col-span-5 pb-4">
              <p className="text-gray-600 text-lg leading-relaxed max-w-md">
                We aren&apos;t just building a utility. We are curating a movement for the modern Nigerian professional who demands stability, transparency, and excellence.
              </p>
            </div>
          </div>
        </section>

        {/* =========================================
            2. THE VISION SECTION
            ========================================= */}
        <section className="mb-32">
          <div className="grid lg:grid-cols-2 gap-16 items-center">
            {/* Image Placeholder */}
            <div className="relative w-full aspect-[4/3] rounded-[32px] overflow-hidden bg-gray-200">
              <Image
                src="/images/about/vision-team.png" // Place your team/vision image here
                alt="Stabilize NG Team Vision"
                fill
                className="object-cover"
              />
            </div>

            {/* Text Content */}
            <div className="max-w-md">
              <h2 className="text-3xl font-extrabold text-[#191C1D] mb-6">The Vision</h2>
              <div className="space-y-6 text-gray-600 text-sm leading-relaxed">
                <p>
                  Stabilize NG was born from a simple observation: Nigeria&apos;s digital economy is thriving, yet the infrastructure connecting artisans and users remains fragmented. We envisioned a platform that doesn&apos;t just &quot;list services&quot; but creates a standard of trust.
                </p>
                <p>
                  From the bustling tech hubs of Lagos to the rising talent in Owerri, we are dedicated to bridging the gap between exceptional skill and the people who need it most.
                </p>
              </div>
            </div>
          </div>
        </section>

        {/* =========================================
            3. ROOTS ACROSS THE NATION (BENTO GRID)
            ========================================= */}
        <section className="mb-32">
          <div className="flex flex-col md:flex-row justify-between items-end border-b border-gray-200 pb-4 mb-8">
            <h2 className="text-3xl font-extrabold text-[#191C1D]">Roots Across the Nation</h2>
            <div className="text-[10px] font-bold text-[#006B32] tracking-widest mt-4 md:mt-0">
              5 STRATEGIC HUBS
            </div>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
            {/* Lagos - Tall Card */}
            <div className="md:col-span-1 md:row-span-2 bg-white rounded-[32px] p-8 flex flex-col justify-between min-h-[400px] relative overflow-hidden shadow-sm">
              <div className="relative z-10">
                <h3 className="text-2xl font-extrabold text-[#191C1D]">Lagos</h3>
                <p className="text-[10px] font-bold text-gray-400 tracking-wider uppercase mt-1 mb-6">The Pulse</p>
              </div>
              <p className="text-sm text-gray-600 relative z-10">
                Our operational headquarters, driving innovation at the speed of the city.
              </p>
              {/* Decorative Graphic */}
              <div className="absolute -bottom-8 -right-8 opacity-20 pointer-events-none">
                {/* Decorative Graphic (Network/Pulse) */}
                <svg
                width="150"
                height="150"
                viewBox="0 0 150 150"
                fill="none"
                xmlns="http://www.w3.org/2000/svg"
                className="absolute -bottom-8 -right-8 opacity-20 pointer-events-none text-gray-800"
                >
                {/* Connecting Lines */}
                <line x1="110" y1="110" x2="45" y2="80" stroke="currentColor" strokeWidth="10" strokeLinecap="round" />
                <line x1="110" y1="110" x2="130" y2="35" stroke="currentColor" strokeWidth="10" strokeLinecap="round" />
                <line x1="110" y1="110" x2="50" y2="150" stroke="currentColor" strokeWidth="10" strokeLinecap="round" />
                <line x1="110" y1="110" x2="160" y2="100" stroke="currentColor" strokeWidth="10" strokeLinecap="round" />

                {/* Network Nodes */}
                <circle cx="110" cy="110" r="26" fill="currentColor" />
                <circle cx="45" cy="80" r="18" fill="currentColor" />
                <circle cx="130" cy="35" r="14" fill="currentColor" />
                <circle cx="50" cy="150" r="16" fill="currentColor" />
                <circle cx="160" cy="100" r="12" fill="currentColor" />
                </svg>
              </div>
            </div>

            {/* Abuja - Top Middle */}
            <div className="md:col-span-1 bg-white rounded-[32px] p-8 shadow-sm">
              <h3 className="text-2xl font-extrabold text-[#191C1D]">Abuja</h3>
              <p className="text-[10px] font-bold text-gray-400 tracking-wider uppercase mt-1 mb-4">The Anchor</p>
              <p className="text-sm text-gray-600">
                Strategic growth and governance oversight, from the heart of Nigeria.
              </p>
            </div>

            {/* Kaduna - Top Right */}
            <div className="md:col-span-1 bg-white rounded-[32px] p-8 shadow-sm">
              <h3 className="text-2xl font-extrabold text-[#191C1D]">Kaduna</h3>
              <p className="text-[10px] font-bold text-gray-400 tracking-wider uppercase mt-1 mb-4">The Frontier</p>
              <p className="text-sm text-gray-600">
                Empowering Northern digital ecosystems and creative talent.
              </p>
            </div>

            {/* PH & Owerri - Wide Bottom */}
            <div className="md:col-span-2 bg-[#F3F4F5] rounded-[32px] p-8 flex flex-col sm:flex-row items-center justify-between overflow-hidden relative">
              <div className="max-w-xs z-10 mb-6 sm:mb-0">
                <h3 className="text-2xl font-extrabold text-[#191C1D]">PH & Owerri</h3>
                <p className="text-[10px] font-bold text-gray-400 tracking-wider uppercase mt-1 mb-4">The Rising Bar</p>
                <p className="text-sm text-gray-600">
                  Championing the creative and technical spirit of the South-East and South-South regions.
                </p>
              </div>
              {/* Map Graphic Overlay */}
              <div className="relative w-40 h-40 sm:w-48 sm:h-48 z-10 rounded-xl overflow-hidden mix-blend-multiply opacity-50">
                 <Image src="/images/about/map-grid.png" alt="Map Grid" fill className="object-cover" />
              </div>
            </div>
          </div>
        </section>

        {/* =========================================
            4. OUR COMMITMENT
            ========================================= */}
        <section className="mb-32">
          <div className="text-center mb-16">
            <div className="inline-block bg-[#E6F0EB] text-[#006B32] text-[10px] font-bold px-3 py-1.5 rounded-full tracking-wider mb-6 uppercase">
              Our Commitment
            </div>
            <h2 className="text-3xl md:text-4xl font-extrabold text-[#191C1D]">
              A nation built on <span className="text-[#006B32] italic">stability</span> and <br />
              <span className="text-[#006B32] italic">trust</span>.
            </h2>
          </div>

          <div className="grid md:grid-cols-2 gap-12 max-w-4xl mx-auto">
            {/* Authentic Vetting */}
            <div>
              <div className="w-12 h-12 bg-[#006B32] rounded-xl flex items-center justify-center text-white mb-6">
                <Shield size={24} />
              </div>
              <h3 className="text-xl font-extrabold text-[#191C1D] mb-3">Authentic Vetting</h3>
              <p className="text-sm text-gray-600 leading-relaxed">
                Every artisan on our platform undergoes a rigorous multi-stage verification process to ensure zero compromise on quality.
              </p>
            </div>

            {/* Secure Transactions */}
            <div>
              <div className="w-12 h-12 bg-[#8A5100] rounded-xl flex items-center justify-center text-white mb-6">
                <Lock size={24} />
              </div>
              <h3 className="text-xl font-extrabold text-[#191C1D] mb-3">Secure Transactions</h3>
              <p className="text-sm text-gray-600 leading-relaxed">
                Our escrow-style payment system ensures that funds are only released when both parties are completely satisfied.
              </p>
            </div>
          </div>
        </section>

        {/* =========================================
            5. CTA BANNER
            ========================================= */}
        <section className="mb-12">
          <div className="bg-[#006B32] rounded-[40px] px-6 py-20 text-center relative overflow-hidden">
            {/* Optional decorative background block */}
            <div className="absolute left-0 top-0 w-64 h-64 bg-white opacity-5 rounded-br-[100px] pointer-events-none"></div>

            <div className="relative z-10 max-w-2xl mx-auto">
              <h2 className="text-4xl font-extrabold text-white mb-6">
                Ready to join the ecosystem?
              </h2>
              <p className="text-white/80 text-sm mb-10 max-w-md mx-auto">
                Whether you&apos;re a skilled professional or looking for world-class services, the journey starts here.
              </p>
              <div className="flex flex-col sm:flex-row justify-center gap-4">
                <Link href="/users" className="bg-white text-[#006B32] px-8 py-3.5 rounded-xl font-bold hover:bg-gray-100 transition text-center">
                  Get Started Now
                </Link>
                <Link href="#" className="bg-[#005a2a] text-white px-8 py-3.5 rounded-xl font-bold hover:bg-[#004722] transition text-center">
                  Contact Sales
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
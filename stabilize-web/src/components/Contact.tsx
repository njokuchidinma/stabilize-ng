import Navbar from '@/components/generics/Navbar';
import Footer from '@/components/generics/Footer';
import {
  Mail,
  Phone,
  MapPin,
  Clock,
  MessageSquare,
  ArrowRight,
} from 'lucide-react';

const offices = [
  { city: 'Lagos', address: 'Victoria Island, Lagos', type: 'Headquarters' },
  { city: 'Abuja', address: 'Wuse 2, Abuja', type: 'Regional Office' },
  {
    city: 'Port Harcourt',
    address: 'GRA Phase 2, Port Harcourt',
    type: 'Regional Office',
  },
  {
    city: 'Owerri',
    address: 'New Owerri, Imo State',
    type: 'Regional Office',
  },
  { city: 'Kaduna', address: 'Barnawa, Kaduna', type: 'Regional Office' },
];

export default function ContactPage() {
  return (
    <div className="min-h-screen bg-[#F8F9FA] font-sans selection:bg-[#006B32] selection:text-white">
      <Navbar />

      <main className="pt-28 pb-16 px-6 max-w-7xl mx-auto">
        {/* Header */}
        <section className="mb-20">
          <div className="grid lg:grid-cols-12 gap-12 items-end">
            <div className="lg:col-span-7">
              <div className="inline-flex items-center gap-2 bg-[#E6F0EB] text-[#006B32] text-[10px] font-bold px-3 py-1.5 rounded-full tracking-widest uppercase mb-6">
                <MessageSquare size={12} /> Get in Touch
              </div>
              <h1 className="text-5xl md:text-6xl font-extrabold text-[#191C1D] leading-[1.05] tracking-tight">
                Contact <span className="text-[#006B32]">Us</span>
              </h1>
            </div>
            <div className="lg:col-span-5 pb-4">
              <p className="text-gray-600 text-lg leading-relaxed">
                Whether you have a question, feedback, or partnership inquiry,
                we&apos;d love to hear from you.
              </p>
            </div>
          </div>
        </section>

        {/* Contact Cards */}
        <section className="mb-20">
          <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
            {/* Email */}
            <div className="bg-white rounded-[32px] p-8 shadow-sm flex flex-col justify-between min-h-[240px]">
              <div className="w-12 h-12 bg-[#E6F0EB] rounded-2xl flex items-center justify-center text-[#006B32] mb-6">
                <Mail size={22} />
              </div>
              <div>
                <h3 className="text-lg font-bold text-[#191C1D] mb-2">
                  Email Us
                </h3>
                <p className="text-sm text-gray-600 mb-4">
                  For general inquiries and support.
                </p>
                <a
                  href="mailto:hello@stabilize.ng"
                  className="text-[#006B32] font-bold text-sm hover:underline"
                >
                  hello@stabilize.ng
                </a>
              </div>
            </div>

            {/* Phone */}
            <div className="bg-white rounded-[32px] p-8 shadow-sm flex flex-col justify-between min-h-[240px]">
              <div className="w-12 h-12 bg-[#FDE8D7] rounded-2xl flex items-center justify-center text-[#8A5100] mb-6">
                <Phone size={22} />
              </div>
              <div>
                <h3 className="text-lg font-bold text-[#191C1D] mb-2">
                  Call Us
                </h3>
                <p className="text-sm text-gray-600 mb-4">
                  Mon — Fri, 8am to 6pm WAT.
                </p>
                <a
                  href="tel:+2349000000000"
                  className="text-[#006B32] font-bold text-sm hover:underline"
                >
                  +234 900 000 0000
                </a>
              </div>
            </div>

            {/* Response Time */}
            <div className="bg-[#006B32] rounded-[32px] p-8 text-white flex flex-col justify-between min-h-[240px]">
              <div className="w-12 h-12 bg-white/20 rounded-2xl flex items-center justify-center text-white mb-6">
                <Clock size={22} />
              </div>
              <div>
                <h3 className="text-lg font-bold mb-2">Response Time</h3>
                <p className="text-sm text-white/80 mb-4">
                  We typically respond within 24 hours on business days.
                </p>
                <div className="flex items-center gap-2">
                  <div className="w-2 h-2 bg-[#6EE7B7] rounded-full animate-pulse"></div>
                  <span className="text-sm font-semibold text-[#6EE7B7]">
                    Online Now
                  </span>
                </div>
              </div>
            </div>
          </div>
        </section>

        {/* Office Locations */}
        <section className="mb-20">
          <div className="flex flex-col md:flex-row justify-between items-end border-b border-gray-200 pb-4 mb-8">
            <h2 className="text-3xl font-extrabold text-[#191C1D]">
              Our Offices
            </h2>
            <div className="text-[10px] font-bold text-[#006B32] tracking-widest mt-4 md:mt-0">
              5 LOCATIONS NATIONWIDE
            </div>
          </div>

          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
            {offices.map((office) => (
              <div
                key={office.city}
                className="bg-[#F3F4F5] rounded-[24px] p-6"
              >
                <div className="flex items-start gap-3 mb-4">
                  <MapPin
                    size={18}
                    className="text-[#006B32] mt-0.5 flex-shrink-0"
                  />
                  <div>
                    <h3 className="text-lg font-bold text-[#191C1D]">
                      {office.city}
                    </h3>
                    <p className="text-[10px] font-bold text-gray-400 tracking-wider uppercase">
                      {office.type}
                    </p>
                  </div>
                </div>
                <p className="text-sm text-gray-600">{office.address}</p>
              </div>
            ))}
          </div>
        </section>

        {/* Partnership CTA */}
        <section className="mb-12">
          <div className="bg-[#F3F4F5] rounded-[32px] p-8 md:p-12 flex flex-col md:flex-row items-center justify-between gap-8">
            <div className="max-w-lg">
              <h3 className="text-2xl font-extrabold text-[#191C1D] mb-3">
                Interested in partnering with us?
              </h3>
              <p className="text-sm text-gray-600 leading-relaxed">
                We collaborate with organizations, government bodies, and
                enterprises to expand the Stabilize ecosystem across Nigeria.
              </p>
            </div>
            <a
              href="mailto:partnerships@stabilize.ng"
              className="flex items-center gap-2 bg-[#006B32] text-white px-8 py-3.5 rounded-xl font-bold hover:bg-[#005a2a] transition flex-shrink-0"
            >
              Partner With Us <ArrowRight size={18} />
            </a>
          </div>
        </section>
      </main>

      <Footer />
    </div>
  );
}

import Link from 'next/link';
import Navbar from '@/components/generics/Navbar';
import Footer from '@/components/generics/Footer';
import {
  HelpCircle,
  MessageSquare,
  Shield,
  CreditCard,
  User,
  Wrench,
  ChevronRight,
} from 'lucide-react';

const categories = [
  {
    icon: User,
    title: 'Account & Profile',
    description:
      'Account setup, verification, profile management, and security.',
    color: 'bg-[#E6F0EB] text-[#006B32]',
  },
  {
    icon: CreditCard,
    title: 'Payments & Escrow',
    description:
      'Payment processing, escrow system, refunds, and payout issues.',
    color: 'bg-[#FDE8D7] text-[#8A5100]',
  },
  {
    icon: Wrench,
    title: 'Bookings & Services',
    description:
      'Booking management, cancellations, rescheduling, and disputes.',
    color: 'bg-[#E6F0EB] text-[#006B32]',
  },
  {
    icon: Shield,
    title: 'Trust & Safety',
    description:
      'Reporting issues, identity verification, and platform safety.',
    color: 'bg-[#FDE8D7] text-[#8A5100]',
  },
];

const faqs = [
  {
    question: 'How do I create an account on Stabilize?',
    answer:
      'Download the Stabilize app from the App Store or Google Play, then follow the registration flow. You will need a valid Nigerian phone number and email address.',
  },
  {
    question: 'How does the escrow payment system work?',
    answer:
      'When you book a service, your payment is held securely in escrow. The artisan only receives payment once you confirm the job has been completed to your satisfaction.',
  },
  {
    question: 'How are artisans verified on the platform?',
    answer:
      'All artisans undergo a multi-stage verification process including NIN validation, skills assessment, and background checks before being approved on the platform.',
  },
  {
    question: 'What cities is Stabilize available in?',
    answer:
      'We currently operate in Lagos, Abuja, Port Harcourt, Owerri, and Kaduna, with expansion to Ibadan, Enugu, Benin City, Jos, Warri, and Kano coming soon.',
  },
  {
    question: 'How do I report a problem with a service?',
    answer:
      'Navigate to your booking history, select the booking in question, and tap "Report an Issue." Our support team will review and respond within 24 hours.',
  },
  {
    question: 'Can I cancel a booking?',
    answer:
      'Yes, you can cancel a booking before the artisan begins work. Cancellation policies vary based on timing — check the booking details for specific terms.',
  },
];

export default function SupportPage() {
  return (
    <div className="min-h-screen bg-[#F8F9FA] font-sans selection:bg-[#006B32] selection:text-white">
      <Navbar />

      <main className="pt-28 pb-16 px-6 max-w-7xl mx-auto">
        {/* Header */}
        <section className="mb-20 text-center">
          <div className="max-w-2xl mx-auto">
            <div className="inline-flex items-center gap-2 bg-[#E6F0EB] text-[#006B32] text-[10px] font-bold px-3 py-1.5 rounded-full tracking-widest uppercase mb-6">
              <HelpCircle size={12} /> Help Center
            </div>
            <h1 className="text-5xl md:text-6xl font-extrabold text-[#191C1D] leading-[1.05] tracking-tight mb-6">
              How can we <span className="text-[#006B32]">help</span>?
            </h1>
            <p className="text-gray-600 text-lg leading-relaxed">
              Find answers to common questions or reach out to our support team
              for personalized assistance.
            </p>
          </div>
        </section>

        {/* Support Categories */}
        <section className="mb-20">
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
            {categories.map((cat) => (
              <div
                key={cat.title}
                className="bg-white rounded-[24px] p-6 shadow-sm hover:shadow-md transition cursor-pointer group"
              >
                <div
                  className={`w-10 h-10 rounded-xl flex items-center justify-center mb-4 ${cat.color}`}
                >
                  <cat.icon size={20} />
                </div>
                <h3 className="text-base font-bold text-[#191C1D] mb-2">
                  {cat.title}
                </h3>
                <p className="text-xs text-gray-600 leading-relaxed mb-4">
                  {cat.description}
                </p>
                <div className="flex items-center gap-1 text-[#006B32] text-xs font-bold group-hover:underline">
                  Browse articles <ChevronRight size={14} />
                </div>
              </div>
            ))}
          </div>
        </section>

        {/* FAQ Section */}
        <section className="mb-20">
          <div className="flex flex-col md:flex-row justify-between items-end border-b border-gray-200 pb-4 mb-8">
            <div>
              <h2 className="text-3xl font-extrabold text-[#191C1D] mb-2">
                Frequently Asked Questions
              </h2>
              <p className="text-sm text-gray-600">
                Quick answers to the most common questions.
              </p>
            </div>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            {faqs.map((faq, i) => (
              <div key={i} className="bg-white rounded-[24px] p-6 shadow-sm">
                <h3 className="text-sm font-bold text-[#191C1D] mb-3">
                  {faq.question}
                </h3>
                <p className="text-sm text-gray-600 leading-relaxed">
                  {faq.answer}
                </p>
              </div>
            ))}
          </div>
        </section>

        {/* Still Need Help CTA */}
        <section className="mb-12">
          <div className="bg-[#006B32] rounded-[40px] px-6 py-16 text-center relative overflow-hidden">
            <div className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[400px] h-[400px] bg-[#6EE7B7] rounded-full blur-[120px] opacity-15 pointer-events-none"></div>

            <div className="relative z-10 max-w-xl mx-auto">
              <div className="w-14 h-14 bg-white/20 rounded-2xl flex items-center justify-center text-white mx-auto mb-6">
                <MessageSquare size={28} />
              </div>
              <h2 className="text-3xl font-extrabold text-white mb-4">
                Still need help?
              </h2>
              <p className="text-white/80 text-sm mb-8">
                Our support team is available Monday through Friday, 8am to 6pm
                WAT. We typically respond within 24 hours.
              </p>
              <div className="flex flex-col sm:flex-row justify-center gap-4">
                <a
                  href="mailto:support@stabilize.ng"
                  className="bg-white text-[#006B32] px-8 py-3.5 rounded-xl font-bold hover:bg-gray-100 transition text-center"
                >
                  Email Support
                </a>
                <Link
                  href="/contact"
                  className="bg-transparent border-2 border-white text-white px-8 py-3.5 rounded-xl font-bold hover:bg-white/10 transition text-center"
                >
                  Contact Us
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

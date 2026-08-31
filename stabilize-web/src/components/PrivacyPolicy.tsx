import Navbar from '@/components/generics/Navbar';
import Footer from '@/components/generics/Footer';
import { Shield } from 'lucide-react';

const sections = [
  {
    title: '1. Information We Collect',
    content: [
      'We collect information you provide directly when creating an account, including your full name, email address, phone number, and location data within Nigeria.',
      'For artisans joining the Workforce platform, we additionally collect identity verification documents (NIN, BVN), professional credentials, and banking information for payout processing.',
      'We automatically collect device information, IP addresses, browser type, usage patterns, and interaction data when you use our platform.',
    ],
  },
  {
    title: '2. How We Use Your Information',
    content: [
      'To provide and maintain the Stabilize platform, including matching users with verified artisans across Nigerian cities.',
      'To process transactions through our escrow payment system and facilitate payouts to artisans.',
      'To verify identities through our multi-stage KYC process and maintain trust within the ecosystem.',
      'To improve our services, develop new features, and personalize your experience.',
      'To communicate with you about bookings, updates, promotions, and platform changes.',
    ],
  },
  {
    title: '3. Data Sharing & Disclosure',
    content: [
      'We share relevant information between users and artisans to facilitate service delivery (e.g., name, phone number, and location for bookings).',
      'We may share data with payment processors, identity verification partners, and cloud infrastructure providers who assist in operating the platform.',
      'We do not sell your personal information to third parties for marketing purposes.',
      'We may disclose information when required by Nigerian law, regulation, or legal process.',
    ],
  },
  {
    title: '4. Data Security',
    content: [
      'We implement industry-standard encryption, access controls, and security protocols to protect your personal data.',
      'All payment transactions are processed through secure, PCI-compliant channels with escrow protection.',
      'Despite our efforts, no method of electronic storage is 100% secure. We encourage you to use strong passwords and protect your account credentials.',
    ],
  },
  {
    title: '5. Your Rights',
    content: [
      'You may access, update, or delete your personal information through your account settings at any time.',
      'You may request a copy of all personal data we hold about you by contacting our support team.',
      'You may opt out of non-essential communications while still receiving critical service notifications.',
      'Artisans may request removal from the Workforce platform, subject to completing any active bookings.',
    ],
  },
  {
    title: '6. Data Retention',
    content: [
      'We retain your data for as long as your account is active or as needed to provide services.',
      'Transaction records are retained for a minimum of 6 years in compliance with Nigerian financial regulations.',
      'Upon account deletion, personal data is removed within 30 days, except where retention is required by law.',
    ],
  },
  {
    title: '7. Cookies & Tracking',
    content: [
      'We use essential cookies to maintain your session and preferences on the platform.',
      'Analytics cookies help us understand platform usage patterns to improve our services.',
      'You may disable non-essential cookies through your browser settings.',
    ],
  },
  {
    title: '8. Changes to This Policy',
    content: [
      'We may update this privacy policy periodically. We will notify you of significant changes via email or in-app notification.',
      'Continued use of the platform after changes constitutes acceptance of the updated policy.',
    ],
  },
];

export default function PrivacyPolicyPage() {
  return (
    <div className="min-h-screen bg-[#F8F9FA] font-sans selection:bg-[#006B32] selection:text-white">
      <Navbar />

      <main className="pt-28 pb-16 px-6 max-w-7xl mx-auto">
        {/* Header */}
        <section className="mb-16">
          <div className="max-w-3xl">
            <div className="inline-flex items-center gap-2 bg-[#E6F0EB] text-[#006B32] text-[10px] font-bold px-3 py-1.5 rounded-full tracking-widest uppercase mb-6">
              <Shield size={12} /> Legal
            </div>
            <h1 className="text-5xl md:text-6xl font-extrabold text-[#191C1D] leading-[1.05] tracking-tight mb-6">
              Privacy <span className="text-[#006B32]">Policy</span>
            </h1>
            <p className="text-gray-600 text-lg leading-relaxed">
              Your privacy matters to us. This policy explains how Stabilize NG
              collects, uses, and protects your personal information across our
              ecosystem.
            </p>
            <p className="text-sm text-gray-400 mt-4">
              Last updated: April 7, 2026
            </p>
          </div>
        </section>

        {/* Content */}
        <section className="mb-20">
          <div className="max-w-3xl space-y-12">
            {sections.map((section) => (
              <div key={section.title}>
                <h2 className="text-xl font-extrabold text-[#191C1D] mb-4">
                  {section.title}
                </h2>
                <div className="space-y-3">
                  {section.content.map((paragraph, i) => (
                    <p
                      key={i}
                      className="text-sm text-gray-600 leading-relaxed"
                    >
                      {paragraph}
                    </p>
                  ))}
                </div>
              </div>
            ))}
          </div>
        </section>

        {/* Contact CTA */}
        <section className="mb-12">
          <div className="bg-[#F3F4F5] rounded-[32px] p-8 md:p-12 max-w-3xl">
            <h3 className="text-lg font-bold text-[#191C1D] mb-2">
              Questions about your privacy?
            </h3>
            <p className="text-sm text-gray-600 mb-6">
              Contact our data protection team for any privacy-related concerns
              or requests.
            </p>
            <a
              href="mailto:privacy@stabilize.ng"
              className="text-[#006B32] font-bold text-sm hover:underline"
            >
              privacy@stabilize.ng
            </a>
          </div>
        </section>
      </main>

      <Footer />
    </div>
  );
}

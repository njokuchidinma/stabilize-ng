import Navbar from '@/components/generics/Navbar';
import Footer from '@/components/generics/Footer';
import { FileText } from 'lucide-react';

const sections = [
  {
    title: '1. Acceptance of Terms',
    content: [
      'By accessing or using the Stabilize NG platform, including our mobile applications and website, you agree to be bound by these Terms of Service.',
      'If you do not agree to these terms, you may not access or use the platform. These terms apply to all users, artisans, and visitors.',
    ],
  },
  {
    title: '2. Platform Description',
    content: [
      'Stabilize NG operates a two-sided marketplace connecting users with verified artisans and service providers across Nigerian cities.',
      'We provide the technology platform and facilitate connections but are not a party to the agreements between users and artisans. Artisans are independent contractors, not employees of Stabilize NG.',
    ],
  },
  {
    title: '3. Account Registration',
    content: [
      'You must provide accurate, complete, and current information when creating an account. You are responsible for maintaining the confidentiality of your account credentials.',
      'You must be at least 18 years of age to create an account. By registering, you represent and warrant that you meet this age requirement.',
      'Artisan accounts require successful completion of our verification process, including identity verification and skills assessment.',
    ],
  },
  {
    title: '4. User Conduct',
    content: [
      'You agree to use the platform only for lawful purposes and in accordance with these terms.',
      'You shall not misrepresent your identity, qualifications, or the quality of services offered.',
      'Harassment, discrimination, fraud, or any form of abuse towards other users or artisans is strictly prohibited and grounds for immediate account termination.',
      'You shall not attempt to circumvent the platform to avoid fees or bypass safety features.',
    ],
  },
  {
    title: '5. Payments & Escrow',
    content: [
      'All payments for services booked through Stabilize NG must be processed through our secure escrow system.',
      'Funds are held in escrow until the service is completed and confirmed by the user. Artisans receive payouts upon successful job completion.',
      'Stabilize NG charges a service fee on each transaction, which is disclosed before booking confirmation.',
      'Refund requests are handled on a case-by-case basis according to our refund policy. Disputes can be escalated through our resolution center.',
    ],
  },
  {
    title: '6. Artisan Obligations',
    content: [
      'Artisans must maintain accurate profiles, including up-to-date skills, pricing, and availability.',
      'Artisans are responsible for the quality of their work and must adhere to professional standards.',
      'Artisans must carry appropriate insurance where applicable and comply with all relevant Nigerian regulations.',
    ],
  },
  {
    title: '7. Intellectual Property',
    content: [
      'The Stabilize NG platform, including its design, logos, content, and technology, is the intellectual property of Stabilize Technologies Ltd.',
      'Users and artisans retain ownership of content they create and upload to the platform, but grant Stabilize NG a license to display and use such content for platform operations.',
    ],
  },
  {
    title: '8. Limitation of Liability',
    content: [
      'Stabilize NG provides the platform on an "as is" basis. We do not guarantee the quality, timing, or outcome of services provided by artisans.',
      'To the maximum extent permitted by Nigerian law, Stabilize NG shall not be liable for indirect, incidental, or consequential damages arising from platform use.',
      'Our total liability shall not exceed the amount of fees paid by you to Stabilize NG in the twelve months preceding the claim.',
    ],
  },
  {
    title: '9. Termination',
    content: [
      'We reserve the right to suspend or terminate accounts that violate these terms, with or without notice.',
      'You may delete your account at any time through the app settings, subject to completing any active bookings or outstanding payments.',
    ],
  },
  {
    title: '10. Governing Law',
    content: [
      'These terms are governed by and construed in accordance with the laws of the Federal Republic of Nigeria.',
      'Any disputes shall be resolved through arbitration in Lagos, Nigeria, in accordance with the Arbitration and Conciliation Act.',
    ],
  },
];

export default function TermsOfServicePage() {
  return (
    <div className="min-h-screen bg-[#F8F9FA] font-sans selection:bg-[#006B32] selection:text-white">
      <Navbar />

      <main className="pt-28 pb-16 px-6 max-w-7xl mx-auto">
        {/* Header */}
        <section className="mb-16">
          <div className="max-w-3xl">
            <div className="inline-flex items-center gap-2 bg-[#E6F0EB] text-[#006B32] text-[10px] font-bold px-3 py-1.5 rounded-full tracking-widest uppercase mb-6">
              <FileText size={12} /> Legal
            </div>
            <h1 className="text-5xl md:text-6xl font-extrabold text-[#191C1D] leading-[1.05] tracking-tight mb-6">
              Terms of <span className="text-[#006B32]">Service</span>
            </h1>
            <p className="text-gray-600 text-lg leading-relaxed">
              Please read these terms carefully before using the Stabilize NG
              platform. They govern your use of our services across all Nigerian
              cities.
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
              Have questions about our terms?
            </h3>
            <p className="text-sm text-gray-600 mb-6">
              Our legal team is available to clarify any aspect of these terms.
            </p>
            <a
              href="mailto:legal@stabilize.ng"
              className="text-[#006B32] font-bold text-sm hover:underline"
            >
              legal@stabilize.ng
            </a>
          </div>
        </section>
      </main>

      <Footer />
    </div>
  );
}

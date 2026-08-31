import 'package:flutter/material.dart';

class WorkforceEarningsScreen extends StatelessWidget {
  const WorkforceEarningsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Colors from "The Digital Patriot" design system
    const Color primaryColor = Color(0xFF006B32);
    const Color surfaceColor = Color(0xFFF8F9FA);
    const Color onSurfaceColor = Color(0xFF191C1D);
    const Color onSurfaceVariant = Color(0xFF3D4A3E);
    const Color surfaceContainerLow = Color(0xFFF3F4F5);

    return Scaffold(
      backgroundColor: surfaceColor,
      // No Bottom Nav here!
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. APP BAR
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          width: 32,
                          height: 32,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'Earnings',
                          style: TextStyle(
                            fontFamily: 'PlusJakartaSans',
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.notifications,
                      color: onSurfaceVariant,
                      size: 24,
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // 2. HERO EARNINGS CARD
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Earnings (Oct)',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          color: Colors.white.withValues(alpha: 0.8),
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        '₦145,000',
                        style: TextStyle(
                          fontFamily: 'PlusJakartaSans',
                          fontSize: 36,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: _buildMiniStatCard('JOBS COMPLETED', '12'),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _buildMiniStatCard('AVG. RATING', '4.9'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // 3. ACTIVITY SECTION HEADER
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'Activity',
                      style: TextStyle(
                        fontFamily: 'PlusJakartaSans',
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: onSurfaceColor,
                      ),
                    ),
                    Text(
                      'Last 7 Days',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        color: onSurfaceVariant.withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // 4. CHART CARD
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x0A000000),
                        blurRadius: 24,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jobs per day',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          color: onSurfaceVariant.withValues(alpha: 0.9),
                        ),
                      ),
                      const SizedBox(height: 32),
                      // Custom Native Bar Chart
                      SizedBox(
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            _buildChartBar(
                              'M',
                              30,
                              false,
                              surfaceContainerLow,
                              primaryColor,
                            ),
                            _buildChartBar(
                              'T',
                              40,
                              false,
                              surfaceContainerLow,
                              primaryColor,
                            ),
                            _buildChartBar(
                              'W',
                              35,
                              false,
                              surfaceContainerLow,
                              primaryColor,
                            ),
                            _buildChartBar(
                              'T',
                              45,
                              false,
                              surfaceContainerLow,
                              primaryColor,
                            ),
                            _buildChartBar(
                              'F',
                              80,
                              true,
                              surfaceContainerLow,
                              primaryColor,
                            ),
                            _buildChartBar(
                              'S',
                              100,
                              true,
                              surfaceContainerLow,
                              primaryColor,
                            ),
                            _buildChartBar(
                              'S',
                              70,
                              true,
                              surfaceContainerLow,
                              primaryColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // 5. SECONDARY STATS (Growth & Completion)
                Row(
                  children: [
                    Expanded(
                      child: _buildSecondaryStatCard(
                        icon: Icons.trending_up,
                        iconColor: const Color(
                          0xFF8A5100,
                        ), // Energetic Brown/Orange
                        title: 'Growth',
                        value: '+18%',
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildSecondaryStatCard(
                        icon: Icons.timer, // Closest match to the stopwatch
                        iconColor: primaryColor,
                        title: 'Completion\nRate',
                        value: '96%',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                // 6. RECENT PAYOUTS SECTION
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Recent Payouts',
                      style: TextStyle(
                        fontFamily: 'PlusJakartaSans',
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: onSurfaceColor,
                      ),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                _buildPayoutCard('Oct 24, 2023', '₦42,000'),
                const SizedBox(height: 12),
                _buildPayoutCard('Oct 20, 2023', '₦35,500'),
                const SizedBox(height: 12),
                _buildPayoutCard('Oct 15, 2023', '₦67,500'),

                const SizedBox(height: 48), // Bottom padding
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- PRIVATE HELPERS ---

  Widget _buildMiniStatCard(String title, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 9,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.0,
              color: Colors.white.withValues(alpha: 0.9),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontFamily: 'PlusJakartaSans',
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChartBar(
    String day,
    double height,
    bool isActive,
    Color inactiveColor,
    Color activeColor,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 32,
          height: height,
          decoration: BoxDecoration(
            color: isActive ? activeColor : inactiveColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: isActive
                ? [
                    BoxShadow(
                      color: activeColor.withValues(alpha: 0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [],
          ),
        ),
        const SizedBox(height: 12),
        Text(
          day,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 10,
            fontWeight: isActive ? FontWeight.w800 : FontWeight.w600,
            color: isActive ? activeColor : const Color(0xFF3D4A3E),
          ),
        ),
      ],
    );
  }

  Widget _buildSecondaryStatCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 24,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 24),
          const SizedBox(height: 24),
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              color: Color(0xFF3D4A3E),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontFamily: 'PlusJakartaSans',
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Color(0xFF191C1D),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPayoutCard(String date, String amount) {
    const Color primaryColor = Color(0xFF006B32);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 24,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Bank Icon
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: primaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.account_balance_wallet,
              color: primaryColor,
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Bank Transfer',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF191C1D),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 13,
                    color: const Color(0xFF3D4A3E).withValues(alpha: 0.8),
                  ),
                ),
              ],
            ),
          ),
          // Amount & Status
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: const TextStyle(
                  fontFamily: 'PlusJakartaSans',
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF191C1D),
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: const [
                  Icon(Icons.check_circle, color: primaryColor, size: 12),
                  SizedBox(width: 4),
                  Text(
                    'Success',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

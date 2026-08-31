import 'package:flutter/material.dart';

class ServiceRequestScreen extends StatelessWidget {
  const ServiceRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Colors from "The Digital Patriot"
    const Color primaryColor = Color(0xFF006B32);
    const Color primaryContainer = Color(0xFF008740);
    const Color surfaceColor = Color(0xFFF8F9FA);
    const Color surfaceContainerHigh = Color(0xFFE7E8E9);
    const Color onSurfaceColor = Color(0xFF191C1D);
    const Color onSurfaceVariant = Color(0xFF3D4A3E);
    const Color outlineVariant = Color(0xFFC4C7C5);

    return Scaffold(
      backgroundColor: surfaceColor,
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
                // 1. CUSTOM APP BAR
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Row(
                        children: [
                          const Icon(Icons.arrow_back, color: primaryColor),
                          const SizedBox(width: 16),
                          Image.asset(
                            'assets/images/logo.png',
                            width: 30,
                            height: 30,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(width: 8),
                          RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                fontFamily: 'PlusJakartaSans',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Stabilize ',
                                  style: TextStyle(color: primaryColor),
                                ),
                                TextSpan(
                                  text: 'NG',
                                  style: TextStyle(color: onSurfaceColor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const CircleAvatar(
                      radius: 18,
                      backgroundColor: surfaceContainerHigh,
                      backgroundImage: AssetImage('assets/images/profile.png'),
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // 2. HEADER
                const Text(
                  'SERVICE REQUEST',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.5,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(height: 8),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      height: 1.1,
                      color: onSurfaceColor,
                    ),
                    children: [
                      TextSpan(text: 'Can they\n'),
                      TextSpan(
                        text: 'do it?',
                        style: TextStyle(color: primaryColor),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Send your specific requirements to Ahmed to ensure he has the right tools for your installation.',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    color: onSurfaceVariant,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 32),

                // 3. INQUIRY FORM CARD
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: onSurfaceColor.withValues(alpha: 0.04),
                        blurRadius: 24,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInputLabel('Job description', onSurfaceColor),
                      const SizedBox(height: 8),
                      TextField(
                        maxLines: 4,
                        decoration: _inputDecoration(
                          'Describe the problem or\ninstallation details...',
                          surfaceContainerHigh,
                          onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 20),

                      _buildInputLabel('Preferred date', onSurfaceColor),
                      const SizedBox(height: 8),
                      TextField(
                        decoration:
                            _inputDecoration(
                              'Select date',
                              surfaceContainerHigh,
                              onSurfaceVariant,
                            ).copyWith(
                              prefixIcon: const Icon(
                                Icons.calendar_today,
                                color: primaryColor,
                                size: 20,
                              ),
                            ),
                      ),
                      const SizedBox(height: 20),

                      _buildInputLabel('Budget (₦)', onSurfaceColor),
                      const SizedBox(height: 8),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration:
                            _inputDecoration(
                              'Enter amount',
                              surfaceContainerHigh,
                              onSurfaceVariant,
                            ).copyWith(
                              prefixIcon: const Padding(
                                padding: EdgeInsets.only(left: 16.0, top: 14.0),
                                child: Text(
                                  '₦',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: primaryColor,
                                  ),
                                ),
                              ),
                            ),
                      ),
                      const SizedBox(height: 24),

                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: outlineVariant.withValues(alpha: 0.5),
                            width: 1.5,
                          ),
                        ),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.camera_alt,
                              color: primaryColor,
                              size: 32,
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Upload Photo',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: onSurfaceColor,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Show the plumber what he\'s\nworking on',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 11,
                                color: onSurfaceVariant.withValues(alpha: 0.7),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Inquiry sent successfully'),
                              ),
                            );
                            Navigator.pop(context);
                          },
                          icon: const Text(
                            'Send Inquiry',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          label: const Icon(
                            Icons.send,
                            color: Colors.white,
                            size: 20,
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 48),

                // 4. BOOKING CONFIRMATION SECTION
                const Text(
                  'Booking Confirmation',
                  style: TextStyle(
                    fontFamily: 'PlusJakartaSans',
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: onSurfaceColor,
                  ),
                ),
                const SizedBox(height: 24),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: onSurfaceColor.withValues(alpha: 0.04),
                        blurRadius: 24,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'September 2024',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: onSurfaceColor,
                            ),
                          ),
                          Row(
                            children: [
                              _buildArrowButton(
                                Icons.chevron_left,
                                surfaceContainerHigh,
                                onSurfaceColor,
                              ),
                              const SizedBox(width: 8),
                              _buildArrowButton(
                                Icons.chevron_right,
                                surfaceContainerHigh,
                                onSurfaceColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      _buildFakeCalendarGrid(primaryColor),
                      const SizedBox(height: 32),

                      Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: surfaceColor,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const CircleAvatar(
                                      radius: 20,
                                      backgroundImage: NetworkImage(
                                        'https://i.pravatar.cc/150?img=11',
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Ahmed the Plumber',
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: onSurfaceColor,
                                          ),
                                        ),
                                        Text(
                                          'Top Rated Professional',
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontSize: 11,
                                            color: onSurfaceVariant.withValues(
                                              alpha: 0.8,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                _buildSummaryRow(
                                  'Service:',
                                  'Water Tank Installation',
                                  onSurfaceVariant,
                                  onSurfaceColor,
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Est. Price:',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 12,
                                        color: onSurfaceVariant.withValues(
                                          alpha: 0.8,
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      '₦25,000',
                                      style: TextStyle(
                                        fontFamily: 'PlusJakartaSans',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800,
                                        color: primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: -10,
                            right: -10,
                            child: Opacity(
                              opacity: 0.03,
                              child: Transform.rotate(
                                angle: -0.2,
                                child: const Icon(
                                  Icons.handyman,
                                  size: 100,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Privacy Note
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: primaryColor.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.shield, color: primaryColor, size: 16),
                      const SizedBox(width: 12),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 11,
                              color: onSurfaceVariant.withValues(alpha: 0.9),
                              height: 1.5,
                            ),
                            children: const [
                              TextSpan(
                                text: 'Privacy Note: ',
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                              TextSpan(
                                text:
                                    'Your full address will be shared only on the booking day to ensure your security and privacy.',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Confirm Booking Button
                Container(
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [primaryColor, primaryContainer],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: onSurfaceColor.withValues(alpha: 0.06),
                        blurRadius: 24,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Booking confirmed successfully'),
                        ),
                      );
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'Confirm Booking',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- PRIVATE HELPERS ---

  Widget _buildInputLabel(String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Inter',
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: color,
      ),
    );
  }

  InputDecoration _inputDecoration(
    String hint,
    Color fillColor,
    Color hintColor,
  ) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(
        color: hintColor.withValues(alpha: 0.5),
        fontFamily: 'Inter',
        fontSize: 14,
      ),
      filled: true,
      fillColor: fillColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    );
  }

  Widget _buildArrowButton(IconData icon, Color bgColor, Color iconColor) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
      child: Icon(icon, size: 16, color: iconColor),
    );
  }

  Widget _buildSummaryRow(
    String label,
    String value,
    Color labelColor,
    Color valueColor,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 12,
            color: labelColor.withValues(alpha: 0.8),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: valueColor,
          ),
        ),
      ],
    );
  }

  Widget _buildFakeCalendarGrid(Color primaryColor) {
    final List<String> days = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
    final List<String> datesRow1 = ['29', '30', '1', '2', '3', '4', '5'];
    final List<String> datesRow2 = ['6', '7', '8', '9', '10', '11', '12'];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: days
              .map(
                (d) => SizedBox(
                  width: 30,
                  child: Center(
                    child: Text(
                      d,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: datesRow1
              .map((d) => _buildCalDate(d, false, primaryColor))
              .toList(),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: datesRow2
              .map((d) => _buildCalDate(d, d == '7', primaryColor))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildCalDate(String date, bool isSelected, Color primaryColor) {
    final bool isFaded = date == '29' || date == '30';
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: isSelected ? primaryColor : Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          date,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            color: isSelected
                ? Colors.white
                : (isFaded ? Colors.grey.shade400 : const Color(0xFF191C1D)),
          ),
        ),
      ),
    );
  }
}

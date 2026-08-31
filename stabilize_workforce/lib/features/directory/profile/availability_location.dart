import 'package:flutter/material.dart';

class WorkforceAvailabilityLocationScreen extends StatefulWidget {
  const WorkforceAvailabilityLocationScreen({super.key});

  @override
  State<WorkforceAvailabilityLocationScreen> createState() => _WorkforceAvailabilityLocationScreenState();
}

class _WorkforceAvailabilityLocationScreenState extends State<WorkforceAvailabilityLocationScreen> {
  bool _isAvailable = true;
  String _selectedArea = 'Maitama';

  final List<String> _serviceAreas = [
    'Maitama', 'Wuse', 'Garki', 'Asokoro', 'Gwarinpa', 'Jabi', 'Utako', 'Central Area'
  ];

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF006B32);
    const Color primaryContainer = Color(0xFF008740);
    const Color surfaceColor = Color(0xFFF8F9FA);
    const Color surfaceContainerHigh = Color(0xFFE7E8E9);
    const Color onSurfaceColor = Color(0xFF191C1D);
    const Color onSurfaceVariant = Color(0xFF3D4A3E);

    return Scaffold(
      backgroundColor: surfaceColor,
      appBar: AppBar(
        backgroundColor: surfaceColor,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back, color: onSurfaceColor),
        ),
        title: const Text(
          'Availability & Location',
          style: TextStyle(
            fontFamily: 'PlusJakartaSans',
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: primaryColor,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // AVAILABILITY SECTION
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Availability',
                              style: TextStyle(
                                fontFamily: 'PlusJakartaSans',
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: onSurfaceColor,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _isAvailable ? 'You are visible to clients' : 'You are hidden from clients',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 13,
                                color: onSurfaceVariant.withValues(alpha: 0.8),
                              ),
                            ),
                          ],
                        ),
                        Switch(
                          value: _isAvailable,
                          onChanged: (value) {
                            setState(() => _isAvailable = value);
                          },
                          activeThumbColor: primaryColor,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Status indicator
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: _isAvailable
                            ? primaryColor.withValues(alpha: 0.1)
                            : const Color(0xFFD32F2F).withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: _isAvailable ? primaryColor : const Color(0xFFD32F2F),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            _isAvailable ? 'Available for bookings' : 'Not available',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: _isAvailable ? primaryColor : const Color(0xFFD32F2F),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // LOCATION SECTION
              const Text(
                'Service Location',
                style: TextStyle(
                  fontFamily: 'PlusJakartaSans',
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: onSurfaceColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Set your primary service area so clients\nnear you can find you easily.',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 13,
                  color: onSurfaceVariant.withValues(alpha: 0.8),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),

              // USE CURRENT LOCATION BUTTON
              SizedBox(
                width: double.infinity,
                height: 56,
                child: OutlinedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Fetching your current location...')),
                    );
                  },
                  icon: const Icon(Icons.my_location, size: 20),
                  label: const Text(
                    'Use Current Location',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: primaryColor,
                    side: const BorderSide(color: primaryColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // OR DIVIDER
              Row(
                children: [
                  Expanded(child: Divider(color: onSurfaceVariant.withValues(alpha: 0.2))),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'or',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 13,
                        color: onSurfaceVariant.withValues(alpha: 0.6),
                      ),
                    ),
                  ),
                  Expanded(child: Divider(color: onSurfaceVariant.withValues(alpha: 0.2))),
                ],
              ),
              const SizedBox(height: 16),

              // MANUAL ADDRESS INPUT
              const Text(
                'Address',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your address',
                  hintStyle: TextStyle(
                    color: onSurfaceVariant.withValues(alpha: 0.5),
                    fontFamily: 'Inter',
                    fontSize: 14,
                  ),
                  prefixIcon: Icon(Icons.location_on_outlined, color: onSurfaceVariant.withValues(alpha: 0.6)),
                  filled: true,
                  fillColor: surfaceContainerHigh,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // SERVICE AREA DROPDOWN
              const Text(
                'Primary Service Area',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 56,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: surfaceContainerHigh,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedArea,
                    isExpanded: true,
                    icon: Icon(Icons.keyboard_arrow_down, color: onSurfaceVariant.withValues(alpha: 0.7)),
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      color: onSurfaceColor,
                    ),
                    items: _serviceAreas.map((area) {
                      return DropdownMenuItem<String>(
                        value: area,
                        child: Text(area),
                      );
                    }).toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() => _selectedArea = value);
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // SERVICE RADIUS
              const Text(
                'Service Radius',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 56,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: surfaceContainerHigh,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Within 10 km',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        color: onSurfaceVariant.withValues(alpha: 0.7),
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_down, color: onSurfaceVariant.withValues(alpha: 0.7)),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              // SAVE BUTTON
              Container(
                width: double.infinity,
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: const LinearGradient(
                    colors: [primaryColor, primaryContainer],
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Location updated successfully!')),
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
                    'Save Location',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

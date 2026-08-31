import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Colors from "The Digital Patriot"
    const Color primaryColor = Color(0xFF006B32);
    const Color surfaceColor = Color(0xFFFAFAFA); // Slightly lighter than F8F9FA for chat bg
    const Color surfaceContainerLow = Color(0xFFF3F4F5);
    const Color onSurfaceColor = Color(0xFF191C1D);
    const Color onSurfaceVariant = Color(0xFF3D4A3E);
    const Color outlineVariant = Color(0xFFC4C7C5);

    return Scaffold(
      backgroundColor: surfaceColor,
      body: SafeArea(
        child: Column(
          children: [
            // 1. CUSTOM APP BAR
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(color: outlineVariant.withValues(alpha: 0.2)),
                ),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back, color: onSurfaceColor),
                  ),
                  const SizedBox(width: 16),
                  // Avatar with Online Indicator
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11'), // Ahmed
                      ),
                      Positioned(
                        bottom: 0,
                        right: -2,
                        child: Container(
                          width: 14,
                          height: 14,
                          decoration: BoxDecoration(
                            color: const Color(0xFF22C55E),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 12),
                  // Name and Status
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Ahmed the Plumber',
                              style: TextStyle(
                                fontFamily: 'PlusJakartaSans',
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: onSurfaceColor,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Icon(Icons.verified, color: Colors.blue, size: 14),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Online • Response time: 5 mins',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 11,
                            color: onSurfaceVariant.withValues(alpha: 0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Actions
                  const Icon(Icons.phone, color: onSurfaceColor, size: 22),
                  const SizedBox(width: 16),
                  const Icon(Icons.more_vert, color: onSurfaceColor, size: 22),
                ],
              ),
            ),

            // 2. CHAT HISTORY (Scrollable)
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
                children: [
                  // Date Divider
                  Center(
                    child: Text(
                      'TODAY',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.5,
                        color: onSurfaceVariant.withValues(alpha: 0.4),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Incoming Message
                  _buildIncomingMessage(
                    "Good morning! I received your request regarding the leaking pipe in the kitchen. I can be there by 2 PM today. Does that work for you?",
                    "09:12 AM",
                    surfaceContainerLow,
                    onSurfaceColor,
                    onSurfaceVariant,
                  ),
                  const SizedBox(height: 20),

                  // Outgoing Message
                  _buildOutgoingMessage(
                    "Morning Ahmed! 2 PM works perfectly. Do you need me to buy any spare parts beforehand?",
                    "09:15 AM",
                    primaryColor,
                    onSurfaceVariant,
                  ),
                  const SizedBox(height: 20),

                  // Transaction/Status Card
                  _buildStatusCard(primaryColor, onSurfaceColor, onSurfaceVariant),
                  const SizedBox(height: 20),

                  // Incoming Message
                  _buildIncomingMessage(
                    "Don't worry about the parts yet. I have most standard fittings in my van. If it's something specialized, I'll let you know once I've inspected it. Please send a photo of the leak if possible.",
                    "09:18 AM",
                    surfaceContainerLow,
                    onSurfaceColor,
                    onSurfaceVariant,
                  ),
                ],
              ),
            ),

            // 3. BOTTOM INPUT BAR
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: SafeArea(
                top: false,
                child: Row(
                  children: [
                    const Icon(Icons.add_circle, color: onSurfaceVariant, size: 28),
                    const SizedBox(width: 16),
                    const Icon(Icons.image, color: onSurfaceVariant, size: 24),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        height: 48,
                        decoration: BoxDecoration(
                          color: surfaceContainerLow,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Type a message...',
                            hintStyle: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              color: onSurfaceVariant.withValues(alpha: 0.6),
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Send Button
                    Container(
                      width: 48,
                      height: 48,
                      decoration: const BoxDecoration(
                        color: primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.send, color: Colors.white, size: 20),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- HELPER WIDGETS ---

  Widget _buildIncomingMessage(String text, String time, Color bgColor, Color textColor, Color timeColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          constraints: const BoxConstraints(maxWidth: 300), // Prevents full-width stretch
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4), // Sharp corner indicates incoming tail
              topRight: Radius.circular(16),
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              color: textColor,
              height: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          time,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 10,
            color: timeColor.withValues(alpha: 0.8),
          ),
        ),
      ],
    );
  }

  Widget _buildOutgoingMessage(String text, String time, Color primaryColor, Color timeColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          constraints: const BoxConstraints(maxWidth: 300),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(4), // Sharp corner indicates outgoing tail
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              color: Colors.white,
              height: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              time,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 10,
                color: timeColor.withValues(alpha: 0.8),
              ),
            ),
            const SizedBox(width: 4),
            Icon(Icons.done_all, color: primaryColor, size: 14), // Read receipt
          ],
        ),
      ],
    );
  }

  Widget _buildStatusCard(Color primaryColor, Color onSurfaceColor, Color onSurfaceVariant) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000), // Very light shadow
            blurRadius: 16,
            offset: Offset(0, 2),
          ),
        ],
        border: Border.all(color: const Color(0xFFE7E8E9).withValues(alpha: 0.5)),
      ),
      child: Row(
        children: [
          // Icon Box
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFFFDE8D7), // Soft orange background
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.build, color: Color(0xFF191C1D), size: 20),
          ),
          const SizedBox(width: 16),
          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kitchen Pipe Repair',
                  style: TextStyle(
                    fontFamily: 'PlusJakartaSans',
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: onSurfaceColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Scheduled for Today, 2:00 PM',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: onSurfaceVariant.withValues(alpha: 0.8),
                  ),
                ),
              ],
            ),
          ),
          // Confirmed Pill
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: primaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              'CONFIRMED',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 9,
                fontWeight: FontWeight.w800,
                color: primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
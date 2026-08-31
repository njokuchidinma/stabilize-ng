import 'package:flutter/material.dart';

class WorkforceInboxScreen extends StatelessWidget {
  const WorkforceInboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Colors from "The Digital Patriot" design system
    const Color primaryColor = Color(0xFF006B32);
    const Color surfaceColor = Color(0xFFF8F9FA); // Standard app background
    const Color surfaceContainerLow = Color(0xFFF3F4F5); // For chat bubbles/inputs
    const Color surfaceContainerHigh = Color(0xFFE7E8E9);
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
                color: surfaceColor,
                border: Border(
                  bottom: BorderSide(color: outlineVariant.withValues(alpha: 0.3)),
                ),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back, color: primaryColor),
                  ),
                  const SizedBox(width: 16),
                  // Avatar with Online Indicator
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11'), // Corper Frank
                      ),
                      Positioned(
                        bottom: 0,
                        right: -2,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: const Color(0xFF22C55E), // Online green
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
                        const Text(
                          'Corper Frank',
                          style: TextStyle(
                            fontFamily: 'PlusJakartaSans',
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: onSurfaceColor,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'ONLINE',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.0,
                            color: primaryColor.withValues(alpha: 0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Actions
                  const Icon(Icons.phone, color: onSurfaceVariant, size: 22),
                  const SizedBox(width: 16),
                  const Icon(Icons.more_vert, color: onSurfaceVariant, size: 22),
                ],
              ),
            ),

            // 2. CHAT HISTORY (Scrollable)
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                children: [
                  // Current Enquiry Banner
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: surfaceContainerLow,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        // Icon Box
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: primaryColor.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.build, color: primaryColor, size: 20),
                        ),
                        const SizedBox(width: 16),
                        // Details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'CURRENT ENQUIRY',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.0,
                                  color: onSurfaceVariant.withValues(alpha: 0.8),
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'Bedroom Wardrobe\nRepair',
                                style: TextStyle(
                                  fontFamily: 'PlusJakartaSans',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                  color: onSurfaceColor,
                                  height: 1.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Price
                        const Text(
                          '₦12,500',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Date Divider
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: surfaceContainerHigh.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'TODAY',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.5,
                          color: onSurfaceVariant.withValues(alpha: 0.8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Chat Messages
                  _buildIncomingMessage(
                    "Hello Ahmed, I noticed the hinges on my wardrobe are loose and the door doesn't close properly anymore.",
                    "09:15 AM",
                    surfaceContainerHigh,
                    onSurfaceColor,
                    onSurfaceVariant,
                  ),
                  const SizedBox(height: 16),

                  _buildOutgoingMessage(
                    "Hi Frank! I can help with that. I'll need to replace the hinges with heavy-duty ones so it stays firm.",
                    "09:18 AM",
                    primaryColor,
                    onSurfaceVariant,
                  ),
                  const SizedBox(height: 16),

                  _buildIncomingMessage(
                    "Sounds good. What would be the total cost for the materials and labor?",
                    "09:20 AM",
                    surfaceContainerHigh,
                    onSurfaceColor,
                    onSurfaceVariant,
                  ),
                  const SizedBox(height: 16),

                  _buildOutgoingMessage(
                    "I can do the wardrobe repair for ₦12,500 including the new hardware.",
                    "09:22 AM",
                    primaryColor,
                    onSurfaceVariant,
                    offerTitle: "Price Offer Sent", // Custom parameter for the offer bubble
                  ),
                  const SizedBox(height: 16),

                  _buildIncomingMessage(
                    "That works for me, see you on Tuesday morning around 10 AM?",
                    "09:25 AM",
                    surfaceContainerHigh,
                    onSurfaceColor,
                    onSurfaceVariant,
                  ),
                  const SizedBox(height: 16),

                  _buildOutgoingMessage(
                    "Perfect. It's a deal. I'll be there on Tuesday.",
                    "09:26 AM",
                    primaryColor,
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
                    // Plus Button Box
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: surfaceContainerHigh,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.add, color: onSurfaceVariant, size: 20),
                    ),
                    const SizedBox(width: 12),
                    // Input Field
                    Expanded(
                      child: Container(
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
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                            // Emoji trailing icon
                            suffixIcon: Icon(
                              Icons.sentiment_satisfied_alt,
                              color: onSurfaceVariant.withValues(alpha: 0.6),
                              size: 20,
                            ),
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
          constraints: const BoxConstraints(maxWidth: 320),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4), // Sharp tail
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
            color: timeColor.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }

  Widget _buildOutgoingMessage(String text, String time, Color primaryColor, Color timeColor, {String? offerTitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          constraints: const BoxConstraints(maxWidth: 320),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(4), // Sharp tail
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (offerTitle != null) ...[
                Text(
                  offerTitle,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
              ],
              Text(
                text,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  color: Colors.white,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        Text(
          time,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 10,
            color: timeColor.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }
}
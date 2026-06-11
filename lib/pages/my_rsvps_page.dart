import 'package:flutter/material.dart';

class MyRSVPsPage extends StatefulWidget {
  const MyRSVPsPage({super.key});

  @override
  State<MyRSVPsPage> createState() => _MyRSVPsPageState();
}

class _MyRSVPsPageState extends State<MyRSVPsPage> {
  bool isGoingSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0E1A),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Colors.white, size: 28),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'My RSVPs',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 8),

            // Sliding segmented tab controller
            Container(
              height: 46,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: const Color(0xFF121826),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => isGoingSelected = true),
                      child: Container(
                        decoration: BoxDecoration(
                          color: isGoingSelected ? const Color(0xFFFFC72C) : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Going',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isGoingSelected ? Colors.black : Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => isGoingSelected = false),
                      child: Container(
                        decoration: BoxDecoration(
                          color: !isGoingSelected ? const Color(0xFFFFC72C) : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Interested',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: !isGoingSelected ? Colors.black : Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Cards list
            Expanded(
              child: isGoingSelected
                  ? ListView(
                      children: [
                        _buildRSVPCard(
                          title: 'ALU Entrepreneurship Pitch Night',
                          date: 'Sat, May 24 • Kigali',
                          icon: Icons.wb_sunny_outlined,
                          iconBg: const Color(0xFF6366F1),
                          statusText: 'Going',
                        ),
                        _buildRSVPCard(
                          title: 'AI for Social Impact Workshop',
                          date: 'Thu, Jun 5 • Mauritius',
                          icon: Icons.blur_on,
                          iconBg: const Color(0xFF10B981),
                          statusText: 'Going',
                        ),
                      ],
                    )
                  : Center(
                      child: Text(
                        'No interested items yet.',
                        style: TextStyle(color: Colors.white.withOpacity(0.4)),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRSVPCard({
    required String title,
    required String date,
    required IconData icon,
    required Color iconBg,
    required String statusText,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF121826),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [iconBg, iconBg.withOpacity(0.5)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.white, size: 22),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Icon(Icons.calendar_today_outlined, color: Colors.white.withOpacity(0.4), size: 12),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        date,
                        style: TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 12),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: const Color(0xFF10B981).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.check, color: Color(0xFF10B981), size: 12),
                      const SizedBox(width: 4),
                      Text(
                        statusText,
                        style: const TextStyle(color: Color(0xFF10B981), fontSize: 11, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Icon(Icons.chevron_right, color: Colors.white.withOpacity(0.2), size: 20),
        ],
      ),
    );
  }
}


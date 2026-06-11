import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

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
          'Notifications',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.wb_sunny_outlined, color: Colors.white70),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E38).withOpacity(0.4),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFFFC72C).withOpacity(0.3), width: 1),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.notifications_active_outlined, color: Color(0xFFFFC72C), size: 22),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Only what you follow',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "You're notified about clubs you follow — not everything. Manage in settings.",
                        style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 12, height: 1.4),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),


          _buildNotificationItem(
            icon: Icons.hub,
            iconBg: const Color(0xFF3B82F6),
            title: 'Entrepreneurship Club',
            boldText: ' posted a new event: ',
            actionText: 'Pitch Night',
            time: '12m ago',
            isUnread: true,
          ),
          _buildNotificationItem(
            icon: Icons.blur_on,
            iconBg: const Color(0xFF10B981),
            title: 'AI Workshop Group',
            boldText: ' Reminder: ',
            actionText: 'workshop starts in 2 hours',
            time: '1h ago',
            isUnread: true,
          ),
          _buildNotificationItem(
            icon: Icons.sports_basketball,
            iconBg: const Color(0xFFF59E0B),
            title: 'Basketball',
            boldText: ' ',
            actionText: 'Practice moved to 6pm today',
            time: '5h ago',
            isUnread: false,
          ),
          _buildNotificationItem(
            icon: Icons.person_outline,
            iconBg: const Color(0xFFEC4899),
            title: 'Student Life',
            boldText: ' ',
            actionText: 'Ambassador applications close in 2 days',
            time: '1h ago',
            isUnread: false,
          ),
          _buildNotificationItem(
            icon: Icons.public,
            iconBg: const Color(0xFF6366F1),
            title: 'ALMUN',
            boldText: ' ',
            actionText: 'Position papers are due this Friday',
            time: '1d ago',
            isUnread: false,
          ),

          const SizedBox(height: 32),
          Center(
            child: Text(
              "You're all caught up",
              style: TextStyle(color: Colors.white.withOpacity(0.3), fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem({

    required IconData icon,
    required Color iconBg,
    required String title,
    required String boldText,
    required String actionText,
    required String time,
    required bool isUnread,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: iconBg.withOpacity(0.2),
            child: Icon(icon, color: iconBg, size: 18),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 14, color: Colors.white, height: 1.3),
                    children: [
                      TextSpan(text: title, style: const TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: boldText, style: TextStyle(color: Colors.white.withOpacity(0.8))),
                      TextSpan(text: actionText, style: TextStyle(color: Colors.white.withOpacity(0.8))),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Text(time, style: TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 11)),
              ],
            ),
          ),
          if (isUnread)
            Container(
              margin: const EdgeInsets.only(top: 6, left: 8),
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Color(0xFFFFC72C),
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';

class AccountSettingsPage extends StatelessWidget {
  const AccountSettingsPage({super.key});

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
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildCategoryHeader('ACCOUNT'),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF121826),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                _buildFigmaTile(Icons.person_outline_rounded, 'Edit profile'),
                const Divider(color: Colors.white10, height: 1),
                _buildFigmaTile(
                  Icons.wb_sunny_outlined,
                  'ALU email & password',
                ),
                const Divider(color: Colors.white10, height: 1),
                _buildFigmaTile(Icons.location_on_outlined, 'Campus • Kigali'),
              ],
            ),
          ),
          const SizedBox(height: 24),

          _buildCategoryHeader('NOTIFICATIONS'),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF121826),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                _buildFigmaTile(
                  Icons.notifications_none_rounded,
                  'Followed clubs & categories',
                ),
                const Divider(color: Colors.white10, height: 1),
                _buildFigmaTile(
                  Icons.chat_bubble_outline_rounded,
                  'Chat notifications',
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          _buildCategoryHeader('SUPPORT'),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF121826),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                _buildFigmaTile(Icons.help_outline_rounded, 'Help & Support'),
                const Divider(color: Colors.white10, height: 1),
                _buildFigmaTile(Icons.description_outlined, 'Privacy & terms'),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildCategoryHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 4),
      child: Text(
        title,
        style: TextStyle(
          color: const Color(0x66FFFFFF),
          fontSize: 12,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildFigmaTile(IconData icon, String title) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: Icon(icon, color: const Color(0xFFFFC72C), size: 22),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
      ),
      trailing: const Icon(
        Icons.chevron_right,
        color: Color(0x338F98AA),
        size: 20,
      ),
      onTap: () {},
    );
  }
}

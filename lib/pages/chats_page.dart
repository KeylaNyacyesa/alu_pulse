import 'package:flutter/material.dart';

import 'inside_chats_page.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E1A), // Deep background token
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0E1A),
        elevation: 0,
        title: const Text(
          'Chats',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.wb_sunny_outlined, color: Colors.white70),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search chats...',
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: const Color(0xFF121826), // Container blue
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        children: [
          _buildChatListItem(
            context,
            title: 'Entrepreneurship Club',
            subtitle: 'David: Don\'t forget the meeting at 5',
            time: '10:30',
            unreadCount: 1,
            avatarColor: const Color(0xFF3B82F6),
            icon: Icons.hub,
          ),
          _buildChatListItem(
            context,
            title: 'AI Workshop Group',
            subtitle: 'Fatima: Shared a file',
            time: '09:45',
            unreadCount: 2,
            avatarColor: const Color(0xFF10B981),
            icon: Icons.blur_on,
          ),
          _buildChatListItem(
            context,
            title: 'Basketball',
            subtitle: 'Coach: Practice moved to 6pm',
            time: 'Yesterday',
            unreadCount: 0,
            avatarColor: const Color(0xFFF59E0B),
            icon: Icons.sports_basketball,
          ),
          _buildChatListItem(
            context,
            title: 'ALMUN',
            subtitle: 'Jean: Position papers due Friday',
            time: 'Yesterday',
            unreadCount: 0,
            avatarColor: const Color(0xFF6366F1),
            icon: Icons.public,
          ),
          _buildChatListItem(
            context,
            title: 'Art & Drama',
            subtitle: 'Sarah: Rehearsal photos are up!',
            time: 'Mon',
            unreadCount: 0,
            avatarColor: const Color(0xFFEC4899),
            icon: Icons.palette,
          ),
          _buildChatListItem(
            context,
            title: 'Pitch Night Crew',
            subtitle: 'Emmanuel: Great job everyone! 🎉',
            time: 'Mon',
            unreadCount: 0,
            avatarColor: const Color(0xFFFFC72C),
            icon: Icons.bolt,
          ),
        ],
      ),
    );
  }

  Widget _buildChatListItem(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String time,
    required int unreadCount,
    required Color avatarColor,
    required IconData icon,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF121826),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: CircleAvatar(
          backgroundColor: Color(avatarColor.value & 0x00FFFFFF).withOpacity(0.2),
          child: Icon(icon, color: avatarColor),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            subtitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.grey, fontSize: 13),
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(time, style: const TextStyle(color: Colors.grey, fontSize: 12)),
            const SizedBox(height: 6),
            if (unreadCount > 0)
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: Color(0xFFFFC72C),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '$unreadCount',
                  style: const TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const InsideChatPage()),
          );
        },
      ),
    );
  }
}


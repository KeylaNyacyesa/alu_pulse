import 'package:flutter/material.dart';

import 'chats_page.dart';
import 'explore_page.dart';
import 'home_page.dart';
import 'profile_page.dart';

/// MainNavigation controls the bottom navigation of the app.
/// For now, Home, Explore, Post, Chats, and Profile are connected.
/// Later, we will replace the placeholder pages with the real screens.
class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  /// These are the main pages shown when the user taps the bottom navigation.
  /// Home and Explore will be developed fully in the next steps.
  final List<Widget> _pages = const [
    HomePage(),
    ExplorePage(),
    PlaceholderPage(title: 'Post Page'),
    ChatsPage(),
    ProfilePage(),
  ];

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],

      /// Bottom navigation based on the Figma design:
      /// Home, Explore, Post, Chats, and Profile.
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTabSelected,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF071222),
        selectedItemColor: const Color(0xFFFFBE22),
        unselectedItemColor: const Color(0xFF8F98AA),
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            activeIcon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            activeIcon: Icon(Icons.add_circle),
            label: 'Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            activeIcon: Icon(Icons.chat_bubble),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

/// Temporary page used while we build the real screens.
/// This helps us test navigation before adding detailed UI.
class PlaceholderPage extends StatelessWidget {
  final String title;

  const PlaceholderPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF071222),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

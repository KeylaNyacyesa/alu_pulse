import 'package:flutter/material.dart';

/// HomePage represents the main landing screen of ALU Pulse.
/// It uses mock data and placeholder gradient cards instead of real images.
/// This keeps the prototype simple and focused on UI/UX flow.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const Color darkBlue = Color(0xFF071222);
  static const Color cardBlue = Color(0xFF101E33);
  static const Color yellow = Color(0xFFFFBE22);
  static const Color softText = Color(0xFFB9C2D3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlue,
      body: SafeArea(
        child: Center(
          // This keeps the design mobile-first even when running on Chrome desktop.
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 430),
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 20),
                  _buildSearchBar(),
                  const SizedBox(height: 22),
                  _buildFeaturedCard(),
                  const SizedBox(height: 26),
                  _buildSectionTitle('Latest Opportunities', 'See all'),
                  const SizedBox(height: 14),
                  _buildOpportunityCard(
                    icon: Icons.lightbulb_outline,
                    category: 'Workshop',
                    title: 'Design Thinking for African Startups',
                    subtitle:
                        'Learn how to turn student ideas into real solutions.',
                    time: 'Today • 4:00 PM',
                    location: 'Innovation Hub',
                  ),
                  const SizedBox(height: 12),
                  _buildOpportunityCard(
                    icon: Icons.code,
                    category: 'Hackathon',
                    title: 'ALU Tech Hack Night',
                    subtitle:
                        'Build a prototype with students from different programs.',
                    time: 'Tomorrow • 6:30 PM',
                    location: 'Tech Lab',
                  ),
                  const SizedBox(height: 26),
                  _buildSectionTitle('Upcoming Events', 'View all'),
                  const SizedBox(height: 14),
                  _buildUpcomingEvents(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Header with greeting, campus label, and notification icon.
  Widget _buildHeader() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 24,
          backgroundColor: yellow,
          child: Text(
            'A',
            style: TextStyle(
              color: darkBlue,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 14),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, ALU Student 👋',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Kigali Campus • Discover what is happening',
                style: TextStyle(color: softText, fontSize: 13),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: cardBlue,
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Icon(Icons.notifications_none, color: Colors.white),
        ),
      ],
    );
  }

  /// Search bar placeholder. It is visual only for this prototype stage.
  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: cardBlue,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withOpacity(0.06)),
      ),
      child: const Row(
        children: [
          Icon(Icons.search, color: softText),
          SizedBox(width: 12),
          Text(
            'Search events, clubs, internships...',
            style: TextStyle(color: softText, fontSize: 14),
          ),
        ],
      ),
    );
  }

  /// Featured card uses a gradient placeholder instead of an image.
  /// Later, this can be replaced with an Image.asset or network image.
  Widget _buildFeaturedCard() {
    return Container(
      height: 190,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFFFBE22), Color(0xFFFFD66B)],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: darkBlue.withOpacity(0.18),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Text(
              'Featured Opportunity',
              style: TextStyle(
                color: darkBlue,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const Spacer(),
          const Text(
            'Leadership Lab 2026',
            style: TextStyle(
              color: darkBlue,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Join students building practical leadership solutions for African communities.',
            style: TextStyle(color: darkBlue, fontSize: 14, height: 1.3),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              _featuredInfo(Icons.calendar_today_outlined, 'Fri, 14 Jun'),
              const SizedBox(width: 14),
              _featuredInfo(Icons.people_outline, '120 joined'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _featuredInfo(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: darkBlue),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(
            color: darkBlue,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  /// Reusable section title row.
  Widget _buildSectionTitle(String title, String actionText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          actionText,
          style: const TextStyle(
            color: yellow,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  /// Reusable opportunity card for workshops, hackathons, internships, etc.
  Widget _buildOpportunityCard({
    required IconData icon,
    required String category,
    required String title,
    required String subtitle,
    required String time,
    required String location,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardBlue,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Placeholder icon block instead of using an image.
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: yellow.withOpacity(0.14),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(icon, color: yellow, size: 28),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category.toUpperCase(),
                  style: const TextStyle(
                    color: yellow,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.7,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: softText,
                    fontSize: 13,
                    height: 1.35,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.schedule, size: 15, color: softText),
                    const SizedBox(width: 5),
                    Text(
                      time,
                      style: const TextStyle(color: softText, fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 15,
                      color: softText,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      location,
                      style: const TextStyle(color: softText, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Horizontal list for upcoming events.
  /// The card height is intentionally larger to prevent text overflow
  /// when event titles wrap into two lines.
  Widget _buildUpcomingEvents() {
    final events = [
      {
        'date': '14',
        'month': 'JUN',
        'title': 'Startup Pitch Night',
        'type': 'Entrepreneurship',
      },
      {
        'date': '18',
        'month': 'JUN',
        'title': 'Career Readiness Talk',
        'type': 'Internship',
      },
      {
        'date': '22',
        'month': 'JUN',
        'title': 'Community Service Day',
        'type': 'Volunteer',
      },
    ];

    return SizedBox(
      height: 172,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: events.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final event = events[index];

          return Container(
            width: 182,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: cardBlue,
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: Colors.white.withOpacity(0.05)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Date badge used to make upcoming events easy to scan.
                Container(
                  width: 52,
                  height: 58,
                  decoration: BoxDecoration(
                    color: yellow,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        event['date']!,
                        style: const TextStyle(
                          color: darkBlue,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        event['month']!,
                        style: const TextStyle(
                          color: darkBlue,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),

                // Event title allows two lines and then cuts off safely.
                Text(
                  event['title']!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    height: 1.15,
                  ),
                ),
                const SizedBox(height: 6),

                // Event type is kept to one line to maintain card consistency.
                Text(
                  event['type']!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: softText, fontSize: 12),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

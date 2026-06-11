import 'package:flutter/material.dart';

import '../data/mock_events.dart';
import 'event_details_page.dart';

/// HomePage represents the main landing screen of ALU Pulse.
/// It highlights featured opportunities, latest activities, and upcoming events.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const Color darkBlue = Color(0xFF071222);
  static const Color cardBlue = Color(0xFF101E33);
  static const Color yellow = Color(0xFFFFBE22);
  static const Color softText = Color(0xFFB9C2D3);

  /// Opens the shared dynamic event details screen.
  void _openEventDetails(BuildContext context, EventData event) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => EventDetailsPage(event: event)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final latestEvents = [MockEvents.designThinking, MockEvents.techHackNight];

    final upcomingEvents = [
      MockEvents.startupPitchNight,
      MockEvents.careerReadinessTalk,
      MockEvents.communityServiceDay,
    ];

    return Scaffold(
      backgroundColor: darkBlue,
      body: SafeArea(
        child: Center(
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
                  _buildFeaturedCard(context, MockEvents.leadershipLab),
                  const SizedBox(height: 26),
                  _buildSectionTitle('Latest Opportunities', 'See all'),
                  const SizedBox(height: 14),
                  ...latestEvents.map(
                    (event) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _buildOpportunityCard(context, event),
                    ),
                  ),
                  const SizedBox(height: 14),
                  _buildSectionTitle('Upcoming Events', 'View all'),
                  const SizedBox(height: 14),
                  _buildUpcomingEvents(context, upcomingEvents),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Header with greeting, campus context, and notification icon.
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

  /// Search bar placeholder for the current UI prototype.
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
          Expanded(
            child: Text(
              'Search events, clubs, internships...',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: softText, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  /// Featured card uses event data and opens the shared details page.
  /// The gradient acts as a placeholder visual until image assets are added.
  Widget _buildFeaturedCard(BuildContext context, EventData event) {
    return InkWell(
      onTap: () => _openEventDetails(context, event),
      borderRadius: BorderRadius.circular(26),
      child: Container(
        height: 190,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: event.gradientColors,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              right: 8,
              bottom: 16,
              child: Icon(
                event.heroIcon,
                color: Colors.white.withOpacity(0.24),
                size: 82,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: darkBlue.withOpacity(0.22),
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
                Text(
                  event.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: darkBlue,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  event.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: darkBlue,
                    fontSize: 14,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    _featuredInfo(Icons.calendar_today_outlined, event.date),
                    const SizedBox(width: 14),
                    _featuredInfo(Icons.people_outline, event.attendeeSummary),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _featuredInfo(IconData icon, String text) {
    return Expanded(
      child: Row(
        children: [
          Icon(icon, size: 16, color: darkBlue),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: darkBlue,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Reusable section title row.
  Widget _buildSectionTitle(String title, String actionText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
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

  /// Opportunity card connected to dynamic event data.
  Widget _buildOpportunityCard(BuildContext context, EventData event) {
    return InkWell(
      onTap: () => _openEventDetails(context, event),
      borderRadius: BorderRadius.circular(22),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: cardBlue,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: Colors.white.withOpacity(0.05)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Placeholder visual block representing the event category.
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                color: yellow.withOpacity(0.14),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Icon(event.heroIcon, color: yellow, size: 28),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.category.toUpperCase(),
                    style: const TextStyle(
                      color: yellow,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.7,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    event.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    event.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
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
                      Expanded(
                        child: Text(
                          '${event.date} • ${event.time}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: softText, fontSize: 12),
                        ),
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
                      Expanded(
                        child: Text(
                          event.location,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: softText, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Horizontal list for upcoming events.
  /// Cards use fixed sizing and ellipsis rules to prevent text overflow.
  Widget _buildUpcomingEvents(BuildContext context, List<EventData> events) {
    return SizedBox(
      height: 172,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: events.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final event = events[index];

          return InkWell(
            onTap: () => _openEventDetails(context, event),
            borderRadius: BorderRadius.circular(22),
            child: Container(
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
                          event.date.split(' ').first,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: darkBlue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          event.date.contains('Jun') ? 'JUN' : 'ALU',
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
                  Text(
                    event.title,
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
                  Text(
                    event.category,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: softText, fontSize: 12),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

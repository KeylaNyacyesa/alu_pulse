import 'package:flutter/material.dart';

/// ExplorePage helps students discover opportunities by category,
/// collections, trending topics, and popular student clubs.
class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  static const Color darkBlue = Color(0xFF071222);
  static const Color cardBlue = Color(0xFF101E33);
  static const Color yellow = Color(0xFFFFBE22);
  static const Color softText = Color(0xFFB9C2D3);
  static const Color mutedBlue = Color(0xFF1A2B46);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlue,
      body: SafeArea(
        child: Center(
          // Keeps the screen mobile-first when tested on Chrome desktop.
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 430),
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 18),
                  _buildSearchBar(),
                  const SizedBox(height: 26),
                  _buildSectionTitle('Featured Collections', null),
                  const SizedBox(height: 14),
                  _buildCollectionCard(
                    title: 'Entrepreneurship Week',
                    subtitle:
                        'Pitch sessions, founder talks, and startup workshops',
                    eventCount: '12 events',
                    icon: Icons.rocket_launch_outlined,
                    colors: const [Color(0xFF16345F), Color(0xFFFFBE22)],
                  ),
                  const SizedBox(height: 14),
                  _buildCollectionCard(
                    title: 'Tech & Innovation',
                    subtitle: 'Hackathons, AI workshops, and student demos',
                    eventCount: '18 events',
                    icon: Icons.memory_outlined,
                    colors: const [Color(0xFF0F3B34), Color(0xFF1E88E5)],
                  ),
                  const SizedBox(height: 26),
                  _buildSectionTitle('Browse by Category', null),
                  const SizedBox(height: 14),
                  _buildCategoryGrid(),
                  const SizedBox(height: 26),
                  _buildSectionTitle('Trending Topics', null),
                  const SizedBox(height: 14),
                  _buildTrendingTopics(),
                  const SizedBox(height: 26),
                  _buildSectionTitle('Popular Clubs', 'See all'),
                  const SizedBox(height: 14),
                  _buildPopularClubs(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Page heading based on the ALU Pulse dark theme.
  Widget _buildHeader() {
    return const Row(
      children: [
        Icon(Icons.graphic_eq, color: yellow, size: 24),
        SizedBox(width: 8),
        Text(
          'Explore',
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  /// Search bar placeholder for discovering categories, clubs, and topics.
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
              'Search categories, clubs, topics...',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: softText, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  /// Reusable section title with an optional action label.
  Widget _buildSectionTitle(String title, String? actionText) {
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
        if (actionText != null)
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

  /// Featured collection card using a gradient placeholder.
  /// Image assets can replace this visual area in a future version.
  Widget _buildCollectionCard({
    required String title,
    required String subtitle,
    required String eventCount,
    required IconData icon,
    required List<Color> colors,
  }) {
    return Container(
      height: 160,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 6,
            top: 8,
            child: Icon(icon, color: Colors.white.withOpacity(0.16), size: 88),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: darkBlue.withOpacity(0.35),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Collection',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                subtitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  height: 1.25,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                eventCount,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Category grid built from mock data.
  /// The fixed card height and ellipsis rules prevent layout overflow.
  Widget _buildCategoryGrid() {
    final categories = [
      {'title': 'Events', 'count': '24 active', 'icon': Icons.event_outlined},
      {
        'title': 'Opportunities',
        'count': '12 active',
        'icon': Icons.work_outline,
      },
      {
        'title': 'Workshops',
        'count': '8 active',
        'icon': Icons.lightbulb_outline,
      },
      {
        'title': 'Hackathons',
        'count': '5 active',
        'icon': Icons.emoji_events_outlined,
      },
      {
        'title': 'Internships',
        'count': '15 active',
        'icon': Icons.business_center_outlined,
      },
      {'title': 'Clubs', 'count': '18 active', 'icon': Icons.groups_outlined},
    ];

    return GridView.builder(
      itemCount: categories.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: 1.08,
      ),
      itemBuilder: (context, index) {
        final category = categories[index];

        return _buildCategoryCard(
          title: category['title'] as String,
          count: category['count'] as String,
          icon: category['icon'] as IconData,
        );
      },
    );
  }

  /// Category card with a small visual placeholder area.
  Widget _buildCategoryCard({
    required String title,
    required String count,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: cardBlue,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.06)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Placeholder visual block representing category artwork.
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: yellow.withOpacity(0.15),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: yellow, size: 26),
          ),
          const Spacer(),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            count,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: softText, fontSize: 12),
          ),
        ],
      ),
    );
  }

  /// Trending topics list built from mock engagement data.
  Widget _buildTrendingTopics() {
    final topics = [
      {'rank': '#1', 'title': 'Climate Action', 'interested': '156 interested'},
      {'rank': '#2', 'title': 'Fintech', 'interested': '142 interested'},
      {
        'rank': '#3',
        'title': 'Design Thinking',
        'interested': '128 interested',
      },
      {'rank': '#4', 'title': 'Social Impact', 'interested': '98 interested'},
    ];

    return Column(
      children: topics.map((topic) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _buildTopicCard(
            rank: topic['rank']!,
            title: topic['title']!,
            interested: topic['interested']!,
          ),
        );
      }).toList(),
    );
  }

  /// Topic card with a favorite icon for future personalization.
  Widget _buildTopicCard({
    required String rank,
    required String title,
    required String interested,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: cardBlue,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withOpacity(0.06)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: yellow.withOpacity(0.14),
            child: Text(
              rank,
              style: const TextStyle(
                color: yellow,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  interested,
                  style: const TextStyle(color: softText, fontSize: 12),
                ),
              ],
            ),
          ),
          const Icon(Icons.favorite_border, color: softText),
        ],
      ),
    );
  }

  /// Popular clubs displayed with a join action.
  Widget _buildPopularClubs() {
    final clubs = [
      {
        'name': 'Entrepreneurship Club',
        'members': '324 members',
        'verified': false,
      },
      {'name': 'Tech Innovators', 'members': '278 members', 'verified': true},
      {'name': 'Design Guild', 'members': '156 members', 'verified': false},
      {
        'name': 'Sustainability Collective',
        'members': '189 members',
        'verified': false,
      },
    ];

    return Column(
      children: clubs.map((club) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _buildClubCard(
            name: club['name'] as String,
            members: club['members'] as String,
            verified: club['verified'] as bool,
          ),
        );
      }).toList(),
    );
  }

  /// Club card for student communities.
  Widget _buildClubCard({
    required String name,
    required String members,
    required bool verified,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: cardBlue,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withOpacity(0.06)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: yellow,
            child: Text(
              name.characters.first,
              style: const TextStyle(
                color: darkBlue,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (verified) ...[
                  const SizedBox(width: 5),
                  const Icon(
                    Icons.verified,
                    color: Colors.greenAccent,
                    size: 16,
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: yellow,
              foregroundColor: darkBlue,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: const Text(
              'Join',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

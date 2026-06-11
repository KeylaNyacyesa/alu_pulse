import 'package:flutter/material.dart';

/// EventDetailsPage displays complete information about a selected event.
/// The screen uses mock event content and local state for RSVP interactions.
class EventDetailsPage extends StatefulWidget {
  const EventDetailsPage({super.key});

  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  static const Color darkBlue = Color(0xFF071222);
  static const Color cardBlue = Color(0xFF101E33);
  static const Color yellow = Color(0xFFFFBE22);
  static const Color softText = Color(0xFFB9C2D3);
  static const Color borderBlue = Color(0xFF243552);

  bool isRsvped = false;
  bool isInterested = false;

  /// Updates RSVP status for the current event.
  void _toggleRsvp() {
    setState(() {
      isRsvped = !isRsvped;
    });
  }

  /// Updates interested status for the current event.
  void _toggleInterested() {
    setState(() {
      isInterested = !isInterested;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlue,

      /// Fixed bottom action bar for participation management.
      /// The bar is kept compact so it does not cover the event details content.
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: darkBlue,
          border: Border(top: BorderSide(color: borderBlue, width: 1)),
        ),
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 14, 20, 18),
            child: Row(
              children: [
                Expanded(
                  child: _buildActionButton(
                    label: isRsvped ? 'RSVPed' : 'RSVP',
                    icon: isRsvped ? Icons.check_circle : Icons.event_available,
                    isActive: isRsvped,
                    onTap: _toggleRsvp,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: _buildActionButton(
                    label: isInterested ? 'Interested' : 'Interest',
                    icon: isInterested ? Icons.favorite : Icons.favorite_border,
                    isActive: isInterested,
                    onTap: _toggleInterested,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 430),
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 26),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeroSection(context),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 22, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildEventTags(),
                        const SizedBox(height: 18),
                        const Text(
                          'Climate Action Week',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            height: 1.15,
                          ),
                        ),
                        const SizedBox(height: 18),
                        _buildOrganizerCard(),
                        const SizedBox(height: 22),
                        _buildInfoRows(),
                        const SizedBox(height: 26),
                        _buildAboutSection(),
                        const SizedBox(height: 24),
                        _buildCommunityNote(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Top event visual using a gradient placeholder instead of an image asset.
  Widget _buildHeroSection(BuildContext context) {
    return Container(
      height: 270,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0E552D), Color(0xFF65A844)],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 4,
            left: 0,
            child: _buildCircleIconButton(
              icon: Icons.arrow_back,
              onTap: () => Navigator.pop(context),
            ),
          ),
          Positioned(
            top: 4,
            right: 0,
            child: _buildCircleIconButton(
              icon: Icons.bookmark_border,
              onTap: () {},
            ),
          ),
          Positioned(
            right: 20,
            bottom: 34,
            child: Icon(
              Icons.eco_outlined,
              color: Colors.white.withOpacity(0.72),
              size: 46,
            ),
          ),
          Positioned(
            left: 0,
            bottom: 18,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
              decoration: BoxDecoration(
                color: yellow,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                'Event • Community',
                style: TextStyle(
                  color: darkBlue,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Circular icon button used for back and bookmark actions.
  Widget _buildCircleIconButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        width: 46,
        height: 46,
        decoration: BoxDecoration(
          color: darkBlue.withOpacity(0.55),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }

  /// Tags communicate location, category, and program relevance.
  Widget _buildEventTags() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        _buildTag('Kigali', Icons.location_on, yellow),
        _buildTag('BEL', null, Colors.greenAccent),
        _buildTag('BSE', null, Colors.purpleAccent),
      ],
    );
  }

  Widget _buildTag(String text, IconData? icon, Color accentColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
      decoration: BoxDecoration(
        color: accentColor.withOpacity(0.13),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: accentColor.withOpacity(0.25)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, color: accentColor, size: 14),
            const SizedBox(width: 5),
          ],
          Text(
            text,
            style: TextStyle(
              color: accentColor,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  /// Organizer section highlights trust and role verification.
  Widget _buildOrganizerCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardBlue,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: borderBlue),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 26,
            backgroundColor: Color(0xFF23A36B),
            child: Text(
              'SM',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
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
                  'Sustainability Mission',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Verified organizer',
                  style: TextStyle(color: softText, fontSize: 12),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: yellow),
            ),
            child: const Row(
              children: [
                Icon(Icons.check, color: yellow, size: 14),
                SizedBox(width: 5),
                Text(
                  'ORGANIZER',
                  style: TextStyle(
                    color: yellow,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Main event information shown as scannable rows.
  Widget _buildInfoRows() {
    return Column(
      children: [
        _buildInfoRow(
          icon: Icons.calendar_month_outlined,
          title: 'May 26 – 30',
          subtitle: 'All week',
        ),
        _buildDivider(),
        _buildInfoRow(
          icon: Icons.location_on_outlined,
          title: 'Across campus',
          subtitle: 'Kigali Campus',
        ),
        _buildDivider(),
        _buildInfoRow(
          icon: Icons.people_outline,
          title: '120 going • 54 interested',
          subtitle: 'Tap RSVP to join',
        ),
      ],
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 13),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: cardBlue,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: borderBlue),
            ),
            child: Icon(icon, color: yellow),
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
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: softText, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(color: Colors.white.withOpacity(0.08), height: 1);
  }

  /// Event description and value proposition.
  Widget _buildAboutSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About this event',
          style: TextStyle(
            color: Colors.white,
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 14),
        Text(
          'A week of tree planting, clean-ups, and climate talks led by student missions. '
          'Participants will collaborate with peers, join practical campus activities, '
          'and contribute to sustainability goals across the ALU community.',
          style: TextStyle(color: softText, fontSize: 15, height: 1.55),
        ),
      ],
    );
  }

  /// Lightweight community prompt to connect the details page with engagement.
  Widget _buildCommunityNote() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardBlue,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.06)),
      ),
      child: const Row(
        children: [
          Icon(Icons.chat_bubble_outline, color: yellow),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'Community chat opens after RSVP so participants can coordinate before the event.',
              style: TextStyle(color: softText, fontSize: 13, height: 1.35),
            ),
          ),
        ],
      ),
    );
  }

  /// Reusable bottom action button.
  Widget _buildActionButton({
    required String label,
    required IconData icon,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: isActive ? yellow : cardBlue,
        foregroundColor: isActive ? darkBlue : Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: BorderSide(color: isActive ? yellow : borderBlue),
        ),
      ),
    );
  }
}

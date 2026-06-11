import 'package:flutter/material.dart';

/// CreatePostPage lets verified members publish a new event or opportunity.
///
/// It is a StatefulWidget (unlike the mostly-static pages in this app) because
/// the form has interactive state: the selected post type, the chosen event
/// type, and the registration checkboxes all change as the user taps them.
///
/// Styling follows the ALU Pulse design language (dark navy + yellow) so it
/// sits consistently alongside HomePage and ExplorePage. This page is a plain
/// Scaffold with NO bottom navigation bar — the shared nav lives in
/// MainNavigation, which swaps this page into view.
class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  // Shared palette, matching the constants used across the app.
  static const Color darkBlue = Color(0xFF071222);
  static const Color cardBlue = Color(0xFF101E33);
  static const Color yellow = Color(0xFFFFBE22);
  static const Color softText = Color(0xFFB9C2D3);

  // ---- Form state ----
  String _postType = 'Event';
  String _eventType = 'In-person';

  bool _requireRsvp = false;
  bool _enableChat = false;
  bool _sendReminders = false;

  static const _postTypes = [
    'Event',
    'Opportunity',
    'Workshop',
    'Hackathon',
    'Internship',
    'Announcement',
  ];

  static const _eventTypes = ['In-person', 'Virtual', 'Hybrid'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlue,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 430),
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Create Post',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 22),

                  // ---------- Post Type ----------
                  _label('Post Type'),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: _postTypes
                        .map(
                          (type) => _chip(
                            label: type,
                            selected: _postType == type,
                            onTap: () => setState(() => _postType = type),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 24),

                  // ---------- Cover Image ----------
                  _label('Cover Image'),
                  const SizedBox(height: 12),
                  _coverImageBox(),
                  const SizedBox(height: 24),

                  // ---------- Title ----------
                  _label('Title', required: true),
                  const SizedBox(height: 10),
                  _textField(
                    hint: 'Give your post a clear, descriptive title',
                  ),
                  const SizedBox(height: 24),

                  // ---------- Description ----------
                  _label('Description', required: true),
                  const SizedBox(height: 10),
                  _textField(
                    hint: 'Describe what this is about, who should '
                        'attend, what to expect...',
                    maxLines: 4,
                  ),
                  const SizedBox(height: 24),

                  // ---------- Date & Time ----------
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _label('Date', required: true),
                            const SizedBox(height: 10),
                            _textField(
                              hint: 'mm/dd/yy',
                              icon: Icons.calendar_today_outlined,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _label('Time', required: true),
                            const SizedBox(height: 10),
                            _textField(
                              hint: '--:-- --',
                              icon: Icons.access_time,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // ---------- Event Type ----------
                  _label('Event Type'),
                  const SizedBox(height: 12),
                  Row(
                    children: _eventTypes
                        .map(
                          (type) => Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: _chip(
                              label: type,
                              selected: _eventType == type,
                              onTap: () => setState(() => _eventType = type),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 24),

                  // ---------- Location ----------
                  _label('Location', required: true),
                  const SizedBox(height: 10),
                  _textField(
                    hint: 'Where is this happening?',
                    icon: Icons.location_on_outlined,
                  ),
                  const SizedBox(height: 24),

                  // ---------- Capacity ----------
                  _label('Capacity (optional)'),
                  const SizedBox(height: 10),
                  _textField(
                    hint: 'Maximum attendees',
                    icon: Icons.people_outline,
                  ),
                  const SizedBox(height: 24),

                  // ---------- Tags ----------
                  _label('Tags (optional)'),
                  const SizedBox(height: 10),
                  _textField(hint: 'e.g., entrepreneurship, tech, design'),
                  const SizedBox(height: 8),
                  const Text(
                    'Separate tags with commas to help others discover '
                    'your post',
                    style: TextStyle(fontSize: 12, color: softText),
                  ),
                  const SizedBox(height: 24),

                  // ---------- Registration Settings ----------
                  _registrationSettings(),
                  const SizedBox(height: 18),

                  // ---------- "Posting as" note ----------
                  _postingAsNote(),
                  const SizedBox(height: 28),

                  // ---------- Buttons ----------
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: _onSaveDraft,
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            side: BorderSide(
                              color: Colors.white.withOpacity(0.18),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            foregroundColor: Colors.white,
                          ),
                          child: const Text(
                            'Save Draft',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _onPublish,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: yellow,
                            foregroundColor: darkBlue,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: const Text(
                            'Publish Post',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ---- Button handlers (placeholders for now) ----

  void _onSaveDraft() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Draft saved (not wired up yet)')),
    );
  }

  void _onPublish() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Post published (not wired up yet)')),
    );
  }

  // ============ Reusable helper widgets ============

  /// A section label, with an optional red asterisk for required fields.
  Widget _label(String text, {bool required = false}) {
    return RichText(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        children: [
          if (required)
            const TextSpan(
              text: ' *',
              style: TextStyle(color: Color(0xFFFF6B6B)),
            ),
        ],
      ),
    );
  }

  /// A selectable pill used for Post Type and Event Type.
  Widget _chip({
    required String label,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 11),
        decoration: BoxDecoration(
          color: selected ? yellow : cardBlue,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: selected ? yellow : Colors.white.withOpacity(0.08),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13.5,
            fontWeight: FontWeight.w600,
            color: selected ? darkBlue : softText,
          ),
        ),
      ),
    );
  }

  /// A standard dark-themed text input, with an optional leading icon.
  Widget _textField({
    required String hint,
    IconData? icon,
    int maxLines = 1,
  }) {
    return TextField(
      maxLines: maxLines,
      style: const TextStyle(fontSize: 14, color: Colors.white),
      cursorColor: yellow,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: softText, fontSize: 14),
        prefixIcon: icon == null ? null : Icon(icon, size: 20, color: softText),
        filled: true,
        fillColor: cardBlue,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.06)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: yellow),
        ),
      ),
    );
  }

  /// The dashed-border "Add cover image" box.
  Widget _coverImageBox() {
    return _DashedBorder(
      color: Colors.white.withOpacity(0.22),
      radius: 14,
      child: Container(
        height: 150,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: cardBlue,
          borderRadius: BorderRadius.circular(14),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.image_outlined, size: 34, color: softText),
            SizedBox(height: 12),
            Text(
              'Add cover image',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
            SizedBox(height: 4),
            Text(
              'Recommended: 1200 x 675px',
              style: TextStyle(fontSize: 11.5, color: softText),
            ),
          ],
        ),
      ),
    );
  }

  /// Card holding the three registration checkboxes.
  Widget _registrationSettings() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      decoration: BoxDecoration(
        color: cardBlue,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Registration Settings',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          _checkRow('Require RSVP', _requireRsvp,
              (v) => setState(() => _requireRsvp = v ?? false)),
          _checkRow('Enable discussion chat', _enableChat,
              (v) => setState(() => _enableChat = v ?? false)),
          _checkRow('Send reminders to attendees', _sendReminders,
              (v) => setState(() => _sendReminders = v ?? false)),
        ],
      ),
    );
  }

  Widget _checkRow(String label, bool value, ValueChanged<bool?> onChanged) {
    return InkWell(
      onTap: () => onChanged(!value),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Row(
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: Checkbox(
                value: value,
                onChanged: onChanged,
                activeColor: yellow,
                checkColor: darkBlue,
                side: BorderSide(color: softText.withOpacity(0.6)),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
              ),
            ),
            const SizedBox(width: 12),
            Text(label, style: const TextStyle(color: softText, fontSize: 14)),
          ],
        ),
      ),
    );
  }

  /// The "Posting as" note with a yellow left accent bar.
  Widget _postingAsNote() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: cardBlue,
        borderRadius: BorderRadius.circular(12),
        border: const Border(left: BorderSide(color: yellow, width: 3)),
      ),
      child: const Text.rich(
        TextSpan(
          style: TextStyle(fontSize: 12.5, color: softText, height: 1.45),
          children: [
            TextSpan(
              text: 'Posting as: ',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: 'Your profile will be shown as the organizer. Only '
                  'verified club leaders and authorized community members '
                  'can post events and opportunities.',
            ),
          ],
        ),
      ),
    );
  }
}

/// Draws a dashed rounded rectangle border around [child].
/// Flutter has no built-in dashed border, so this is a small custom painter.
class _DashedBorder extends StatelessWidget {
  final Widget child;
  final Color color;
  final double radius;

  const _DashedBorder({
    required this.child,
    required this.color,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DashedPainter(color: color, radius: radius),
      child: child,
    );
  }
}

class _DashedPainter extends CustomPainter {
  final Color color;
  final double radius;

  _DashedPainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.4
      ..style = PaintingStyle.stroke;

    const dash = 6.0;
    const gap = 4.0;
    final rrect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(radius),
    );

    final path = Path()..addRRect(rrect);
    for (final metric in path.computeMetrics()) {
      double distance = 0;
      while (distance < metric.length) {
        canvas.drawPath(
          metric.extractPath(distance, distance + dash),
          paint,
        );
        distance += dash + gap;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DashedPainter oldDelegate) =>
      oldDelegate.color != color || oldDelegate.radius != radius;
}

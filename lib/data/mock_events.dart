import 'package:flutter/material.dart';

/// Model used to represent opportunity and event content across the app.
/// The same model is reused by Home, Explore, and Event Details screens.
class EventData {
  final String id;
  final String title;
  final String category;
  final String organizer;
  final String organizerInitials;
  final String date;
  final String time;
  final String location;
  final String attendeeSummary;
  final String description;
  final List<String> tags;
  final IconData heroIcon;
  final List<Color> gradientColors;

  const EventData({
    required this.id,
    required this.title,
    required this.category,
    required this.organizer,
    required this.organizerInitials,
    required this.date,
    required this.time,
    required this.location,
    required this.attendeeSummary,
    required this.description,
    required this.tags,
    required this.heroIcon,
    required this.gradientColors,
  });
}

/// Mock event data used for the current UI prototype.
/// This can later be replaced by Firebase, Supabase, or another backend source.
class MockEvents {
  static const EventData leadershipLab = EventData(
    id: 'leadership_lab_2026',
    title: 'Leadership Lab 2026',
    category: 'Leadership',
    organizer: 'ALU Leadership Team',
    organizerInitials: 'AL',
    date: 'Fri, 14 Jun',
    time: '4:00 PM - 6:00 PM',
    location: 'Leadership Hall',
    attendeeSummary: '120 going • 54 interested',
    description:
        'Join students building practical leadership solutions for African communities. '
        'The lab includes group activities, short talks, and guided reflection sessions focused on ethical leadership and student impact.',
    tags: ['Kigali', 'Leadership', 'Community'],
    heroIcon: Icons.diversity_3_outlined,
    gradientColors: [Color(0xFF16345F), Color(0xFFFFBE22)],
  );

  static const EventData designThinking = EventData(
    id: 'design_thinking_startups',
    title: 'Design Thinking for African Startups',
    category: 'Workshop',
    organizer: 'Entrepreneurship Club',
    organizerInitials: 'EC',
    date: 'Today',
    time: '4:00 PM - 5:30 PM',
    location: 'Innovation Hub',
    attendeeSummary: '86 going • 31 interested',
    description:
        'A practical workshop helping students move from raw ideas to clear problem statements, user insights, and early solution concepts for African startup challenges.',
    tags: ['Workshop', 'Startup', 'Design'],
    heroIcon: Icons.lightbulb_outline,
    gradientColors: [Color(0xFF6B3F13), Color(0xFFFFBE22)],
  );

  static const EventData techHackNight = EventData(
    id: 'alu_tech_hack_night',
    title: 'ALU Tech Hack Night',
    category: 'Hackathon',
    organizer: 'Tech Innovators Club',
    organizerInitials: 'TI',
    date: 'Tomorrow',
    time: '6:30 PM - 10:00 PM',
    location: 'Tech Lab',
    attendeeSummary: '64 going • 42 interested',
    description:
        'A student-led build night where teams create quick prototypes, test ideas, and present solutions using beginner-friendly technology tools.',
    tags: ['Tech', 'Hackathon', 'Prototype'],
    heroIcon: Icons.code,
    gradientColors: [Color(0xFF102A54), Color(0xFF1E88E5)],
  );

  static const EventData startupPitchNight = EventData(
    id: 'startup_pitch_night',
    title: 'Startup Pitch Night',
    category: 'Entrepreneurship',
    organizer: 'ALU Ventures Community',
    organizerInitials: 'AV',
    date: '14 Jun',
    time: '5:00 PM - 7:00 PM',
    location: 'Main Auditorium',
    attendeeSummary: '140 going • 73 interested',
    description:
        'An evening for student founders to pitch ideas, receive feedback, and connect with peers interested in entrepreneurship and venture building.',
    tags: ['Pitch', 'Startup', 'Founders'],
    heroIcon: Icons.rocket_launch_outlined,
    gradientColors: [Color(0xFF3B1C5A), Color(0xFFFFBE22)],
  );

  static const EventData careerReadinessTalk = EventData(
    id: 'career_readiness_talk',
    title: 'Career Readiness Talk',
    category: 'Internship',
    organizer: 'Career Development Office',
    organizerInitials: 'CD',
    date: '18 Jun',
    time: '2:00 PM - 3:30 PM',
    location: 'Career Hub',
    attendeeSummary: '95 going • 39 interested',
    description:
        'A practical session on CV preparation, internship applications, interview readiness, and how students can present their leadership experiences professionally.',
    tags: ['Career', 'Internship', 'Skills'],
    heroIcon: Icons.business_center_outlined,
    gradientColors: [Color(0xFF133B5C), Color(0xFF4CA3FF)],
  );

  static const EventData communityServiceDay = EventData(
    id: 'community_service_day',
    title: 'Community Service Day',
    category: 'Volunteer',
    organizer: 'Student Missions Office',
    organizerInitials: 'SM',
    date: '22 Jun',
    time: '9:00 AM - 1:00 PM',
    location: 'Across campus',
    attendeeSummary: '110 going • 48 interested',
    description:
        'A community-focused activity where students volunteer in small teams, support campus initiatives, and contribute to practical service projects.',
    tags: ['Volunteer', 'Community', 'Impact'],
    heroIcon: Icons.volunteer_activism_outlined,
    gradientColors: [Color(0xFF0E552D), Color(0xFF65A844)],
  );

  static const EventData entrepreneurshipWeek = EventData(
    id: 'entrepreneurship_week',
    title: 'Entrepreneurship Week',
    category: 'Collection',
    organizer: 'Entrepreneurship Club',
    organizerInitials: 'EC',
    date: 'This week',
    time: 'Multiple sessions',
    location: 'Innovation Hub',
    attendeeSummary: '220 following • 89 interested',
    description:
        'A week-long collection of founder talks, startup workshops, pitch practice sessions, and networking moments for students interested in entrepreneurship.',
    tags: ['Entrepreneurship', 'Startup', 'Networking'],
    heroIcon: Icons.rocket_launch_outlined,
    gradientColors: [Color(0xFF16345F), Color(0xFFFFBE22)],
  );

  static const EventData techInnovationShowcase = EventData(
    id: 'tech_innovation_showcase',
    title: 'Tech & Innovation Showcase',
    category: 'Collection',
    organizer: 'Tech Innovators Club',
    organizerInitials: 'TI',
    date: 'Next week',
    time: 'Multiple sessions',
    location: 'Tech Lab',
    attendeeSummary: '180 following • 67 interested',
    description:
        'A collection of hackathons, AI workshops, app demos, and peer learning sessions designed to help students explore technology and innovation.',
    tags: ['Tech', 'Innovation', 'AI'],
    heroIcon: Icons.memory_outlined,
    gradientColors: [Color(0xFF0F3B34), Color(0xFF1E88E5)],
  );

  static const EventData climateActionWeek = EventData(
    id: 'climate_action_week',
    title: 'Climate Action Week',
    category: 'Community',
    organizer: 'Sustainability Mission',
    organizerInitials: 'SM',
    date: 'May 26 - 30',
    time: 'All week',
    location: 'Across campus',
    attendeeSummary: '120 going • 54 interested',
    description:
        'A week of tree planting, clean-ups, and climate talks led by student missions. '
        'Participants collaborate with peers and contribute to sustainability goals across the ALU community.',
    tags: ['Kigali', 'BEL', 'IBT'],
    heroIcon: Icons.eco_outlined,
    gradientColors: [Color(0xFF0E552D), Color(0xFF65A844)],
  );

  /// Events commonly shown on the Home page.
  static const List<EventData> homeEvents = [
    leadershipLab,
    designThinking,
    techHackNight,
    startupPitchNight,
    careerReadinessTalk,
    communityServiceDay,
  ];

  /// Events and collections commonly shown on the Explore page.
  static const List<EventData> exploreEvents = [
    entrepreneurshipWeek,
    techInnovationShowcase,
    climateActionWeek,
    designThinking,
    techHackNight,
  ];
}

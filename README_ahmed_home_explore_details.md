# ALU Pulse — Home, Explore, and Dynamic Event Details Contribution

## Contributor

Ahmed Khalid

## Branch

`feature/ahmed-home-explore-details`

## Contribution Summary

This branch adds the main student discovery flow for the ALU Pulse Flutter application. The implemented work focuses on three key screens:

1. Home Page
2. Explore Page
3. Event Details Page

The implementation also adds a reusable mock data structure so that different event cards can open different event details using one shared dynamic details screen.

The current implementation is UI/UX focused and uses mock data with local state only. No backend, database, Firebase, or external package integration is included in this branch.

---

## Implemented Features

### 1. Main Navigation Structure

The default Flutter counter application was replaced with the ALU Pulse app structure.

A bottom navigation bar was added with five tabs:

* Home
* Explore
* Post
* Chats
* Profile

The Home and Explore tabs are fully implemented in this branch. The Post, Chats, and Profile tabs currently use placeholder screens and can be expanded in future development.

---

### 2. Home Page

The Home Page was created using the ALU Pulse dark blue and yellow visual theme.

The Home Page includes:

* Student greeting section
* Campus/context subtitle
* Notification icon
* Search bar placeholder
* Featured opportunity card
* Latest opportunities section
* Upcoming events horizontal list
* Clickable event cards that navigate to the Event Details Page

The Home Page uses placeholder gradient visuals instead of real images. This keeps the current prototype lightweight while allowing image assets to be added later.

---

### 3. Explore Page

The Explore Page was created to help students discover opportunities by category, topic, and community.

The Explore Page includes:

* Search bar placeholder
* Featured collections
* Browse by category grid
* Trending topics list
* Popular clubs list
* Clickable cards that navigate to related event details

This page supports the assignment goal of helping ALU students discover events, clubs, workshops, internships, hackathons, and student-led opportunities in one place.

---

### 4. Dynamic Event Details Page

The Event Details Page was refactored into a reusable dynamic screen.

Instead of creating multiple separate event details files, one shared `EventDetailsPage` receives an `EventData` object and displays different event content depending on the selected card.

The Event Details Page includes:

* Gradient hero section
* Back button
* Bookmark placeholder icon
* Event category label
* Event title
* Tags
* Organizer information
* Date and time
* Location
* Attendance summary
* Event description
* Community chat note
* RSVP button
* Interest button

The RSVP and Interest buttons use local state with `setState()` to update the UI when tapped.

---

## Mock Data

A mock data file was added to organize the events used across the app.

File:

`lib/data/mock_events.dart`

This file includes:

* `EventData` model
* Mock event objects
* Home event list
* Explore event list

Events currently included:

* Leadership Lab 2026
* Design Thinking for African Startups
* ALU Tech Hack Night
* Startup Pitch Night
* Career Readiness Talk
* Community Service Day
* Entrepreneurship Week
* Tech & Innovation Showcase
* Climate Action Week

This structure makes the app easier to maintain because the Home Page, Explore Page, and Event Details Page can reuse the same event content.

---

## Files Added or Modified

### Added

`lib/pages/main_navigation.dart`

Purpose:
Controls the bottom navigation and connects the main app tabs.

`lib/pages/home_page.dart`

Purpose:
Displays the Home Page with featured, latest, and upcoming opportunities.

`lib/pages/explore_page.dart`

Purpose:
Displays discovery sections such as featured collections, categories, trending topics, and popular clubs.

`lib/pages/event_details_page.dart`

Purpose:
Displays a reusable dynamic event details screen.

`lib/data/mock_events.dart`

Purpose:
Stores the `EventData` model and mock event content used by the UI.

### Modified

`lib/main.dart`

Purpose:
Replaced the default Flutter counter app with the ALU Pulse root app.

`test/widget_test.dart`

Purpose:
Updated the default Flutter widget test to match the new root widget and Home Page content.

---

## Navigation Flow

The current navigation flow is:

Home Page
→ Featured Opportunity
→ Event Details Page

Home Page
→ Latest Opportunity Card
→ Event Details Page

Home Page
→ Upcoming Event Card
→ Event Details Page

Explore Page
→ Featured Collection
→ Event Details Page

Explore Page
→ Category Card
→ Event Details Page

Explore Page
→ Trending Topic
→ Event Details Page

Explore Page
→ Popular Club
→ Event Details Page

The back arrow on the Event Details Page returns the user to the previous screen.

---

## State Handling

The current implementation uses simple local state.

The Event Details Page includes two state variables:

* `isRsvped`
* `isInterested`

These values are updated using `setState()` when the user taps RSVP or Interest.

This demonstrates lightweight participation management without needing a backend.

---

## UI/UX Decisions

The implementation follows a mobile-first layout.

Key UI/UX decisions:

* A dark blue background was used to match the selected ALU Pulse theme.
* Yellow was used as the primary accent color for important actions and highlights.
* Cards were used to make opportunities easy to scan.
* Text overflow handling was added to prevent layout issues.
* A maximum content width was used so the design remains mobile-like even when tested on Chrome desktop.
* Placeholder gradient cards were used instead of real images until final image assets are available.
* One reusable Event Details Page was used instead of creating multiple duplicated details pages.

---

## How to Run the Project

From the project root, run:

```bash
flutter pub get
```

Then run the app on Chrome:

```bash
flutter run -d chrome
```

To run on an Android emulator:

```bash
flutter devices
flutter run
```

To run tests:

```bash
flutter test
```

To format the code:

```bash
dart format lib test
```

---

## Testing Checklist

The following items were tested manually:

* App opens successfully
* Bottom navigation works
* Home tab opens
* Explore tab opens
* Featured Home card opens Event Details
* Latest opportunity cards open Event Details
* Upcoming event cards open Event Details
* Explore collection cards open Event Details
* Explore category cards open Event Details
* Trending topic cards open Event Details
* Popular club cards open Event Details
* RSVP button updates correctly
* Interest button updates correctly
* Back arrow returns to the previous screen
* No visible overflow warnings after fixes
* Widget test passes

---

## Current Limitations





* Real images are not included yet.
* Search bars are visual placeholders only.
* Post, Chats, and Profile tabs are placeholders.
* RSVP and Interest states are local only and reset when the page is reopened.
* No backend or database is connected.
* No authentication or role-based posting logic is connected yet.

---

## Recommended Next Steps

Suggested future improvements:

1. Replace Post, Chats, and Profile placeholders with professional coming-soon or prototype screens.
2. Add real images through `assets/images/`.
3. Register the image assets inside `pubspec.yaml`.
4. Add simple search/filter interaction.
5. Add persistent RSVP state using SharedPreferences or another lightweight storage option.
6. Add organizer/post creation flow.
7. Add community chat prototype.
8. Connect authentication or onboarding flow if required by the final app scope.

---

## AI Usage Statement

AI tools were used for brainstorming, debugging support, code organization guidance, and improving documentation clarity.


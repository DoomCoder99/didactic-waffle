# Local Lawyer App - Mobile Flutter Application

A Flutter mobile application for local lawyers to manage cases, hearings, and communications. Built following WDI Flutter coding standards and based on the mobile conversion guide from desktop Figma designs.

## Project Structure

Following WDI GetX Architecture pattern:

```
lib/
├── main.dart
├── core/
│   ├── constants/
│   │   └── app_constants.dart
│   ├── routes/
│   │   └── app_routes.dart
│   └── theme/
│       ├── colors.dart
│       ├── typography.dart
│       ├── spacing.dart
│       └── app_theme.dart
├── modules/
│   ├── hearings/
│   │   ├── controller/
│   │   │   └── hearings_controller.dart
│   │   └── view/
│   │       └── hearings_view.dart
│   ├── cases/
│   │   ├── controller/
│   │   │   └── cases_controller.dart
│   │   └── view/
│   │       └── cases_view.dart
│   └── chat/
│       └── view/
│           └── chat_view.dart
└── widgets/
    └── common/
        ├── app_bar_custom.dart
        ├── bottom_nav_bar.dart
        ├── card_custom.dart
        └── badge_custom.dart
```

## Features Implemented

### ✅ Core Infrastructure
- **Design System**: Complete mobile design system with colors, typography, and spacing
- **Theme**: Material 3 theme configuration
- **Navigation**: GetX routing with bottom navigation bar
- **Reusable Widgets**: Custom AppBar, BottomNav, Cards, Badges

### ✅ Main Screens
1. **My Hearings Dashboard** (`HearingsView`)
   - Greeting section
   - Stats cards (Today, Upcoming, Overdue)
   - Alert banners
   - List/Calendar view toggle
   - Search and filters
   - Hearings list with status badges

2. **My Cases** (`CasesView`)
   - Page header with location badge
   - Alert banner
   - Open/Closed tabs
   - Search and filter controls
   - Cases list (table converted to cards)
   - Case cards with all key information

3. **My Chat** (`ChatView`)
   - Conversations list
   - Search and filter chips
   - Conversation cards with avatars
   - Unread indicators
   - Status badges

## Design System

### Colors
- **Primary**: `#0A3D62` (Primary Blue)
- **Secondary**: `#117A8B` (Secondary Blue)
- **Status Colors**: Success, Warning, Error, Info
- **Neutrals**: Background, Surface, Border, Text variants

### Typography
- **H1**: 24px (Lora SemiBold) - Page titles
- **H2**: 20px (Inter SemiBold) - Section headers
- **H3**: 18px (Inter Medium) - Subsection headers
- **Body**: 14px (Inter Regular) - Standard text
- **Body Small**: 12px (Inter Regular) - Captions

### Spacing
- Based on 8px grid system
- Screen padding: 16px
- Card padding: 16px
- Touch targets: Minimum 44×44px

## Dependencies

- `get: ^4.6.6` - State management and routing
- `google_fonts: ^6.1.0` - Custom fonts (Inter, Lora)
- `intl: ^0.19.0` - Internationalization and date formatting

## Getting Started

1. **Install dependencies:**
   ```bash
   flutter pub get
   ```

2. **Run the app:**
   ```bash
   flutter run
   ```

3. **Run tests:**
   ```bash
   flutter test
   ```

## Architecture

### State Management: GetX
Following WDI standards, using GetX for:
- State management (Controllers)
- Navigation (GetX routing)
- Dependency injection

### Code Organization
- **Modules**: Feature-based organization (hearings, cases, chat)
- **Controllers**: Business logic and state management
- **Views**: UI components
- **Widgets**: Reusable UI components
- **Core**: Theme, routes, constants

## Mobile Conversion

This app is based on the mobile conversion guide (`docs/mobile_conversion_guide.md`) which converts 26 desktop Figma screens to mobile-optimized versions.

### Key Conversions Applied:
- ✅ Multi-column → Single column layouts
- ✅ Sidebar → Bottom navigation
- ✅ Tables → Card-based lists
- ✅ Desktop modals → Bottom sheets
- ✅ Wide forms → Single column with progressive disclosure

## Next Steps

### To Complete Implementation:
1. **Case Detail Screens**
   - Case overview with collapsible sections
   - Assignees tab
   - Hearings tab
   - Chat tab
   - Activity tab

2. **Profile & Settings**
   - Profile view
   - Profile edit form
   - Settings screens (Account, Notifications, Display, Privacy)

3. **API Integration**
   - Replace mock data with API calls
   - Implement API service layer
   - Add error handling

4. **Additional Features**
   - Search functionality
   - Filters and sorting
   - Notifications
   - Drawer menu
   - Bottom sheets for actions

## Documentation

- **Mobile Design System**: `docs/mobile_design_system.md`
- **Conversion Guide**: `docs/mobile_conversion_guide.md`
- **Conversion Summary**: `docs/mobile_conversion_summary.md`

## Code Standards

This project follows:
- WDI Flutter Coding Standards (GetX Architecture)
- Material Design 3 guidelines
- Mobile-first design principles
- Accessibility best practices (WCAG AA)

## License

[Your License Here]

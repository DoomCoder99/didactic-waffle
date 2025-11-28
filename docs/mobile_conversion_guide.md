# Mobile Conversion Guide - 26 Desktop Screens

## Overview
This guide provides detailed instructions for converting each of the 26 desktop screens into mobile-optimized versions.

## Conversion Principles

### Layout Transformations
1. **Multi-column → Single column:** All desktop multi-column layouts become vertical stacks
2. **Sidebar → Drawer/Bottom Nav:** Desktop sidebars become drawer menus or bottom navigation
3. **Wide tables → Card lists:** Tables become scrollable card-based lists
4. **Horizontal scroll → Vertical scroll:** All content flows vertically with proper spacing

### Navigation Patterns
- **Top Navigation:** Collapsed into app bar with hamburger menu
- **Sidebar Navigation:** Converted to bottom navigation bar or drawer menu
- **Breadcrumbs:** Simplified or removed on mobile

### Content Density
- **Spacing:** Increased vertical spacing (minimum 16px between major sections)
- **Text Size:** Minimum 12-13px for body text, 14-16px preferred
- **Touch Targets:** Minimum 44x44px for all interactive elements

---

## Screen-by-Screen Conversion Guide

### Screen 1: Local Lawyer Portal - My Hearings (node-id=1-2)
**Desktop Layout:** Dashboard with sidebar navigation, header search, alerts bar, stats cards, and calendar view.

**Mobile Conversion Steps:**

1. **Create Mobile Frame:**
   - Name: `Local Lawyer Portal – Mobile` or `My Hearings – Mobile`
   - Size: 390px × 844px (iPhone 13/14 standard)
   - Background: `#f5f7fa`

2. **App Bar (Top Navigation):**
   - Height: 56px (iOS) or 64px (Android with status bar)
   - Background: White
   - Left: Hamburger menu icon (44×44px touch target)
   - Center: "My Hearings" title (H2, 20px, Inter SemiBold)
   - Right: Search icon + Notification bell with badge (44×44px each)
   - Bottom border: 1px `#e5e7eb`

3. **Greeting Section:**
   - Padding: 16px horizontal, 24px top
   - "Hello, Kumar! 👋" (H1, 24px, Lora SemiBold)
   - Subtitle: "Here's what's happening with your cases today" (Body, 14px, Inter Regular, `#6b7280`)
   - Spacing: 8px between heading and subtitle

4. **Alerts Bar → Mobile Cards:**
   - Convert horizontal scrollable alerts bar to vertical stack of cards
   - Each alert becomes a full-width card (358px width within 16px padding)
   - Card structure:
     - Padding: 16px
     - Icon (32×32px) + Text stack
     - Title (12px, Inter Medium, `#6b7280`)
     - Main text (14px, Inter Medium, `#1a1d21`)
     - Timestamp (12px, Inter Medium, `#6b7280`)
   - Spacing: 12px between cards
   - Border: Left border 4px (color-coded by alert type)

5. **Stats Cards → Single Row (Scrollable):**
   - Convert 3-column grid to horizontal scrollable row
   - Card width: 120px (fixed)
   - Card height: 100px
   - Padding: 16px
   - Icon (16px) + Label (12px) + Number (24px)
   - Spacing: 12px between cards
   - Horizontal padding: 16px on sides

6. **Info Banner:**
   - Full width (358px within padding)
   - Padding: 12px 16px
   - Icon (16px) + Text (14px, `#6b7280`)
   - Background: White
   - Border radius: 8px
   - Margin: 16px vertical

7. **Filters & Search Bar:**
   - Stack vertically on mobile
   - Top row: Calendar/List toggle (segmented control, full width)
   - Middle: Search input (full width, 48px height)
   - Bottom row: Filters + Export buttons (side by side, equal width)
   - Spacing: 12px between rows

8. **Calendar View → List View (Default Mobile):**
   - **Option A:** Keep calendar but make it scrollable vertically
   - **Option B (Recommended):** Default to List view on mobile
   - List items:
     - Full-width cards (358px within padding)
     - Date header (sticky): "Monday, November 10" (16px, Inter SemiBold)
     - Hearing cards below:
       - Left border: 4px (status color)
       - Padding: 16px
       - Case ID (16px, Inter Regular)
       - Time with icon (12px, `#6b7280`)
       - Badge if multiple hearings
   - Spacing: 8px between hearing cards, 24px between days

9. **Status Legend:**
   - Convert horizontal legend to vertical chips
   - Each status: Chip with colored indicator + text
   - Stack vertically or use wrap layout
   - Padding: 8px between items

10. **Sidebar → Bottom Navigation:**
    - Remove sidebar
    - Add bottom navigation bar (height: 80px including safe area)
    - 3 tabs: My Hearings (selected), My Cases, My Chat
    - Icon (24px) + Label (12px) below
    - Badge on Chat tab if unread messages

11. **User Menu:**
    - Move to app bar (avatar icon)
    - Opens bottom sheet on tap
    - Bottom sheet contains: Profile, Settings, Sign out

**Mobile Frame Checklist:**
- ✅ No horizontal scrolling for main content
- ✅ All text readable (minimum 12px)
- ✅ Touch targets minimum 44×44px
- ✅ Proper spacing (16px padding, 12-24px between sections)
- ✅ Status colors preserved
- ✅ Navigation accessible via bottom nav

---

### Screen 2: Local Lawyer Portal - My Hearings (with Notifications) (node-id=1-1084)
**Similar to Screen 1, with notification dropdown visible.**

**Additional Mobile Conversion:**
- **Notification Dropdown → Bottom Sheet:**
  - On mobile, tapping notification bell opens bottom sheet
  - Bottom sheet height: 60-80% of screen
  - Header: "Notifications" + "3 unread" badge
  - List of notification cards (full width)
  - Each notification:
    - Icon (40×40px) + Content
    - Title (14px, Inter Medium)
    - Description (14px, Inter Regular, `#6b7280`)
    - Timestamp + Case badge
    - "Mark read" button
  - Footer: "View all notifications" button
  - Swipe down to dismiss

---

### Screen 3: Local Lawyer Portal - My Hearings (with User Menu) (node-id=1-1723)
**Similar to Screen 1, with user menu dropdown visible.**

**Additional Mobile Conversion:**
- **User Menu Dropdown → Bottom Sheet:**
  - On mobile, tapping avatar opens bottom sheet
  - Bottom sheet contains:
    - User info: Name + Role (centered, 16px padding top)
    - Divider
    - Menu items: My Profile, Settings, Sign out
    - Each item: 48px height, 16px padding horizontal
  - Swipe down to dismiss

---

### Screen 4: Local Lawyer Portal - My Hearings (with Search) (node-id=1-2292)
**Similar to Screen 1, with search dropdown visible.**

**Additional Mobile Conversion:**
- **Search Dropdown → Full Screen Search:**
  - On mobile, tapping search opens full-screen search
  - Search screen:
    - App bar with back button + search input
    - Results grouped by category:
      - Cases
      - GIC (Insurance Companies)
      - Central Lawyers
      - Local Lawyers
      - Modules
      - Actions
    - Each result: Full-width card with icon, title, subtitle, badge
    - "View all results" button at bottom
  - Results scrollable vertically

---

### Screen 5: Local Lawyer Portal - My Hearings (Search Active) (node-id=1-2849)
**Similar to Screen 4, with search query entered.**

**Mobile Conversion:**
- Same as Screen 4
- Search results filtered by query
- Show "No results" state if empty

---

### Screen 6: My Cases - Open Cases List (node-id=1-3587)
**Desktop Layout:** Cases list page with sidebar, header search, tabs (Open/Closed), filters, export, and wide data table.

**Mobile Conversion Steps:**

1. **App Bar:**
   - Title: "My Cases" (H2, 20px)
   - Left: Hamburger menu
   - Right: Search icon + Notification bell
   - Badge: Location badge "Mumbai" moved below title

2. **Page Header Section:**
   - Title: "My Cases" (H1, 24px) with icon
   - Location badge: "Mumbai" (chip style)
   - Subtitle: "Cases assigned to you by Central Lawyer" (14px, `#6b7280`)
   - Padding: 16px horizontal, 24px top

3. **Alert Banner:**
   - Full-width card (358px within padding)
   - Icon + Text stack
   - Email link styled as button
   - Padding: 16px
   - Margin: 16px vertical

4. **Tabs (Open/Closed Cases):**
   - Horizontal scrollable tabs (if needed) or segmented control
   - Tab height: 44px
   - Badge counts preserved
   - Active tab: Underline + color change

5. **Search & Filters Bar:**
   - Stack vertically:
     - Top: Search input (full width, 48px height)
     - Bottom: Filters + Export buttons (side by side, equal width)
   - Spacing: 12px between rows
   - Padding: 16px horizontal

6. **Table → Card List:**
   - Convert each table row to a card
   - Card structure (358px width, padding 16px):
     - **Top Row:** Case Number (link, 16px) + Status badge (right-aligned)
     - **Second Row:** Claimant Name (16px, bold) + Age/Gender (14px, `#6b7280`)
     - **Third Row:** GIC Name (14px, `#6b7280`)
     - **Fourth Row:** Priority badge + Next Hearing date with icon
     - **Fifth Row:** Assigned Date (14px, `#6b7280`)
     - **Sixth Row:** Court name (14px, `#6b7280`, truncated with ellipsis)
     - **Action Button:** Three-dot menu (44×44px, right-aligned)
   - Card spacing: 12px vertical
   - Card border: 1px `#e5e7eb`, radius 8px
   - Touch feedback on tap

7. **Empty State:**
   - If no cases: Centered message + illustration
   - "No cases found" (16px)
   - "Try adjusting your filters" (14px, `#6b7280`)

**Mobile Frame Checklist:**
- ✅ Table converted to cards
- ✅ All data visible without horizontal scroll
- ✅ Touch-friendly action buttons
- ✅ Proper spacing between cards

---

### Screen 7: My Cases - Closed Cases List (node-id=1-4056)
**Desktop Layout:** Similar to Screen 6, showing Closed Cases tab with settled/closed cases.

**Mobile Conversion:**
- Same as Screen 6
- Tab state: "Closed Cases" selected
- Table shows settled/closed status badges
- Same card-based list conversion

---

### Screen 8: My Cases - Open Cases List (Alternative View) (node-id=1-7624)
**Desktop Layout:** Similar to Screen 6, with context menu visible.

**Mobile Conversion:**
- Same as Screen 6
- **Context Menu → Bottom Sheet:**
  - On mobile, tapping three-dot menu opens bottom sheet
  - Bottom sheet options:
    - "Open Case Details" (with icon)
    - "Open Hearings" (with icon)
    - "Open Chat" (with icon)
    - "Copy Link" (with icon)
  - Each option: 48px height, 16px padding horizontal
  - Swipe down to dismiss

---

### Screen 9: Case Detail - Overview Tab (node-id=1-4279)
**Desktop Layout:** Very long case detail page with multiple collapsible sections (Claim Information, Policy Related, Vehicle, Accident, Hospital, Claimant Information), tabs, and form fields.

**Mobile Conversion Steps:**

1. **App Bar:**
   - Left: Back button (44×44px)
   - Title: Case ID "case-ll-001" (truncated if long)
   - Right: More menu (three dots, 44×44px)
   - Status badge moved below title

2. **Case Header Section:**
   - Case ID (H1, 24px) + Status badge
   - Case title: "Rajesh Sharma vs. National Insurance Company Ltd." (16px)
   - Key info cards (stacked):
     - GIC: Label + Value
     - Court: Label + Value
     - Advocate: Label + Value
     - Claim Amount: Label + Value
   - Last updated timestamp (12px, `#6b7280`)
   - Padding: 16px horizontal, 24px top

3. **Alert Banner:**
   - Full-width card with icon + text
   - "You have read-only access..." message
   - Padding: 16px

4. **Tabs Navigation:**
   - Horizontal scrollable tabs
   - Tab height: 44px
   - Tabs: Overview, Assignees, Hearings, Chat, Activity
   - Active tab: Underline indicator
   - Padding: 16px horizontal

5. **Overview Tab Content:**
   - **Alert Section:** Info banner about suggestions
   - **Collapsible Sections (Cards):**
     - Each section becomes a collapsible card
     - Card header: Icon + Title + Field count badge + Status badge
     - Tap to expand/collapse
     - Expanded content shows form fields
   
6. **Form Fields → Mobile Form:**
   - Convert 2-column form to single column
   - Each field:
     - Label (14px, `#1a1d21`) + Required asterisk + Badge (if CL Managed)
     - Input field (full width, 48px height)
     - Spacing: 16px between fields
   - **Suggestion Fields:**
     - Show "Master Value:" label above input
     - Show "Your Suggested Value:" label below
     - Visual distinction (border color or background)
     - Spacing: 12px between master and suggested

7. **Document Attachments:**
   - Each document: Full-width card
   - Icon + Filename + Metadata (date, uploader)
   - Action buttons: Download + Delete (44×44px each)
   - Card padding: 16px
   - Spacing: 12px between documents

8. **Section Cards:**
   - Claim Information (collapsible)
   - Policy Related (collapsible, shows "Has Suggestions" badge)
   - Vehicle (collapsible)
   - Accident (collapsible)
   - Hospital (collapsible)
   - Claimant Information (collapsible)
   - Each card: Border, padding 16px, radius 8px
   - Spacing: 16px between cards

9. **Sticky Action Button (if needed):**
   - "Suggest Updates" button at bottom (sticky)
   - Height: 56px
   - Full width minus padding
   - Primary color background

**Mobile Frame Checklist:**
- ✅ Long form split into collapsible sections
- ✅ No horizontal scrolling
- ✅ All fields readable
- ✅ Suggestions clearly distinguished
- ✅ Documents accessible

**Note:** This screen is very long. Consider splitting into multiple screens or using progressive disclosure (collapsible sections).

---

### Screen 10: Case Detail - Assignees Tab (node-id=1-4724)
**Desktop Layout:** Case detail page showing Assignees tab with Central Lawyer, Local Lawyer, and GIC Information cards.

**Mobile Conversion Steps:**

1. **App Bar & Header:** Same as Screen 9

2. **Tabs:** Same horizontal scrollable tabs, "Assignees" selected

3. **Alert Banner:**
   - "Case assignments are managed by your Central Lawyer" message
   - Full-width card, padding 16px

4. **Assignees Cards → Stacked Cards:**
   - **Central Lawyer Card:**
     - Full-width card (358px within padding)
     - Avatar (64×64px, left) + Content (right)
     - Name: "Adv. Priya Sharma" (H3, 18px)
     - Badge: "Central Lawyer"
     - Email with icon (14px, `#6b7280`)
     - Padding: 16px
     - Spacing: 16px between cards

   - **Local Lawyer Card (You):**
     - Same structure as Central Lawyer card
     - Additional badges: "Local Lawyer" + "You"
     - Additional info rows:
       - Email with icon
       - Location with icon
       - Bar Council with icon
       - Assigned date with icon
     - Each info row: 20px height, 8px spacing

   - **GIC Information Card:**
     - Full-width card
     - Title: "GIC Information" (H4, 16px)
     - Info rows:
       - GIC Name: Label + Value
       - Insurance Company: Label + Value
     - Padding: 16px

5. **Card Styling:**
   - Border: 1px `#e5e7eb`
   - Radius: 8px
   - Background: White
   - Shadow: Subtle elevation

**Mobile Frame Checklist:**
- ✅ All assignee info visible
- ✅ Cards properly stacked
- ✅ Touch-friendly avatars and links
- ✅ Clear visual hierarchy

---

### Screen 11: Case Detail - Hearings Tab (node-id=1-4964)
**Desktop Layout:** Case detail page showing Hearings tab with hearings list and "Add Hearing" button.

**Mobile Conversion Steps:**

1. **App Bar & Header:** Same as Screen 9

2. **Tabs:** Same horizontal scrollable tabs, "Hearings" selected

3. **Alert Banner:**
   - "You can add hearings for cases assigned to you..." message
   - Full-width card, padding 16px

4. **Add Hearing Button:**
   - Floating action button (FAB) or full-width button at top
   - "Add Hearing" with icon (48px height)
   - Position: Below tabs, before list

5. **Hearings List → Card List:**
   - Convert each hearing row to a card
   - Card structure (358px width, padding 16px):
     - **Top Row:** Hearing type badge + Date/Time (right-aligned)
     - **Second Row:** Case ID (16px, bold)
     - **Third Row:** Status badge + Priority badge
     - **Fourth Row:** Location with icon (14px, `#6b7280`)
     - **Fifth Row:** Notes preview (14px, `#6b7280`, truncated)
     - **Action Button:** Three-dot menu (44×44px, right-aligned)
   - Card spacing: 12px vertical
   - Tap card to open hearing details (bottom sheet or full screen)

6. **Empty State:**
   - Centered message + illustration
   - "No hearings scheduled" (16px)
   - "Add your first hearing" button

---

### Screen 12: Case Detail - Chat Tab (node-id=1-5142)
**Desktop Layout:** Case detail page showing Chat tab with chat thread, participants sidebar, and attachments.

**Mobile Conversion Steps:**

1. **App Bar:**
   - Left: Back button
   - Title: Case ID "MAC/2024/001" (truncated)
   - Right: Info icon + More menu

2. **Chat Header (Below App Bar):**
   - Case ID + Status badge
   - Claimant name
   - Padding: 16px horizontal, 12px vertical

3. **Chat Messages:**
   - Full-width message bubbles
   - Sender messages: Right-aligned, primary color background
   - Received messages: Left-aligned, white background
   - Avatar (32×32px) next to received messages
   - Timestamp below each message (12px, `#6b7280`)
   - Message actions (reply, forward, etc.) on long-press

4. **Message Input Bar (Sticky Bottom):**
   - Full-width input area
   - Text input (48px height) + Attach button + Send button
   - Padding: 8px horizontal, 12px vertical
   - Background: White, top border 1px `#e5e7eb`

5. **Participants & Attachments → Bottom Sheet:**
   - Tap info icon to open bottom sheet
   - Bottom sheet tabs: Participants, Attachments, Case Details
   - **Participants Tab:**
     - List of participants with avatars
     - Name + Role badge
     - Online status indicator
   - **Attachments Tab:**
     - Grid or list of attachments
     - Thumbnail + Filename + Size
     - Tap to preview/download
   - **Case Details Tab:**
     - Case number, claimant, status
     - Created date, conversation type

---

### Screen 13: Case Detail - Chat Tab (Alternative View) (node-id=1-5441)
**Similar to Screen 12, with context menu visible.**

**Mobile Conversion:**
- Same as Screen 12
- **Context Menu → Bottom Sheet:**
  - Long-press message opens bottom sheet
  - Options: Reply, Forward, Copy, Delete
  - Each option: 48px height, 16px padding

---

### Screen 14: Case Detail - Chat Tab (with Context Menu) (node-id=1-6703)
**Similar to Screen 13.**

**Mobile Conversion:**
- Same as Screen 12 and 13

---

### Screen 15: Case Detail - Activity Tab (node-id=1-7375)
**Desktop Layout:** Case detail page showing Activity tab with timeline of activities.

**Mobile Conversion Steps:**

1. **App Bar & Header:** Same as Screen 9

2. **Tabs:** Same horizontal scrollable tabs, "Activity" selected

3. **Activity Timeline → Vertical Timeline:**
   - Convert horizontal timeline to vertical
   - Each activity item:
     - **Left:** Icon (40×40px, colored circle)
     - **Right:** Content card (full width minus icon)
     - **Card Content:**
       - Title (16px, Inter Medium)
       - Description (14px, `#6b7280`)
       - Timestamp (12px, `#6b7280`)
       - Actor badges (name + role)
   - Timeline line: Vertical line connecting icons
   - Card spacing: 16px vertical
   - Card padding: 16px

4. **Activity Types:**
   - Case progress updated
   - Hearing scheduled
   - Document uploaded
   - Chat message sent
   - Case assigned
   - Each with distinct icon and color

5. **Empty State:**
   - Centered message
   - "No activity yet" (16px)
   - "Activity will appear here as the case progresses" (14px, `#6b7280`)

---

### Screen 16: Profile View (node-id=1-10235)
**Desktop Layout:** Profile page with personal information, professional information, contact information, and coverage sections.

**Mobile Conversion Steps:**

1. **App Bar:**
   - Left: Back button
   - Title: "Profile"
   - Right: Settings icon + Edit button

2. **Profile Header:**
   - Avatar (96×96px, centered)
   - Name (H1, 24px, centered)
   - Badges: "Local Lawyer" + "2FA Enabled" (chips, centered)
   - Stats row (horizontal scrollable):
     - Last login
     - Active devices
     - Password changed
   - Padding: 24px top, 16px horizontal

3. **Information Cards → Stacked Cards:**
   - **Personal Information Card:**
     - Title: "Personal Information" (H3, 18px)
     - Info rows: Label + Value (stacked vertically)
     - Bar Council Number, Year of Enrollment, Years of Experience
     - Padding: 16px
   
   - **Professional Information Card:**
     - Title: "Professional Information" (H3, 18px)
     - Primary Court, Other Courts (chips), Specializations (chips), Languages (chips), Chamber Address
     - Padding: 16px
   
   - **Contact Information Card:**
     - Title: "Contact Information" (H3, 18px)
     - Primary Email, Alternate Email, Phone Number
     - Each with icon + value
     - Padding: 16px
   
   - **Coverage & Availability Card:**
     - Title: "Coverage & Availability" (H3, 18px)
     - Coverage Areas, Working Hours
     - Padding: 16px

4. **Card Styling:**
   - Border: 1px `#e5e7eb`
   - Radius: 8px
   - Background: White
   - Spacing: 16px between cards

---

### Screen 17: Profile Edit (node-id=1-10456)
**Desktop Layout:** Profile edit form with multiple sections.

**Mobile Conversion Steps:**

1. **App Bar:**
   - Left: Back button
   - Title: "Edit Profile"
   - Right: Save button (disabled until changes)

2. **Form Sections → Stacked Cards:**
   - **Profile Picture Section:**
     - Avatar (96×96px) + "Change Photo" button
     - File size hint below
   
   - **Personal Information Section:**
     - Full Name, Bar Council Number (disabled), Year of Enrollment, Phone Number, Alternate Email
     - Each field: Label + Input (full width, 48px height)
     - Spacing: 16px between fields
   
   - **Professional Information Section:**
     - Primary Court (dropdown), Other Courts (multi-select chips), Specializations (multi-select chips), Languages (multi-select chips), Years of Experience, Chamber Address (textarea), Coverage Areas
     - Same field styling as above
   
   - **Last Updated:**
     - Timestamp at bottom (12px, `#6b7280`)

3. **Action Buttons (Sticky Bottom):**
   - Cancel button (outline) + Save Changes button (primary)
   - Height: 56px each
   - Full width minus padding
   - Background: White, top border 1px `#e5e7eb`

---

### Screen 18: Settings - Account Tab (node-id=1-10651)
**Desktop Layout:** Settings page with Account tab showing password change, 2FA, active sessions, and delete account.

**Mobile Conversion Steps:**

1. **App Bar:**
   - Left: Back button
   - Title: "Settings"
   - Right: Notification bell

2. **Tabs Navigation:**
   - Horizontal scrollable tabs
   - Tabs: Account, Notifications, Display, Privacy
   - Tab height: 44px
   - Active tab: Underline indicator

3. **Settings Cards → Stacked Cards:**
   - **Change Password Card:**
     - Title: "Change Password" (H3, 18px)
     - Description (14px, `#6b7280`)
     - Fields: Current Password, New Password, Confirm New Password
     - "Update Password" button
     - Padding: 16px
   
   - **Two-Factor Authentication Card:**
     - Title: "Two-Factor Authentication" (H3, 18px)
     - Status badge: "Enabled"
     - "Disable" button
     - Backup codes section with "Regenerate Codes" button
     - Padding: 16px
   
   - **Active Sessions Card:**
     - Title: "Active Sessions" (H3, 18px)
     - Each session: Device icon + Info (browser, location, last active) + "Current Session" badge
     - "Sign out all other devices" button
     - Padding: 16px
   
   - **Delete Account Card:**
     - Title: "Delete Account" (H3, 18px, red)
     - Warning alert
     - "Request Account Deletion" button (destructive)
     - Padding: 16px

4. **Card Spacing:** 16px between cards

---

### Screen 19: Settings - Notifications Tab (node-id=1-11347)
**Desktop Layout:** Settings page with Notifications tab showing notification preferences, digest, and quiet hours.

**Mobile Conversion Steps:**

1. **App Bar & Tabs:** Same as Screen 18, "Notifications" selected

2. **Notification Preferences Card:**
   - Title: "Notification Preferences" (H3, 18px)
   - Table → Vertical list of notification types
   - Each notification type:
     - Title (16px) + Description (14px, `#6b7280`)
     - Toggles: In-App, Email, SMS (horizontal row)
     - Padding: 16px vertical
   - Types: Hearing Reminders, Mentions & Chat, Evidence Requested, Case Updates

3. **Notification Digest Card:**
   - Title: "Notification Digest" (H3, 18px)
   - Frequency dropdown: "Immediate (as they happen)"
   - Description below
   - Padding: 16px

4. **Quiet Hours Card:**
   - Title: "Quiet Hours" (H3, 18px)
   - Toggle switch
   - Description below
   - Padding: 16px

5. **Save Button:**
   - Sticky bottom button: "Save Changes"
   - Height: 56px
   - Full width minus padding

---

### Screen 20: Settings - Display Tab (node-id=1-11512)
**Desktop Layout:** Settings page with Display tab showing date/time, language, theme, and display density.

**Mobile Conversion Steps:**

1. **App Bar & Tabs:** Same as Screen 18, "Display" selected

2. **Date & Time Card:**
   - Title: "Date & Time" (H3, 18px)
   - Timezone dropdown: "IST (Indian Standard Time)"
   - Date Format dropdown: "DD/MM/YYYY"
   - Time Format dropdown: "12-hour"
   - Padding: 16px

3. **Language Card:**
   - Title: "Language" (H3, 18px)
   - Interface Language dropdown: "English"
   - Padding: 16px

4. **Theme Card:**
   - Title: "Theme" (H3, 18px)
   - Radio button options (vertical stack):
     - Light (with preview icon)
     - Dark (with preview icon)
     - System (with preview icon)
   - Each option: Radio + Title + Description
   - Padding: 16px

5. **Display Density Card:**
   - Title: "Display Density" (H3, 18px)
   - Radio button options:
     - Comfortable (more spacing)
     - Compact (less spacing)
   - Padding: 16px

6. **Save Button:** Same as Screen 19

---

### Screen 21: Settings - Privacy Tab (node-id=1-11709)
**Desktop Layout:** Settings page with Privacy tab showing login history, account activity log, data & privacy, and session security.

**Mobile Conversion Steps:**

1. **App Bar & Tabs:** Same as Screen 18, "Privacy" selected

2. **Login History Card:**
   - Title: "Login History" (H3, 18px)
   - Each login: Device icon + Browser/OS + Location + Date/Time + IP + Status badge
   - Card format, spacing 12px
   - Padding: 16px

3. **Account Activity Log Card:**
   - Title: "Account Activity Log" (H3, 18px)
   - Each activity: Icon + Action + Date/Time
   - Card format, spacing 12px
   - Padding: 16px

4. **Data & Privacy Card:**
   - Title: "Data & Privacy" (H3, 18px)
   - **Download Your Data:** Description + "Request Data Download" button
   - **Data Retention:** Description
   - **Privacy Policy:** Description + "Read Privacy Policy" button
   - Padding: 16px

5. **Session Security Card:**
   - Title: "Session Security" (H3, 18px)
   - **Session Timeout:** Description (30 minutes)
   - **Remember Me Duration:** Description (30 days)
   - Padding: 16px

---

### Screen 22: My Chat - Conversations List (node-id=1-12035)
**Desktop Layout:** Chat page with conversations list, chat thread, and right sidebar (participants, attachments).

**Mobile Conversion Steps:**

1. **App Bar:**
   - Left: Hamburger menu
   - Title: "My Conversations"
   - Right: "New Chat" button

2. **Alert Banner:**
   - "You can chat about cases assigned to you..." message
   - Full-width card, padding 16px

3. **Conversations List:**
   - Search bar (full width, 48px height)
   - Filter chips: All Cases, Unread, Archived
   - Conversation count + Last updated timestamp
   - **Conversation Cards:**
     - Avatar (40×40px) + Content
     - Case ID (16px, bold) + Date (12px, `#6b7280`)
     - Claimant name (14px)
     - Last message preview (14px, `#6b7280`, truncated)
     - Status badge + Unread badge (if applicable)
     - Card padding: 16px
     - Card spacing: 8px vertical
     - Tap to open chat thread

4. **Chat Thread (Full Screen):**
   - App bar: Back button + Case ID + Status badge + More menu
   - Message list (scrollable)
   - Message input bar (sticky bottom)
   - **Participants & Attachments:** Tap info icon to open bottom sheet

---

### Screen 23: My Chat - New Conversation Drawer (node-id=1-12494)
**Desktop Layout:** Chat page with new conversation drawer/modal open.

**Mobile Conversion:**
- **New Conversation Drawer → Bottom Sheet:**
  - Height: 70-80% of screen
  - Header: "Start New Conversation" + Close button
  - Alert banner: "You can only start conversations for cases assigned to you"
  - Form fields:
    - Select Case (required, dropdown)
    - Message (required, textarea)
  - Footer: Cancel button + "Start Conversation" button
  - Swipe down to dismiss

---

### Screen 24: My Hearings - Calendar View (node-id=1-8119)
**Desktop Layout:** My Hearings page with calendar view and hearing drawer/modal.

**Mobile Conversion:**
- Same as Screen 1
- **Hearing Drawer → Bottom Sheet:**
  - Height: 80-90% of screen
  - Header: Hearing title + Edit button
  - Tabs: Details, Evidence, Outcome
  - Content scrollable
  - Footer: Close button

---

### Screen 25: My Hearings - Hearing Drawer with Evidence Tab (node-id=1-8836)
**Desktop Layout:** My Hearings page with hearing drawer showing Evidence tab.

**Mobile Conversion:**
- Same as Screen 24
- **Evidence Tab:**
  - Evidence list (cards)
  - Each evidence: Name + Type + Upload date + Actions
  - "Add Evidence" button

---

### Screen 26: My Hearings - Calendar View (node-id=1-9539)
**Desktop Layout:** My Hearings page with calendar view and hearing drawer showing Outcome tab.

**Mobile Conversion:**
- Same as Screen 1 and 24
- **Outcome Tab:**
  - Outcome Type dropdown (required)
  - Next Hearing Date picker (required)
  - Outcome Notes textarea (required)
  - Documents Submitted list
  - Form fields full-width, 48px height

---

### Screens 11-26: Pattern-Based Conversion

Based on the patterns identified, here are conversion templates for common screen types:

#### **List/Table Screens (Screens 11-15, 17-18, etc.):**
- Follow Screen 6 pattern (table → card list)
- Convert wide tables to vertical card stacks
- Preserve all data in readable format
- Add filters/search at top
- Use bottom navigation for main navigation

#### **Detail/Form Screens (Screens 16, 19-23, etc.):**
- Follow Screen 9 pattern (collapsible sections)
- Convert multi-column forms to single column
- Use progressive disclosure for long forms
- Add sticky action buttons if needed
- Preserve all form fields and validation states

#### **Tab-Based Workspace Screens:**
- Follow Screen 10 pattern (tabs + cards)
- Use horizontal scrollable tabs
- Convert sidebar content to cards
- Stack cards vertically
- Preserve all tab content

#### **Chat/Messaging Screens:**
- Full-width message bubbles
- Input bar at bottom (sticky)
- Message list scrollable
- Timestamps and read receipts preserved
- Attachment handling (full-width cards)

#### **Settings/Profile Screens:**
- List-based navigation
- Section headers (H3, 18px)
- List items: 64px height minimum
- Dividers between sections
- Toggles and inputs full-width

---

## Conversion Checklist Template

For each screen conversion, verify:

- [ ] **Frame Setup:**
  - [ ] Mobile frame created (390×844px or 360×800px)
  - [ ] Named: `{Original Name} – Mobile`
  - [ ] Assigned to mobile design system

- [ ] **Layout:**
  - [ ] Multi-column → Single column
  - [ ] Sidebar → Bottom nav or drawer
  - [ ] Tables → Card lists
  - [ ] No horizontal scrolling

- [ ] **Typography:**
  - [ ] H1: 24-28px
  - [ ] H2: 20-22px
  - [ ] H3: 18-20px
  - [ ] Body: 14-16px (minimum 12-13px)
  - [ ] Line height: 1.3-1.5

- [ ] **Spacing:**
  - [ ] Horizontal padding: 16px minimum
  - [ ] Vertical spacing: 8px (small), 12-16px (normal), 24-32px (sections)
  - [ ] Touch targets: 44×44px minimum

- [ ] **Components:**
  - [ ] App bar consistent across screens
  - [ ] Bottom navigation (if applicable)
  - [ ] Cards use consistent styling
  - [ ] Buttons use design system styles

- [ ] **Content:**
  - [ ] No text overflow or clipping
  - [ ] All interactive elements accessible
  - [ ] Loading/empty/error states considered
  - [ ] Visual hierarchy maintained

- [ ] **Navigation:**
  - [ ] Back navigation available
  - [ ] Primary actions accessible
  - [ ] Bottom nav or drawer for main navigation
  - [ ] Prototype connections maintained

---

## Global Mobile Patterns

### Bottom Navigation Bar
- **Height:** 80px (including safe area)
- **Background:** White
- **Border:** Top border 1px `#e5e7eb`
- **Tabs:** 3-5 items maximum
- **Active State:** `#0a3d62` background, white icon/text
- **Inactive State:** `#6b7280` icon/text
- **Badges:** Red badge (`#c0392b`) for notifications

### Bottom Sheets
- **Height:** 60-90% of screen (draggable)
- **Background:** White
- **Header:** Title + Close button (or drag handle)
- **Content:** Scrollable list
- **Footer (optional):** Primary action button

### Full-Screen Modals
- **Background:** White
- **App Bar:** Back button + Title + Action button
- **Content:** Scrollable, 16px padding horizontal

### Cards
- **Width:** Full width minus 32px (16px padding each side)
- **Padding:** 16px
- **Border Radius:** 8-12px
- **Shadow:** Subtle elevation
- **Spacing:** 12-16px between cards

### Lists
- **Item Height:** 64-72px minimum
- **Padding:** 16px horizontal, 12-16px vertical
- **Divider:** 1px `#e5e7eb` between items
- **Touch Feedback:** Highlight on tap

---

## Next Steps

1. **In Figma:**
   - Create a new page: "Mobile Designs"
   - Create mobile frame template (390×844px)
   - Duplicate for each screen conversion
   - Apply mobile design system styles

2. **For Each Screen:**
   - Follow the conversion guide above
   - Use Auto Layout for vertical stacking
   - Test with different content lengths
   - Ensure no clipping or overflow

3. **Component Library:**
   - Create reusable mobile components:
     - AppBar
     - BottomNav
     - Card
     - ListItem
     - BottomSheet
     - SearchBar
     - Button (Primary, Secondary, Icon)

4. **Prototyping:**
   - Connect mobile screens with prototype flows
   - Add transitions (slide, fade)
   - Test navigation patterns

---

## Notes

- All mobile frames should use the mobile design system defined in `mobile_design_system.md`
- Maintain visual identity (colors, typography) from desktop
- Optimize for touch interactions
- Consider thumb zones for primary actions
- Test on actual device sizes (360px, 390px, 428px widths)

# Mobile Design System - AutoLex Local Lawyer App

## Overview
This document defines the mobile design system extracted from the desktop Figma designs and optimized for mobile (390x844 iPhone 13/14 viewport).

## Base Frame Template
- **Width:** 390px (iPhone 13/14 standard)
- **Height:** 844px+ (with vertical scrolling enabled)
- **Safe Area:** 16px horizontal padding minimum
- **Status Bar:** 44px height (iOS) / 24px (Android) - account for in designs

## Color Palette

### Primary Colors
- **Primary Blue:** `#0a3d62` (Main brand color, used for primary actions and selected states)
- **Secondary Blue:** `#117a8b` (Used for badges and secondary elements)
- **Accent Blue:** `#2b7fff` (Used for active states and links)

### Status Colors
- **Success/Completed:** `#00c950` (Green - completed hearings)
- **Warning/Adjourned:** `#f0b100` (Yellow/Orange - adjourned hearings)
- **Error/Cancelled:** `#c0392b` or `#fb2c36` (Red - cancelled hearings)
- **Info/Scheduled:** `#2b7fff` (Blue - scheduled hearings)

### Neutral Colors
- **Background:** `#f5f7fa` (Light grey background)
- **Surface/White:** `#ffffff` (Card backgrounds)
- **Border:** `#e5e7eb` (Grey-200 - borders and dividers)
- **Text Primary:** `#1a1d21` (Dark grey - main text)
- **Text Secondary:** `#6b7280` (Grey-500 - secondary text)
- **Text Tertiary:** `#9ca3af` (Grey-400 - placeholder text)

### Badge Colors
- **Primary Badge:** `#117a8b` (Blue badges)
- **Notification Badge:** `#c0392b` (Red notification badges)
- **Warning Badge:** `#f4b400` (Orange/yellow badges)

## Typography Scale (Mobile-Optimized)

### Headings
- **H1:** 28px / 36px line-height (Mobile: 24-28px)
  - Font: Lora SemiBold (or Inter SemiBold fallback)
  - Usage: Page titles, major headings
  - Example: "Hello, Kumar! 👋"

- **H2:** 22px / 28px line-height (Mobile: 20-22px)
  - Font: Inter SemiBold
  - Usage: Section headings, card titles

- **H3:** 18px / 24px line-height (Mobile: 18-20px)
  - Font: Inter Medium
  - Usage: Subsection headings

### Body Text
- **Body Large:** 16px / 24px line-height
  - Font: Inter Regular
  - Usage: Primary body text, descriptions

- **Body:** 14px / 20px line-height (Mobile: 14-16px)
  - Font: Inter Regular
  - Usage: Standard body text, form labels

- **Body Small:** 12px / 16px line-height (Mobile: 12-13px minimum)
  - Font: Inter Regular
  - Usage: Captions, timestamps, helper text

### Special
- **Button Text:** 14px / 20px line-height
  - Font: Inter Medium
  - Usage: Button labels

- **Badge Text:** 10-12px / 16px line-height
  - Font: Inter Medium
  - Usage: Badge numbers, small labels

## Spacing System (8px Grid)

### Vertical Spacing
- **XS:** 4px - Tight spacing between related elements
- **S:** 8px - Small gaps, icon-to-text spacing
- **M:** 12px - Standard spacing between elements
- **L:** 16px - Comfortable spacing, section gaps
- **XL:** 24px - Large gaps between major sections
- **XXL:** 32px - Extra large gaps, page-level spacing

### Horizontal Spacing
- **Screen Padding:** 16px (minimum) - Side margins for all screens
- **Card Padding:** 16-24px - Internal card padding
- **Element Gap:** 8-12px - Spacing between form elements

## Border Radius
- **Small:** 6px - Buttons, small cards, inputs
- **Medium:** 8px - Standard cards, containers
- **Large:** 12px - Large cards, modals
- **Pill:** 33554400px (full) - Badges, avatars

## Shadows & Elevation
- **Card Shadow:** Subtle shadow for cards (elevation 1-2)
- **Modal Shadow:** Stronger shadow for modals (elevation 8-12)

## Component Specifications

### Buttons

#### Primary Button
- **Height:** 48px (minimum touch target)
- **Padding:** 16px horizontal
- **Background:** `#0a3d62`
- **Text Color:** White
- **Font:** Inter Medium, 14px
- **Border Radius:** 6px
- **Min Width:** 120px

#### Secondary Button
- **Height:** 48px
- **Padding:** 16px horizontal
- **Background:** `#f5f7fa`
- **Border:** 1px solid `#e5e7eb`
- **Text Color:** `#1a1d21`
- **Font:** Inter Medium, 14px
- **Border Radius:** 6px

#### Icon Button
- **Size:** 44x44px (minimum touch target)
- **Background:** Transparent or `#f5f7fa`
- **Border Radius:** 6px or 8px

### Input Fields
- **Height:** 48px (minimum for touch)
- **Padding:** 12-16px horizontal
- **Border:** 1px solid `#e5e7eb`
- **Border Radius:** 6px
- **Background:** White
- **Font:** Inter Regular, 14px
- **Placeholder:** `#9ca3af`

### Cards
- **Padding:** 16-24px
- **Background:** White
- **Border:** 1px solid `#e5e7eb` (optional)
- **Border Radius:** 8-12px
- **Shadow:** Subtle elevation

### Badges
- **Height:** 20-22px
- **Padding:** 4-8px horizontal
- **Border Radius:** 6px
- **Font:** Inter Medium, 10-12px
- **Background:** Status color or `#117a8b`

### Navigation

#### App Bar
- **Height:** 56px (iOS) / 64px (Android with status bar)
- **Background:** White
- **Border:** Bottom border 1px `#e5e7eb`
- **Padding:** 16px horizontal

#### Bottom Navigation
- **Height:** 80px (including safe area)
- **Background:** White
- **Border:** Top border 1px `#e5e7eb`
- **Icon Size:** 24px
- **Text Size:** 12px

#### Sidebar → Mobile Drawer
- **Width:** 280px (80% of screen width)
- **Background:** White
- **Overlay:** Semi-transparent dark overlay

## Mobile-Specific Patterns

### List Items
- **Height:** 64-72px (comfortable touch target)
- **Padding:** 16px horizontal, 12-16px vertical
- **Divider:** 1px `#e5e7eb` between items

### Calendar View → Mobile
- **Day Cells:** Full width, stacked vertically
- **Day Header:** Sticky header with day name and date
- **Hearing Cards:** Full-width cards within day sections
- **Navigation:** Swipe gestures for month navigation

### Tables → Mobile Cards
- Convert wide tables to card-based lists
- Each row becomes a card
- Key information at top, secondary info below
- Actions as icon buttons on the right

### Forms
- **Full-width inputs** (within 16px padding)
- **Stacked vertically** (no side-by-side on mobile)
- **Section headings** for grouped fields
- **Sticky submit button** at bottom if form is long

## Status Indicators

### Hearing Status Colors
- **Scheduled:** Left border `#2b7fff` (4px width)
- **Completed:** Left border `#00c950` (4px width)
- **Adjourned:** Left border `#f0b100` (4px width)
- **Cancelled:** Left border `#fb2c36` (4px width)

## Icons
- **Size:** 16px (standard), 24px (larger), 32px (featured)
- **Color:** Inherit from parent or use `#1a1d21` for default
- **Style:** Line icons, consistent stroke width

## Responsive Breakpoints
- **Mobile:** 360-428px width (primary target)
- **Tablet:** 768px+ (future consideration)

## Accessibility
- **Minimum touch target:** 44x44px (iOS) / 48x48px (Android)
- **Text contrast:** WCAG AA compliant (4.5:1 for body, 3:1 for large text)
- **Focus states:** Visible focus indicators for all interactive elements


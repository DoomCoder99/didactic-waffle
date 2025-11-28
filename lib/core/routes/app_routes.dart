/// App route names
/// Maps Figma screen names to Flutter route names
class AppRoutes {
  AppRoutes._();

  // Main Navigation
  static const String home = '/';
  static const String hearings = '/hearings';
  static const String cases = '/cases';
  static const String chat = '/chat';

  // Case Detail
  static const String caseDetail = '/case-detail/:caseId';
  static const String caseOverview = '/case-detail/:caseId/overview';
  static const String caseAssignees = '/case-detail/:caseId/assignees';
  static const String caseHearings = '/case-detail/:caseId/hearings';
  static const String caseChat = '/case-detail/:caseId/chat';
  static const String caseActivity = '/case-detail/:caseId/activity';

  // Profile & Settings
  static const String profile = '/profile';
  static const String profileEdit = '/profile/edit';
  static const String settings = '/settings';
  static const String settingsAccount = '/settings/account';
  static const String settingsNotifications = '/settings/notifications';
  static const String settingsDisplay = '/settings/display';
  static const String settingsPrivacy = '/settings/privacy';

  // Chat
  static const String chatConversation = '/chat/conversation';
  static const String chatNew = '/chat/new';

  // Hearing
  static const String hearingDetail = '/hearing/detail';
}


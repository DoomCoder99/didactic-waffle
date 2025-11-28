import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/theme/app_theme.dart';
import 'core/routes/app_routes.dart';
import 'modules/hearings/view/hearings_view.dart';
import 'modules/cases/view/cases_view.dart';
import 'modules/chat/view/chat_view.dart';
import 'modules/case_detail/view/case_detail_view.dart';
import 'modules/profile/view/profile_view.dart';
import 'modules/profile/view/profile_edit_view.dart';
import 'modules/settings/view/settings_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Local Lawyer App',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.hearings,
      getPages: [
        GetPage(
          name: AppRoutes.hearings,
          page: () => const HearingsView(),
        ),
        GetPage(
          name: AppRoutes.cases,
          page: () => const CasesView(),
        ),
        GetPage(
          name: AppRoutes.chat,
          page: () => const ChatView(),
        ),
        GetPage(
          name: AppRoutes.caseDetail,
          page: () => const CaseDetailView(),
        ),
        GetPage(
          name: AppRoutes.profile,
          page: () => const ProfileView(),
        ),
        GetPage(
          name: AppRoutes.profileEdit,
          page: () => const ProfileEditView(),
        ),
        GetPage(
          name: AppRoutes.settings,
          page: () => const SettingsView(),
        ),
      ],
    );
  }
}

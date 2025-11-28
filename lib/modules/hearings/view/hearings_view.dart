import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/spacing.dart';
import '../../../core/theme/typography.dart';
import '../../../widgets/common/app_bar_custom.dart';
import '../../../widgets/common/bottom_nav_bar.dart';
import '../../../widgets/common/card_custom.dart';
import '../../../widgets/common/badge_custom.dart';
import '../../../widgets/common/app_drawer.dart';
import '../../../widgets/common/search_modal.dart';
import '../../../widgets/common/notifications_drawer.dart';
import '../../../widgets/common/bottom_sheet_add_hearing.dart';
import '../controller/hearings_controller.dart';

/// My Hearings screen - Main dashboard
/// Based on mobile conversion guide Screen 1
class HearingsView extends StatelessWidget {
  const HearingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HearingsController());

    return Scaffold(
      backgroundColor: AppColors.background,
      drawer: const AppDrawer(),
      endDrawer: const NotificationsDrawer(),
      appBar: CustomAppBar(
        title: 'My Hearings',
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            AppDrawer.show(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              SearchModal.show(
                context: context,
                hintText: 'Search hearings...',
                onSearch: (query) {
                  // TODO: Implement search logic
                },
              );
            },
          ),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_outlined),
                onPressed: () {
                  NotificationsDrawer.show(context);
                },
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: AppColors.badgeNotification,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Obx(() => controller.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : _buildContent(controller)),
      bottomNavigationBar: const BottomNavBar(currentIndex: 0),
    );
  }

  Widget _buildContent(HearingsController controller) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Greeting Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello, Kumar! 👋',
                  style: AppTypography.h1(),
                ),
                const SizedBox(height: AppSpacing.s),
                Text(
                  "Here's what's happening with your cases today",
                  style: AppTypography.body(color: AppColors.textSecondary),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.xl),

          // Stats Cards (Horizontal Scrollable)
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
              children: [
                _buildStatCard('Today', '1', Icons.calendar_today),
                const SizedBox(width: AppSpacing.m),
                _buildStatCard('Upcoming', '2', Icons.upcoming),
                const SizedBox(width: AppSpacing.m),
                _buildStatCard('Overdue Prep', '1', Icons.warning_amber),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.xl),

          // Info Banner
          CustomCard(
            padding: const EdgeInsets.all(AppSpacing.l),
            child: Row(
              children: [
                const Icon(Icons.info_outline, color: AppColors.info, size: 20),
                const SizedBox(width: AppSpacing.m),
                Expanded(
                  child: Text(
                    'You can add hearings for cases assigned to you. Hearings help track important dates.',
                    style: AppTypography.body(color: AppColors.textSecondary),
                  ),
                ),
              ],
            ),
          ),

          // View Toggle & Search
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: SegmentedButton<String>(
                        segments: const [
                          ButtonSegment(
                            value: 'list',
                            label: Text('List'),
                            icon: Icon(Icons.list),
                          ),
                          ButtonSegment(
                            value: 'calendar',
                            label: Text('Calendar'),
                            icon: Icon(Icons.calendar_month),
                          ),
                        ],
                        selected: {controller.selectedView.value},
                        onSelectionChanged: (Set<String> newSelection) {
                          if (newSelection.isNotEmpty) {
                            controller.selectedView.value = newSelection.first;
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.m),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search hearings...',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.filter_list),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.download),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.l),

          // Hearings List
          Obx(() => controller.selectedView.value == 'list'
              ? _buildHearingsList(controller)
              : _buildCalendarView(controller)),
        ],
      ),
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon) {
    return CustomCard(
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.all(AppSpacing.l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: AppColors.textSecondary),
              const SizedBox(width: AppSpacing.s),
              Text(label, style: AppTypography.caption()),
            ],
          ),
          const SizedBox(height: AppSpacing.s),
          Text(
            value,
            style: AppTypography.h1(),
          ),
        ],
      ),
    );
  }

  Widget _buildHearingsList(HearingsController controller) {
    if (controller.hearings.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(AppSpacing.xxl),
        child: Center(
          child: Column(
            children: [
              Icon(Icons.calendar_today_outlined,
                  size: 64, color: AppColors.textTertiary),
              const SizedBox(height: AppSpacing.l),
              Text(
                'No hearings scheduled',
                style: AppTypography.h3(),
              ),
              const SizedBox(height: AppSpacing.s),
              Text(
                'Add your first hearing',
                style: AppTypography.body(color: AppColors.textSecondary),
              ),
            ],
          ),
        ),
      );
    }

    return Builder(
      builder: (listContext) => Column(
        children: controller.hearings.asMap().entries.map((entry) {
          final hearing = entry.value;
          return CustomCard(
            key: ValueKey(hearing['id'] ?? entry.key),
            onTap: () {
              // Show hearing detail in bottom sheet
              AddHearingBottomSheetHelper.show(
                context: listContext,
                hearingData: hearing,
              );
            },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      hearing['caseId'] ?? '',
                      style: AppTypography.h4(),
                    ),
                  ),
                  CustomBadge(
                    text: hearing['status']?.toUpperCase() ?? 'SCHEDULED',
                    backgroundColor: _getStatusColor(hearing['status']),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.s),
              Row(
                children: [
                  Icon(Icons.access_time,
                      size: 16, color: AppColors.textSecondary),
                  const SizedBox(width: AppSpacing.xs),
                  Text(
                    '${hearing['date']} at ${hearing['time']}',
                    style: AppTypography.bodySmall(),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                hearing['type'] ?? '',
                style: AppTypography.body(color: AppColors.textSecondary),
              ),
            ],
          ),
        );
      }).toList(),
      ),
    );
  }

  Widget _buildCalendarView(HearingsController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
      child: Text(
        'Calendar view coming soon',
        style: AppTypography.body(color: AppColors.textSecondary),
      ),
    );
  }

  Color _getStatusColor(String? status) {
    switch (status) {
      case 'scheduled':
        return AppColors.hearingScheduled;
      case 'completed':
        return AppColors.hearingCompleted;
      case 'adjourned':
        return AppColors.hearingAdjourned;
      case 'cancelled':
        return AppColors.hearingCancelled;
      default:
        return AppColors.info;
    }
  }
}


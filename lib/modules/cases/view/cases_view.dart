import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/spacing.dart';
import '../../../core/theme/typography.dart';
import '../../../widgets/common/app_bar_custom.dart';
import '../../../widgets/common/bottom_nav_bar.dart';
import '../../../widgets/common/card_custom.dart';
import '../../../widgets/common/badge_custom.dart';
import '../../../widgets/common/context_menu.dart';
import '../controller/cases_controller.dart';

/// My Cases screen - Cases list
/// Based on mobile conversion guide Screen 6
class CasesView extends StatelessWidget {
  const CasesView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CasesController());

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        title: 'My Cases',
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_outlined),
                onPressed: () {},
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
      bottomNavigationBar: const BottomNavBar(currentIndex: 1),
    );
  }

  Widget _buildContent(CasesController controller) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Page Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.folder, color: AppColors.primaryBlue),
                    const SizedBox(width: AppSpacing.s),
                    Text('My Cases', style: AppTypography.h1()),
                  ],
                ),
                const SizedBox(height: AppSpacing.s),
                CustomBadge(text: 'Mumbai', backgroundColor: AppColors.badgePrimary),
                const SizedBox(height: AppSpacing.s),
                Text(
                  'Cases assigned to you by Central Lawyer',
                  style: AppTypography.body(color: AppColors.textSecondary),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.xl),

          // Alert Banner
          CustomCard(
            padding: const EdgeInsets.all(AppSpacing.l),
            child: Row(
              children: [
                const Icon(Icons.info_outline, color: AppColors.info, size: 20),
                const SizedBox(width: AppSpacing.m),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Verify your email to receive case updates',
                        style: AppTypography.body(),
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Verify Email'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Tabs
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
            child: SegmentedButton<String>(
              segments: const [
                ButtonSegment(
                  value: 'open',
                  label: Text('Open Cases'),
                ),
                ButtonSegment(
                  value: 'closed',
                  label: Text('Closed Cases'),
                ),
              ],
                        selected: {controller.selectedTab.value},
                        onSelectionChanged: (Set<String> newSelection) {
                          if (newSelection.isNotEmpty) {
                            controller.switchTab(newSelection.first);
                          }
                        },
            ),
          ),
          const SizedBox(height: AppSpacing.l),

          // Search & Filters
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Search cases...',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
                const SizedBox(height: AppSpacing.m),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.filter_list),
                        label: const Text('Filters'),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.m),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.download),
                        label: const Text('Export'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.l),

          // Cases List
          Obx(() => Builder(
            builder: (context) => _buildCasesList(controller, context),
          )),
        ],
      ),
    );
  }

  Widget _buildCasesList(CasesController controller, BuildContext context) {
    if (controller.cases.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(AppSpacing.xxl),
        child: Center(
          child: Column(
            children: [
              Icon(Icons.folder_outlined,
                  size: 64, color: AppColors.textTertiary),
              const SizedBox(height: AppSpacing.l),
              Text('No cases found', style: AppTypography.h3()),
              const SizedBox(height: AppSpacing.s),
              Text(
                'Try adjusting your filters',
                style: AppTypography.body(color: AppColors.textSecondary),
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      children: controller.cases.asMap().entries.map((entry) {
        final caseData = entry.value;
        return CustomCard(
          key: ValueKey(caseData['id'] ?? entry.key),
          onTap: () {
            Get.toNamed('/case-detail/${caseData['id']}');
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Case Number + Status
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      caseData['caseId'] ?? '',
                      style: AppTypography.h4(),
                    ),
                  ),
                  CustomBadge(
                    text: caseData['status'] ?? 'UNKNOWN',
                    backgroundColor: AppColors.badgePrimary,
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.s),
              // Claimant Info
              Text(
                '${caseData['claimant']} (${caseData['age']}, ${caseData['gender']})',
                style: AppTypography.body(),
              ),
              const SizedBox(height: AppSpacing.xs),
              // GIC
              Text(
                caseData['gic'] ?? '',
                style: AppTypography.bodySmall(),
              ),
              const SizedBox(height: AppSpacing.xs),
              // Priority + Next Hearing
              Row(
                children: [
                  CustomBadge(
                    text: 'HIGH PRIORITY',
                    backgroundColor: AppColors.badgeWarning,
                    fontSize: 10,
                  ),
                  const SizedBox(width: AppSpacing.s),
                  Icon(Icons.calendar_today,
                      size: 14, color: AppColors.textSecondary),
                  const SizedBox(width: AppSpacing.xs),
                  Text(
                    'Next: ${caseData['nextHearing']}',
                    style: AppTypography.bodySmall(),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.xs),
              // Court
              Text(
                caseData['court'] ?? '',
                style: AppTypography.bodySmall(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: AppSpacing.s),
              // Actions
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {
                    ContextMenu.showBottomSheet(
                      context: context,
                      title: 'Case Actions',
                      items: [
                        ContextMenuItem(
                          label: 'View Details',
                          icon: Icons.visibility,
                          onTap: () {
                            Get.toNamed('/case-detail/${caseData['id']}');
                          },
                        ),
                        ContextMenuItem(
                          label: 'Share Case',
                          icon: Icons.share,
                          onTap: () {
                            // TODO: Share case
                          },
                        ),
                        ContextMenuItem(
                          label: 'Export Case',
                          icon: Icons.download,
                          onTap: () {
                            // TODO: Export case
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/spacing.dart';
import '../../../core/theme/typography.dart';
import '../../../widgets/common/app_bar_custom.dart';
import '../../../widgets/common/card_custom.dart';
import '../../../widgets/common/badge_custom.dart';
import '../../../widgets/common/context_menu.dart';
import '../controller/case_detail_controller.dart';
import 'tabs/case_overview_tab.dart';
import 'tabs/case_assignees_tab.dart';
import 'tabs/case_hearings_tab.dart';
import 'tabs/case_chat_tab.dart';
import 'tabs/case_activity_tab.dart';

/// Case Detail screen with tabs
/// Based on mobile conversion guide Screens 9-15
class CaseDetailView extends StatelessWidget {
  const CaseDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CaseDetailController());

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        title: controller.caseData['caseId']?.toString() ?? 'Case Detail',
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              ContextMenu.showBottomSheet(
                context: context,
                title: 'Case Actions',
                items: [
                  ContextMenuItem(
                    label: 'Edit Case',
                    icon: Icons.edit,
                    onTap: () {
                      // TODO: Navigate to edit case
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
                  ContextMenuItem(
                    label: 'Delete Case',
                    icon: Icons.delete,
                    isDestructive: true,
                    onTap: () {
                      // TODO: Show delete confirmation
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
      body: Obx(() => controller.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : _buildContent(controller)),
    );
  }

  Widget _buildContent(CaseDetailController controller) {
    return Column(
      children: [
        // Case Header
        _buildCaseHeader(controller),
        
        // Alert Banner (if read-only)
        Obx(() => controller.isReadOnly.value ? _buildReadOnlyBanner() : const SizedBox.shrink()),
        
        // Tabs
        _buildTabs(controller),
        
        // Tab Content
        Expanded(
          child: Obx(() => _buildTabContent(controller)),
        ),
      ],
    );
  }

  Widget _buildCaseHeader(CaseDetailController controller) {
    return Container(
      color: AppColors.surface,
      padding: const EdgeInsets.all(AppSpacing.screenPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  controller.caseData['caseId']?.toString() ?? '',
                  style: AppTypography.h1(),
                ),
              ),
              CustomBadge(
                text: controller.caseData['status']?.toString() ?? 'UNKNOWN',
                backgroundColor: AppColors.badgePrimary,
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.s),
          Text(
            controller.caseData['title']?.toString() ?? '',
            style: AppTypography.body(),
          ),
          const SizedBox(height: AppSpacing.m),
          _buildInfoRow('GIC:', controller.caseData['gic']?.toString() ?? ''),
          const SizedBox(height: AppSpacing.xs),
          _buildInfoRow('Court:', controller.caseData['court']?.toString() ?? ''),
          const SizedBox(height: AppSpacing.xs),
          _buildInfoRow('Advocate:', controller.caseData['advocate']?.toString() ?? ''),
          const SizedBox(height: AppSpacing.xs),
          _buildInfoRow('Claim Amount:', controller.caseData['claimAmount']?.toString() ?? ''),
          const SizedBox(height: AppSpacing.s),
          Text(
            controller.caseData['lastUpdated']?.toString() ?? '',
            style: AppTypography.caption(),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          child: Text(
            label,
            style: AppTypography.body(color: AppColors.textSecondary),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: AppTypography.body(),
          ),
        ),
      ],
    );
  }

  Widget _buildReadOnlyBanner() {
    return CustomCard(
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenPadding,
        vertical: AppSpacing.s,
      ),
      padding: const EdgeInsets.all(AppSpacing.l),
      backgroundColor: AppColors.info.withValues(alpha: 0.1),
      child: Row(
        children: [
          const Icon(Icons.info_outline, color: AppColors.info, size: 20),
          const SizedBox(width: AppSpacing.m),
          Expanded(
            child: Text(
              'You have read-only access to this case. You can view all information but cannot make changes.',
              style: AppTypography.body(color: AppColors.textSecondary),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabs(CaseDetailController controller) {
    return Container(
      color: AppColors.surface,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
        child: Obx(() => Row(
          children: List.generate(
            controller.tabs.length,
            (index) => _buildTabButton(controller, index),
            growable: false,
          ),
        )),
      ),
    );
  }

  Widget _buildTabButton(CaseDetailController controller, int index) {
    final isSelected = controller.selectedTab.value == index;
    return GestureDetector(
      onTap: () => controller.switchTab(index),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.l,
          vertical: AppSpacing.m,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? AppColors.primaryBlue : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Text(
          controller.tabs[index],
          style: isSelected
              ? AppTypography.body(color: AppColors.primaryBlue)
              : AppTypography.body(color: AppColors.textSecondary),
        ),
      ),
    );
  }

  Widget _buildTabContent(CaseDetailController controller) {
    switch (controller.selectedTab.value) {
      case 0:
        return const CaseOverviewTab();
      case 1:
        return const CaseAssigneesTab();
      case 2:
        return const CaseHearingsTab();
      case 3:
        return const CaseChatTab();
      case 4:
        return const CaseActivityTab();
      default:
        return const CaseOverviewTab();
    }
  }
}


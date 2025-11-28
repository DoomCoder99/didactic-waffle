import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/spacing.dart' show AppSpacing, AppRadius;
import '../../../core/theme/typography.dart';
import '../../../widgets/common/app_bar_custom.dart';
import '../../../widgets/common/bottom_nav_bar.dart';
import '../../../widgets/common/card_custom.dart';
import '../../../widgets/common/badge_custom.dart';

/// My Chat screen - Conversations list
/// Based on mobile conversion guide Screen 22
class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        title: 'My Conversations',
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          ElevatedButton.icon(
            onPressed: () {
              // Show bottom sheet to select case for new conversation
              showModalBottomSheet(
                context: context,
                builder: (context) => Container(
                  padding: const EdgeInsets.all(AppSpacing.l),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Select a case to start conversation', style: AppTypography.h3()),
                      const SizedBox(height: AppSpacing.l),
                      // TODO: Show list of cases
                      Text('Case list coming soon', style: AppTypography.body()),
                      const SizedBox(height: AppSpacing.l),
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel'),
                      ),
                    ],
                  ),
                ),
              );
            },
            icon: const Icon(Icons.add, size: 18),
            label: const Text('New Chat'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.m,
                vertical: AppSpacing.s,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.l),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Alert Banner
            CustomCard(
              padding: const EdgeInsets.all(AppSpacing.l),
              child: Row(
                children: [
                  const Icon(Icons.info_outline, color: AppColors.info, size: 20),
                  const SizedBox(width: AppSpacing.m),
                  Expanded(
                    child: Text(
                      'You can chat about cases assigned to you. All conversations are case-scoped.',
                      style: AppTypography.body(color: AppColors.textSecondary),
                    ),
                  ),
                ],
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
                      hintText: 'Search conversations, cases...',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.m),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildFilterChip('All Cases', true, '3'),
                        const SizedBox(width: AppSpacing.s),
                        _buildFilterChip('Unread', false),
                        const SizedBox(width: AppSpacing.s),
                        _buildFilterChip('Archived', false),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.l),

            // Conversations List
            _buildConversationsList(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 2),
    );
  }

  Widget _buildFilterChip(String label, bool selected, [String? badge]) {
    return FilterChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label),
          if (badge != null) ...[
            const SizedBox(width: AppSpacing.xs),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 2,
              ),
              decoration: BoxDecoration(
                color: selected ? AppColors.surface : AppColors.badgeNotification,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                badge,
                style: AppTypography.badge(
                  color: selected ? AppColors.badgeNotification : AppColors.surface,
                ).copyWith(fontSize: 10),
              ),
            ),
          ],
        ],
      ),
      selected: selected,
      onSelected: (value) {},
    );
  }

  Widget _buildConversationsList() {
    // Mock conversations
    final conversations = [
      {
        'caseId': 'MAC/2024/001',
        'claimant': 'Rajesh Sharma',
        'lastMessage': 'Adv. Priya Sharma: Please prepare the evidence documents',
        'date': '9 Jan',
        'status': 'UNDER_TRIAL',
        'unread': false,
      },
      {
        'caseId': 'MAC/2024/002',
        'claimant': 'Priya Patel',
        'lastMessage': 'You: Medical reports have been collected',
        'date': '9 Jan',
        'status': 'EVIDENCE_COLLECTION',
        'unread': true,
      },
    ];

    return Column(
      children: conversations.asMap().entries.map((entry) {
        final conv = entry.value;
        return CustomCard(
          key: ValueKey(conv['caseId'] ?? entry.key),
          onTap: () {
            // Navigate to case detail chat tab
            Get.toNamed('/case-detail/${conv['caseId']}');
            // TODO: Switch to chat tab in case detail
          },
          child: Row(
            children: [
              // Avatar
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppRadius.pill),
                ),
                child: Center(
                  child: Text(
                    (conv['claimant']?.toString().length ?? 0) >= 2
                        ? conv['claimant'].toString().substring(0, 2).toUpperCase()
                        : 'NA',
                    style: AppTypography.body(
                      color: AppColors.primaryBlue,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.m),
              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const Icon(Icons.gavel,
                                  size: 12, color: AppColors.textSecondary),
                              const SizedBox(width: AppSpacing.xs),
                              Expanded(
                                child: Text(
                                  conv['caseId']?.toString() ?? '',
                                  style: AppTypography.body(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          conv['date']?.toString() ?? '',
                          style: AppTypography.bodySmall(),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      conv['claimant']?.toString() ?? '',
                      style: AppTypography.bodySmall(),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      conv['lastMessage']?.toString() ?? '',
                      style: AppTypography.bodySmall(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Row(
                      children: [
                        if (conv['unread'] == true)
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: AppColors.badgeNotification,
                              shape: BoxShape.circle,
                            ),
                          ),
                        if (conv['unread'] == true)
                          const SizedBox(width: AppSpacing.xs),
                        CustomBadge(
                          text: conv['status']?.toString() ?? '',
                          backgroundColor: AppColors.badgePrimary,
                          fontSize: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}



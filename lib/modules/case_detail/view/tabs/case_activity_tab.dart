import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/typography.dart';
import '../../../../widgets/common/card_custom.dart';
import '../../../../widgets/common/badge_custom.dart';

/// Case Activity Tab
/// Based on mobile conversion guide Screen 15
class CaseActivityTab extends StatelessWidget {
  const CaseActivityTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.l),
      child: Column(
        children: [
          _buildActivityItem(
            key: const ValueKey('activity_1'),
            icon: Icons.update,
            iconColor: AppColors.info,
            title: 'Case progress updated',
            description: 'Status changed to Under Trial',
            date: '9/1/2025',
            time: '10:30 am',
            actor: 'Adv. Rajesh Kumar',
            role: 'Local Lawyer',
          ),
          _buildActivityItem(
            key: const ValueKey('activity_2'),
            icon: Icons.calendar_today,
            iconColor: AppColors.info,
            title: 'Hearing scheduled',
            description: 'Next hearing on 15 Jan 2025 at 10:30 AM',
            date: '8/1/2025',
            time: '02:20 pm',
            actor: 'Adv. Rajesh Kumar',
            role: 'Local Lawyer',
          ),
          _buildActivityItem(
            key: const ValueKey('activity_3'),
            icon: Icons.upload_file,
            iconColor: AppColors.success,
            title: 'Document uploaded',
            description: 'Medical report uploaded',
            date: '7/1/2025',
            time: '09:15 am',
            actor: 'Adv. Rajesh Kumar',
            role: 'Local Lawyer',
          ),
          _buildActivityItem(
            key: const ValueKey('activity_4'),
            icon: Icons.chat_bubble_outline,
            iconColor: AppColors.info,
            title: 'Chat message sent',
            description: 'Message sent in case chat',
            date: '6/1/2025',
            time: '04:45 pm',
            actor: 'Adv. Priya Sharma',
            role: 'Central Lawyer',
          ),
          _buildActivityItem(
            key: const ValueKey('activity_5'),
            icon: Icons.person_add,
            iconColor: AppColors.info,
            title: 'Case assigned',
            description: 'Case assigned to Adv. Rajesh Kumar',
            date: '12/1/2024',
            time: '11:00 am',
            actor: 'Adv. Priya Sharma',
            role: 'Central Lawyer',
          ),
        ],
      ),
    );
  }

  Widget _buildActivityItem({
    Key? key,
    required IconData icon,
    required Color iconColor,
    required String title,
    required String description,
    required String date,
    required String time,
    required String actor,
    required String role,
  }) {
    return CustomCard(
      key: key,
      padding: const EdgeInsets.all(AppSpacing.l),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: AppSpacing.m),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title, style: AppTypography.body()),
                          const SizedBox(height: AppSpacing.xs),
                          Text(
                            description,
                            style: AppTypography.bodySmall(),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(date, style: AppTypography.bodySmall()),
                        Text(time, style: AppTypography.bodySmall()),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.s),
                Row(
                  children: [
                    CustomBadge(
                      text: actor,
                      backgroundColor: AppColors.badgePrimary,
                      fontSize: 10,
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    CustomBadge(
                      text: role,
                      backgroundColor: AppColors.badgeWarning,
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
  }
}


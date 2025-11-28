import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart' show AppSpacing;
import '../../../../core/theme/typography.dart';
import '../../../../widgets/common/card_custom.dart';
import '../../../../widgets/common/badge_custom.dart';

/// Case Assignees Tab
/// Based on mobile conversion guide Screen 10
class CaseAssigneesTab extends StatelessWidget {
  const CaseAssigneesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.l),
      child: Column(
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
                    'Case assignments are managed by your Central Lawyer',
                    style: AppTypography.body(color: AppColors.textSecondary),
                  ),
                ),
              ],
            ),
          ),

          // Central Lawyer Card
          _buildAssigneeCard(
            name: 'Adv. Priya Sharma',
            role: 'Central Lawyer',
            email: 'priya.sharma@example.com',
            avatar: 'APS',
            isCentralLawyer: true,
          ),

          // Local Lawyer Card (You)
          _buildAssigneeCard(
            name: 'Adv. Rajesh Kumar',
            role: 'Local Lawyer',
            email: 'rajesh.kumar@example.com',
            avatar: 'ARK',
            isLocalLawyer: true,
            isYou: true,
            additionalInfo: [
              _buildInfoRow(Icons.location_on, 'Mumbai, Maharashtra'),
              _buildInfoRow(Icons.gavel, 'D/1234/2015'),
              _buildInfoRow(Icons.calendar_today, 'Assigned: 12/01/2024'),
            ],
          ),

          // GIC Information Card
          CustomCard(
            padding: const EdgeInsets.all(AppSpacing.l),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('GIC Information', style: AppTypography.h3()),
                const SizedBox(height: AppSpacing.m),
                _buildInfoRowWithLabel(Icons.business, 'GIC Name', 'National Insurance Company Ltd.'),
                const SizedBox(height: AppSpacing.s),
                _buildInfoRowWithLabel(Icons.business_center, 'Insurance Company', 'National Insurance Company Ltd.'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAssigneeCard({
    required String name,
    required String role,
    required String email,
    required String avatar,
    bool isCentralLawyer = false,
    bool isLocalLawyer = false,
    bool isYou = false,
    List<Widget>? additionalInfo,
  }) {
    return CustomCard(
      padding: const EdgeInsets.all(AppSpacing.l),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: AppColors.primaryBlue.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(32),
            ),
            child: Center(
              child: Text(
                avatar,
                style: AppTypography.h3(color: AppColors.primaryBlue),
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
                  children: [
                    Expanded(
                      child: Text(name, style: AppTypography.h3()),
                    ),
                    if (isYou)
                      CustomBadge(
                        text: 'You',
                        backgroundColor: AppColors.badgePrimary,
                        fontSize: 10,
                      ),
                  ],
                ),
                const SizedBox(height: AppSpacing.xs),
                CustomBadge(
                  text: role,
                  backgroundColor: isCentralLawyer
                      ? AppColors.badgePrimary
                      : AppColors.badgeWarning,
                ),
                const SizedBox(height: AppSpacing.s),
                Row(
                  children: [
                    const Icon(Icons.email, size: 16, color: AppColors.textSecondary),
                    const SizedBox(width: AppSpacing.xs),
                    Expanded(
                      child: Text(
                        email,
                        style: AppTypography.bodySmall(),
                      ),
                    ),
                  ],
                ),
                if (additionalInfo != null) ...[
                  const SizedBox(height: AppSpacing.s),
                  ...additionalInfo,
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.xs),
      child: Row(
        children: [
          Icon(icon, size: 16, color: AppColors.textSecondary),
          const SizedBox(width: AppSpacing.xs),
          Expanded(
            child: Text(
              value,
              style: AppTypography.bodySmall(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRowWithLabel(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.xs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 16, color: AppColors.textSecondary),
          const SizedBox(width: AppSpacing.xs),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: AppTypography.bodySmall(color: AppColors.textSecondary),
                ),
                Text(
                  value,
                  style: AppTypography.body(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


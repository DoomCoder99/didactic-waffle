import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/typography.dart';
import '../../../../widgets/common/card_custom.dart';
import '../../../../widgets/common/badge_custom.dart';
import '../../../../widgets/common/bottom_sheet_add_hearing.dart';
import '../../../../widgets/common/context_menu.dart';

/// Case Hearings Tab
/// Based on mobile conversion guide Screen 11
class CaseHearingsTab extends StatelessWidget {
  const CaseHearingsTab({super.key});

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
                    'You can add hearings for cases assigned to you. Hearings help track important dates.',
                    style: AppTypography.body(color: AppColors.textSecondary),
                  ),
                ),
              ],
            ),
          ),

          // Add Hearing Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
            child: SizedBox(
              width: double.infinity,
              child: Builder(
                builder: (buttonContext) => ElevatedButton.icon(
                  onPressed: () async {
                    final result = await AddHearingBottomSheetHelper.show(
                      context: buttonContext,
                    );
                    if (result != null && buttonContext.mounted) {
                      // TODO: Refresh hearings list
                      ScaffoldMessenger.of(buttonContext).showSnackBar(
                        const SnackBar(content: Text('Hearing added successfully')),
                      );
                    }
                  },
                  icon: const Icon(Icons.add, size: 20),
                  label: const Text('Add Hearing'),
                ),
              ),
            ),
          ),

          const SizedBox(height: AppSpacing.l),

          // Hearings List
          _buildHearingsList(),
        ],
      ),
    );
  }

  Widget _buildHearingsList() {
    // Mock hearings data
    final hearings = [
      {
        'id': '1',
        'type': 'Arguments Hearing',
        'date': '15 Jan 2025',
        'time': '10:30 AM',
        'status': 'scheduled',
        'location': 'Court Room 3',
      },
      {
        'id': '2',
        'type': 'Evidence Hearing',
        'date': '20 Jan 2025',
        'time': '11:00 AM',
        'status': 'scheduled',
        'location': 'Court Room 5',
      },
    ];

    if (hearings.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(AppSpacing.xxl),
        child: Center(
          child: Column(
            children: [
              Icon(Icons.calendar_today_outlined,
                  size: 64, color: AppColors.textTertiary),
              const SizedBox(height: AppSpacing.l),
              Text('No hearings scheduled', style: AppTypography.h3()),
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
        children: hearings.asMap().entries.map((entry) {
          final hearing = entry.value;
          return CustomCard(
            key: ValueKey(hearing['id'] ?? entry.key),
            onTap: () async {
              final result = await AddHearingBottomSheetHelper.show(
                context: listContext,
                hearingData: hearing,
              );
              if (result != null && listContext.mounted) {
                // TODO: Refresh hearings list
                ScaffoldMessenger.of(listContext).showSnackBar(
                  const SnackBar(content: Text('Hearing updated successfully')),
                );
              }
            },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      hearing['type']?.toString() ?? '',
                      style: AppTypography.h4(),
                    ),
                  ),
                  CustomBadge(
                    text: hearing['status']?.toString().toUpperCase() ?? 'SCHEDULED',
                    backgroundColor: _getStatusColor(hearing['status']?.toString()),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.s),
              Row(
                children: [
                  Icon(Icons.calendar_today,
                      size: 16, color: AppColors.textSecondary),
                  const SizedBox(width: AppSpacing.xs),
                  Text(
                    '${hearing['date']} at ${hearing['time']}',
                    style: AppTypography.bodySmall(),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.xs),
              Row(
                children: [
                  Icon(Icons.location_on,
                      size: 16, color: AppColors.textSecondary),
                  const SizedBox(width: AppSpacing.xs),
                  Text(
                    hearing['location']?.toString() ?? '',
                    style: AppTypography.bodySmall(),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.s),
              Align(
                alignment: Alignment.centerRight,
                child: Builder(
                  builder: (buttonContext) => IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {
                      ContextMenu.showBottomSheet(
                        context: buttonContext,
                        title: 'Hearing Actions',
                        items: [
                          ContextMenuItem(
                            label: 'Edit Hearing',
                            icon: Icons.edit,
                            onTap: () async {
                              final result = await AddHearingBottomSheetHelper.show(
                                context: buttonContext,
                                hearingData: hearing,
                              );
                              if (result != null && buttonContext.mounted) {
                                // TODO: Refresh hearings list
                              }
                            },
                          ),
                          ContextMenuItem(
                            label: 'Delete Hearing',
                            icon: Icons.delete,
                            isDestructive: true,
                            onTap: () {
                              // TODO: Show delete confirmation
                              if (buttonContext.mounted) {
                                ScaffoldMessenger.of(buttonContext).showSnackBar(
                                  const SnackBar(content: Text('Hearing deleted')),
                                );
                              }
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
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


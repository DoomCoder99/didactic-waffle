import 'package:flutter/material.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/spacing.dart' show AppSpacing;
import '../../core/theme/typography.dart';
import 'card_custom.dart';
import 'badge_custom.dart';

/// Notifications drawer widget
class NotificationsDrawer extends StatelessWidget {
  const NotificationsDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock notifications
    final notifications = [
      {
        'id': '1',
        'title': 'New case assigned',
        'message': 'Case MAC/2024/001 has been assigned to you',
        'time': '2 hours ago',
        'isRead': false,
        'type': 'case',
      },
      {
        'id': '2',
        'title': 'Hearing reminder',
        'message': 'You have a hearing scheduled tomorrow at 10:30 AM',
        'time': '5 hours ago',
        'isRead': false,
        'type': 'hearing',
      },
      {
        'id': '3',
        'title': 'New message',
        'message': 'You received a new message from Adv. Priya Sharma',
        'time': '1 day ago',
        'isRead': true,
        'type': 'chat',
      },
    ];

    return Drawer(
      backgroundColor: AppColors.surface,
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.l,
              AppSpacing.xxl,
              AppSpacing.l,
              AppSpacing.l,
            ),
            decoration: const BoxDecoration(
              color: AppColors.primaryBlue,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Notifications',
                    style: AppTypography.h2(color: AppColors.surface),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: AppColors.surface),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          // Notifications List
          Expanded(
            child: notifications.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.notifications_none,
                            size: 64, color: AppColors.textTertiary),
                        const SizedBox(height: AppSpacing.l),
                        Text(
                          'No notifications',
                          style: AppTypography.h3(),
                        ),
                        const SizedBox(height: AppSpacing.s),
                        Text(
                          'You\'re all caught up!',
                          style: AppTypography.body(color: AppColors.textSecondary),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(AppSpacing.l),
                    itemCount: notifications.length,
                    itemBuilder: (context, index) {
                      if (index >= notifications.length) {
                        return const SizedBox.shrink();
                      }
                      final notification = notifications[index];
                      return CustomCard(
                        key: ValueKey(notification['id'] ?? index),
                        margin: const EdgeInsets.only(bottom: AppSpacing.m),
                        padding: const EdgeInsets.all(AppSpacing.l),
                        backgroundColor: notification['isRead'] == false
                            ? AppColors.primaryBlue.withValues(alpha: 0.05)
                            : null,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    notification['title']?.toString() ?? '',
                                    style: notification['isRead'] == false
                                        ? AppTypography.body().copyWith(fontWeight: FontWeight.bold)
                                        : AppTypography.body(),
                                  ),
                                ),
                                if (notification['isRead'] == false)
                                  CustomBadge(
                                    text: 'New',
                                    backgroundColor: AppColors.badgeNotification,
                                    fontSize: 10,
                                  ),
                              ],
                            ),
                            const SizedBox(height: AppSpacing.xs),
                            Text(
                              notification['message']?.toString() ?? '',
                              style: AppTypography.bodySmall(),
                            ),
                            const SizedBox(height: AppSpacing.xs),
                            Text(
                              notification['time']?.toString() ?? '',
                              style: AppTypography.caption(),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
          // Mark all as read button
          if (notifications.any((n) => n['isRead'] == false))
            Container(
              padding: const EdgeInsets.all(AppSpacing.l),
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: AppColors.border)),
              ),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    // TODO: Mark all as read via API
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('All notifications marked as read')),
                    );
                  },
                  child: const Text('Mark all as read'),
                ),
              ),
            ),
        ],
      ),
    );
  }

  static void show(BuildContext context) {
    Scaffold.of(context).openEndDrawer();
  }
}


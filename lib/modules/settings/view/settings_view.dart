import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/spacing.dart' show AppSpacing;
import '../../../core/theme/typography.dart';
import '../../../widgets/common/app_bar_custom.dart';
import '../../../widgets/common/card_custom.dart';
import 'change_password_view.dart';

/// Settings View screen
/// Based on mobile conversion guide Screen 18
class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        title: 'Settings',
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.l),
        child: Column(
          children: [
            // Account Settings Section
            _buildSection(
              'Account Settings',
              [
                _buildSettingTile(
                  icon: Icons.person_outline,
                  title: 'Profile',
                  subtitle: 'Manage your profile information',
                  onTap: () => Get.toNamed('/profile'),
                ),
                _buildSettingTile(
                  icon: Icons.lock_outline,
                  title: 'Change Password',
                  subtitle: 'Update your account password',
                  onTap: () {
                    Get.to(() => const ChangePasswordView());
                  },
                ),
                _buildSettingTile(
                  icon: Icons.security,
                  title: 'Two-Factor Authentication',
                  subtitle: 'Enable 2FA for extra security',
                  trailing: Switch(
                    value: true,
                    onChanged: (value) {},
                  ),
                  onTap: () {
                    Get.snackbar('Info', '2FA settings coming soon');
                  },
                ),
              ],
            ),

            // Notification Settings Section
            _buildSection(
              'Notifications',
              [
                _buildSettingTile(
                  icon: Icons.notifications_outlined,
                  title: 'Push Notifications',
                  subtitle: 'Receive push notifications',
                  trailing: Switch(
                    value: true,
                    onChanged: (value) {},
                  ),
                  onTap: () {},
                ),
                _buildSettingTile(
                  icon: Icons.email_outlined,
                  title: 'Email Notifications',
                  subtitle: 'Receive email notifications',
                  trailing: Switch(
                    value: true,
                    onChanged: (value) {},
                  ),
                  onTap: () {},
                ),
                _buildSettingTile(
                  icon: Icons.calendar_today_outlined,
                  title: 'Hearing Reminders',
                  subtitle: 'Get reminders for upcoming hearings',
                  trailing: Switch(
                    value: true,
                    onChanged: (value) {},
                  ),
                  onTap: () {},
                ),
              ],
            ),

            // Privacy & Security Section
            _buildSection(
              'Privacy & Security',
              [
                _buildSettingTile(
                  icon: Icons.devices,
                  title: 'Active Devices',
                  subtitle: 'Manage devices signed into your account',
                  onTap: () {
                    Get.snackbar('Info', 'Active devices view coming soon');
                  },
                ),
                _buildSettingTile(
                  icon: Icons.history,
                  title: 'Login History',
                  subtitle: 'View your account login history',
                  onTap: () {
                    Get.snackbar('Info', 'Login history view coming soon');
                  },
                ),
                _buildSettingTile(
                  icon: Icons.privacy_tip_outlined,
                  title: 'Privacy Policy',
                  subtitle: 'Read our privacy policy',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Privacy Policy'),
                        content: const SingleChildScrollView(
                          child: Text(
                            'Privacy Policy\n\n'
                            'Last updated: January 2025\n\n'
                            'This privacy policy describes how AutoLex Local Lawyer App collects, uses, and protects your personal information.\n\n'
                            'We are committed to protecting your privacy and ensuring the security of your data.',
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Close'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),

            // App Settings Section
            _buildSection(
              'App Settings',
              [
                _buildSettingTile(
                  icon: Icons.language,
                  title: 'Language',
                  subtitle: 'English',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Select Language'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              title: const Text('English'),
                              leading: const Icon(Icons.check),
                              onTap: () {
                                Navigator.pop(context);
                                Get.snackbar('Success', 'Language changed to English');
                              },
                            ),
                            ListTile(
                              title: const Text('Hindi'),
                              onTap: () {
                                Navigator.pop(context);
                                Get.snackbar('Success', 'Language changed to Hindi');
                              },
                            ),
                            ListTile(
                              title: const Text('Marathi'),
                              onTap: () {
                                Navigator.pop(context);
                                Get.snackbar('Success', 'Language changed to Marathi');
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                _buildSettingTile(
                  icon: Icons.dark_mode_outlined,
                  title: 'Theme',
                  subtitle: 'Light',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Select Theme'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              title: const Text('Light'),
                              leading: const Icon(Icons.check),
                              onTap: () {
                                Navigator.pop(context);
                                Get.snackbar('Success', 'Theme changed to Light');
                              },
                            ),
                            ListTile(
                              title: const Text('Dark'),
                              onTap: () {
                                Navigator.pop(context);
                                Get.snackbar('Info', 'Dark theme coming soon');
                              },
                            ),
                            ListTile(
                              title: const Text('System Default'),
                              onTap: () {
                                Navigator.pop(context);
                                Get.snackbar('Info', 'System theme coming soon');
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                _buildSettingTile(
                  icon: Icons.info_outline,
                  title: 'About',
                  subtitle: 'App version and information',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('About'),
                        content: const Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('AutoLex Local Lawyer App'),
                            SizedBox(height: 8),
                            Text('Version: 1.0.0'),
                            SizedBox(height: 8),
                            Text('Build: 2025.01.15'),
                            SizedBox(height: 16),
                            Text('A mobile app for local lawyers to manage cases, hearings, and communications.'),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Close'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),

            // Danger Zone
            _buildSection(
              'Danger Zone',
              [
                _buildSettingTile(
                  icon: Icons.logout,
                  title: 'Sign Out',
                  subtitle: 'Sign out from your account',
                  iconColor: AppColors.error,
                  textColor: AppColors.error,
                  onTap: () {
                    _showSignOutDialog(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.screenPadding,
            vertical: AppSpacing.m,
          ),
          child: Text(
            title,
            style: AppTypography.h4(color: AppColors.textSecondary),
          ),
        ),
        CustomCard(
          padding: EdgeInsets.zero,
          child: Column(
            children: children,
          ),
        ),
        const SizedBox(height: AppSpacing.l),
      ],
    );
  }

  Widget _buildSettingTile({
    required IconData icon,
    required String title,
    String? subtitle,
    Widget? trailing,
    Color? iconColor,
    Color? textColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.l,
          vertical: AppSpacing.m,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: iconColor ?? AppColors.primaryBlue,
              size: 24,
            ),
            const SizedBox(width: AppSpacing.m),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTypography.body(color: textColor),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      subtitle,
                      style: AppTypography.bodySmall(color: AppColors.textSecondary),
                    ),
                  ],
                ],
              ),
            ),
            if (trailing != null) ...[
              const SizedBox(width: AppSpacing.m),
              trailing,
            ] else ...[
              Icon(
                Icons.chevron_right,
                color: AppColors.textTertiary,
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _showSignOutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sign Out'),
        content: const Text('Are you sure you want to sign out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // TODO: Clear user session and navigate to login
              Get.snackbar('Success', 'Signed out successfully');
              // Get.offAllNamed('/login'); // Uncomment when login screen is ready
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
            ),
            child: const Text('Sign Out'),
          ),
        ],
      ),
    );
  }
}


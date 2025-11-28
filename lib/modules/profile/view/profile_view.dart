import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/spacing.dart' show AppSpacing, AppRadius;
import '../../../core/theme/typography.dart';
import '../../../widgets/common/app_bar_custom.dart';
import '../../../widgets/common/card_custom.dart';
import '../../../widgets/common/badge_custom.dart';
import '../../../core/routes/app_routes.dart';
import '../controller/profile_controller.dart';

/// Profile View screen
/// Based on mobile conversion guide Screen 16
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        title: 'Profile',
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              Get.toNamed(AppRoutes.settings);
            },
          ),
          TextButton(
            onPressed: () {
              Get.toNamed('/profile/edit');
            },
            child: const Text('Edit'),
          ),
        ],
      ),
      body: Obx(() => controller.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : _buildContent(controller)),
    );
  }

  Widget _buildContent(ProfileController controller) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.l),
      child: Column(
        children: [
          // Profile Header
          _buildProfileHeader(controller),
          const SizedBox(height: AppSpacing.xl),

          // Personal Information Card
          _buildPersonalInfoCard(controller),
          
          // Professional Information Card
          _buildProfessionalInfoCard(controller),
          
          // Contact Information Card
          _buildContactInfoCard(controller),
          
          // Coverage & Availability Card
          _buildCoverageCard(controller),
        ],
      ),
    );
  }

  Widget _buildProfileHeader(ProfileController controller) {
    return Container(
      color: AppColors.surface,
      padding: const EdgeInsets.all(AppSpacing.screenPadding),
      child: Column(
        children: [
          // Avatar
          Container(
            width: 96,
            height: 96,
            decoration: BoxDecoration(
              color: AppColors.primaryBlue.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                    (controller.profileData['name']?.toString().length ?? 0) >= 2
                        ? controller.profileData['name']?.toString().substring(0, 2).toUpperCase() ?? 'RK'
                        : 'RK',
                style: AppTypography.h1(color: AppColors.primaryBlue),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.m),
          // Name
          Text(
            controller.profileData['name']?.toString() ?? '',
            style: AppTypography.h1(),
          ),
          const SizedBox(height: AppSpacing.s),
          // Badges
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomBadge(
                text: controller.profileData['role']?.toString() ?? 'Local Lawyer',
                backgroundColor: AppColors.badgePrimary,
              ),
              const SizedBox(width: AppSpacing.s),
              if (controller.profileData['twoFactorEnabled'] == true)
                CustomBadge(
                  text: '2FA Enabled',
                  backgroundColor: AppColors.success,
                ),
            ],
          ),
          const SizedBox(height: AppSpacing.l),
          // Stats Row (Horizontal Scrollable)
          SizedBox(
            height: 80,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
              children: [
                _buildStatItem(
                  Icons.login,
                  'Last login',
                  controller.profileData['lastLogin']?.toString() ?? '',
                ),
                const SizedBox(width: AppSpacing.m),
                _buildStatItem(
                  Icons.devices,
                  'Active devices',
                  controller.profileData['activeDevices']?.toString() ?? '',
                ),
                const SizedBox(width: AppSpacing.m),
                _buildStatItem(
                  Icons.lock,
                  'Password changed',
                  controller.profileData['passwordChanged']?.toString() ?? '',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String label, String value) {
    return Container(
      width: 120,
      padding: const EdgeInsets.all(AppSpacing.m),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(AppRadius.medium),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: AppColors.textSecondary),
              const SizedBox(width: AppSpacing.xs),
              Expanded(
                child: Text(
                  label,
                  style: AppTypography.caption(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            value,
            style: AppTypography.bodySmall(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildPersonalInfoCard(ProfileController controller) {
    return CustomCard(
      padding: const EdgeInsets.all(AppSpacing.l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Personal Information', style: AppTypography.h3()),
          const SizedBox(height: AppSpacing.m),
          _buildInfoRow('Bar Council Number', controller.profileData['barCouncilNumber']?.toString() ?? ''),
          const SizedBox(height: AppSpacing.s),
          _buildInfoRow('Year of Enrollment', controller.profileData['yearOfEnrollment']?.toString() ?? ''),
          const SizedBox(height: AppSpacing.s),
          _buildInfoRow('Years of Experience', controller.profileData['yearsOfExperience']?.toString() ?? ''),
        ],
      ),
    );
  }

  Widget _buildProfessionalInfoCard(ProfileController controller) {
    final otherCourts = controller.profileData['otherCourts'] as List<dynamic>? ?? [];
    final specializations = controller.profileData['specializations'] as List<dynamic>? ?? [];
    final languages = controller.profileData['languages'] as List<dynamic>? ?? [];

    return CustomCard(
      padding: const EdgeInsets.all(AppSpacing.l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.work_outline, size: 20, color: AppColors.primaryBlue),
              const SizedBox(width: AppSpacing.s),
              Text('Professional Information', style: AppTypography.h3()),
            ],
          ),
          const SizedBox(height: AppSpacing.m),
          _buildInfoRow('Primary Court', controller.profileData['primaryCourt']?.toString() ?? ''),
          const SizedBox(height: AppSpacing.s),
          _buildInfoRowWithChips('Other Courts', otherCourts.map((e) => e.toString()).toList()),
          const SizedBox(height: AppSpacing.s),
          _buildInfoRowWithChips('Specializations', specializations.map((e) => e.toString()).toList()),
          const SizedBox(height: AppSpacing.s),
          Row(
            children: [
              const Icon(Icons.language, size: 16, color: AppColors.textSecondary),
              const SizedBox(width: AppSpacing.xs),
              Text('Languages', style: AppTypography.bodySmall(color: AppColors.textSecondary)),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          Wrap(
            spacing: AppSpacing.xs,
            runSpacing: AppSpacing.xs,
            children: languages.map((lang) {
              return CustomBadge(
                key: ValueKey(lang?.toString()),
                text: lang?.toString() ?? '',
                backgroundColor: AppColors.badgePrimary,
                fontSize: 10,
              );
            }).toList(),
          ),
          const SizedBox(height: AppSpacing.s),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.location_on, size: 16, color: AppColors.textSecondary),
              const SizedBox(width: AppSpacing.xs),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Chamber/Office Address', style: AppTypography.bodySmall(color: AppColors.textSecondary)),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      controller.profileData['chamberAddress']?.toString() ?? '',
                      style: AppTypography.body(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfoCard(ProfileController controller) {
    return CustomCard(
      padding: const EdgeInsets.all(AppSpacing.l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Contact Information', style: AppTypography.h3()),
          const SizedBox(height: AppSpacing.m),
          _buildContactRow(Icons.email, 'Primary Email', controller.profileData['primaryEmail']?.toString() ?? ''),
          const SizedBox(height: AppSpacing.s),
          _buildContactRow(Icons.email_outlined, 'Alternate Email', controller.profileData['alternateEmail']?.toString() ?? ''),
          const SizedBox(height: AppSpacing.s),
          _buildContactRow(Icons.phone, 'Phone Number', controller.profileData['phoneNumber']?.toString() ?? ''),
        ],
      ),
    );
  }

  Widget _buildCoverageCard(ProfileController controller) {
    return CustomCard(
      padding: const EdgeInsets.all(AppSpacing.l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Coverage & Availability', style: AppTypography.h3()),
          const SizedBox(height: AppSpacing.m),
          _buildInfoRow('Coverage Areas', controller.profileData['coverageAreas']?.toString() ?? ''),
          const SizedBox(height: AppSpacing.s),
          _buildInfoRow('Working Hours', controller.profileData['workingHours']?.toString() ?? ''),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTypography.bodySmall(color: AppColors.textSecondary)),
        const SizedBox(height: AppSpacing.xs),
        Text(value, style: AppTypography.body()),
      ],
    );
  }

  Widget _buildInfoRowWithChips(String label, List<String> values) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTypography.bodySmall(color: AppColors.textSecondary)),
        const SizedBox(height: AppSpacing.xs),
        Wrap(
          spacing: AppSpacing.xs,
          runSpacing: AppSpacing.xs,
          children: values.map((value) {
            return CustomBadge(
              key: ValueKey(value),
              text: value,
              backgroundColor: AppColors.badgePrimary,
              fontSize: 10,
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildContactRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: AppColors.textSecondary),
        const SizedBox(width: AppSpacing.xs),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: AppTypography.bodySmall(color: AppColors.textSecondary)),
              const SizedBox(height: AppSpacing.xs),
              Text(value, style: AppTypography.body()),
            ],
          ),
        ),
      ],
    );
  }
}


import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart' show AppSpacing, AppRadius;
import '../../../../core/theme/typography.dart';
import '../../../../widgets/common/card_custom.dart';
import '../../../../widgets/common/badge_custom.dart';

/// Case Overview Tab
/// Based on mobile conversion guide Screen 9
class CaseOverviewTab extends StatefulWidget {
  const CaseOverviewTab({super.key});

  @override
  State<CaseOverviewTab> createState() => _CaseOverviewTabState();
}

class _CaseOverviewTabState extends State<CaseOverviewTab> {
  final Map<String, bool> _expandedSections = {
    'claimInfo': false,
    'policy': false,
    'vehicle': false,
    'accident': false,
    'hospital': false,
    'claimant': false,
  };

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Info Banner
          CustomCard(
            padding: const EdgeInsets.all(AppSpacing.l),
            child: Row(
              children: [
                const Icon(Icons.lightbulb_outline, color: AppColors.warning, size: 20),
                const SizedBox(width: AppSpacing.m),
                Expanded(
                  child: Text(
                    'Central Lawyer has suggestions for some fields. Review and accept or provide your own suggestions.',
                    style: AppTypography.body(color: AppColors.textSecondary),
                  ),
                ),
              ],
            ),
          ),

          // Collapsible Sections
          _buildCollapsibleSection(
            'claimInfo',
            'Claim Information',
            Icons.description_outlined,
            _buildClaimInfoFields(),
          ),
          _buildCollapsibleSection(
            'policy',
            'Policy Related',
            Icons.policy_outlined,
            _buildPolicyFields(),
            hasSuggestions: true,
          ),
          _buildCollapsibleSection(
            'vehicle',
            'Vehicle',
            Icons.directions_car_outlined,
            _buildVehicleFields(),
          ),
          _buildCollapsibleSection(
            'accident',
            'Accident',
            Icons.warning_amber_outlined,
            _buildAccidentFields(),
          ),
          _buildCollapsibleSection(
            'hospital',
            'Hospital',
            Icons.local_hospital_outlined,
            _buildHospitalFields(),
          ),
          _buildCollapsibleSection(
            'claimant',
            'Claimant Information',
            Icons.person_outline,
            _buildClaimantFields(),
          ),
        ],
      ),
    );
  }

  Widget _buildCollapsibleSection(
    String sectionKey,
    String title,
    IconData icon,
    Widget content, {
    bool hasSuggestions = false,
  }) {
    final isExpanded = _expandedSections[sectionKey] ?? false;
    
    return CustomCard(
      key: ValueKey(sectionKey),
      margin: const EdgeInsets.only(bottom: AppSpacing.m),
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _expandedSections[sectionKey] = !isExpanded;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.l),
              child: Row(
                children: [
                  Icon(icon, color: AppColors.primaryBlue, size: 20),
                  const SizedBox(width: AppSpacing.m),
                  Expanded(
                    child: Text(title, style: AppTypography.h3()),
                  ),
                  if (hasSuggestions)
                    CustomBadge(
                      text: 'Has Suggestions',
                      backgroundColor: AppColors.warning,
                      fontSize: 10,
                    ),
                  const SizedBox(width: AppSpacing.s),
                  Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: AppColors.textSecondary,
                  ),
                ],
              ),
            ),
          ),
          if (isExpanded)
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.l,
                0,
                AppSpacing.l,
                AppSpacing.l,
              ),
              child: content,
            ),
        ],
      ),
    );
  }

  Widget _buildClaimInfoFields() {
    return Column(
      children: [
        _buildFormField('Case Number', 'MAC/2024/001'),
        const SizedBox(height: AppSpacing.m),
        _buildFormField('Claim Date', '15/01/2024'),
        const SizedBox(height: AppSpacing.m),
        _buildFormField('Filing Date', '20/01/2024'),
      ],
    );
  }

  Widget _buildPolicyFields() {
    return Column(
      children: [
        _buildSuggestionField(
          'Policy Number',
          'Master Value: POL-12345',
          'Your Suggested Value: POL-12345',
        ),
        const SizedBox(height: AppSpacing.m),
        _buildFormField('Policy Type', 'Comprehensive'),
        const SizedBox(height: AppSpacing.m),
        _buildFormField('Policy Start Date', '01/01/2023'),
        const SizedBox(height: AppSpacing.m),
        _buildFormField('Policy End Date', '31/12/2023'),
      ],
    );
  }

  Widget _buildVehicleFields() {
    return Column(
      children: [
        _buildFormField('Vehicle Number', 'MH-01-AB-1234'),
        const SizedBox(height: AppSpacing.m),
        _buildFormField('Vehicle Make', 'Maruti Suzuki'),
        const SizedBox(height: AppSpacing.m),
        _buildFormField('Vehicle Model', 'Swift'),
        const SizedBox(height: AppSpacing.m),
        _buildFormField('Year of Manufacture', '2020'),
      ],
    );
  }

  Widget _buildAccidentFields() {
    return Column(
      children: [
        _buildFormField('Accident Date', '10/12/2023'),
        const SizedBox(height: AppSpacing.m),
        _buildFormField('Accident Time', '14:30'),
        const SizedBox(height: AppSpacing.m),
        _buildFormField('Accident Location', 'Mumbai-Pune Highway, Near Khopoli'),
        const SizedBox(height: AppSpacing.m),
        _buildFormField('Accident Type', 'Rear-end collision'),
      ],
    );
  }

  Widget _buildHospitalFields() {
    return Column(
      children: [
        _buildFormField('Hospital Name', 'Apollo Hospital'),
        const SizedBox(height: AppSpacing.m),
        _buildFormField('Admission Date', '10/12/2023'),
        const SizedBox(height: AppSpacing.m),
        _buildFormField('Discharge Date', '15/12/2023'),
        const SizedBox(height: AppSpacing.m),
        _buildFormField('Treatment Duration', '5 days'),
      ],
    );
  }

  Widget _buildClaimantFields() {
    return Column(
      children: [
        _buildFormField('Full Name', 'Rajesh Sharma'),
        const SizedBox(height: AppSpacing.m),
        _buildFormField('Age', '35'),
        const SizedBox(height: AppSpacing.m),
        _buildFormField('Gender', 'Male'),
        const SizedBox(height: AppSpacing.m),
        _buildFormField('Address', '123, Main Street, Mumbai - 400001'),
        const SizedBox(height: AppSpacing.m),
        _buildFormField('Phone', '+91 98765 43210'),
        const SizedBox(height: AppSpacing.m),
        _buildFormField('Email', 'rajesh.sharma@example.com'),
      ],
    );
  }

  Widget _buildFormField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.bodySmall(color: AppColors.textSecondary),
        ),
        const SizedBox(height: AppSpacing.xs),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.m),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(AppRadius.small),
            border: Border.all(color: AppColors.border),
          ),
          child: Text(
            value,
            style: AppTypography.body(),
          ),
        ),
      ],
    );
  }

  Widget _buildSuggestionField(
    String label,
    String masterValue,
    String suggestedValue,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: AppTypography.bodySmall(color: AppColors.textSecondary),
            ),
            const SizedBox(width: AppSpacing.xs),
            CustomBadge(
              text: 'CL Managed',
              backgroundColor: AppColors.badgePrimary,
              fontSize: 10,
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.xs),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.m),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(AppRadius.small),
            border: Border.all(color: AppColors.border),
          ),
          child: Text(
            masterValue,
            style: AppTypography.body(color: AppColors.textSecondary),
          ),
        ),
        const SizedBox(height: AppSpacing.s),
        Text(
          suggestedValue,
          style: AppTypography.bodySmall(color: AppColors.warning),
        ),
      ],
    );
  }
}


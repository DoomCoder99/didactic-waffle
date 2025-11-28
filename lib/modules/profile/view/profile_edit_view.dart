import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/spacing.dart' show AppSpacing;
import '../../../core/theme/typography.dart';
import '../../../widgets/common/app_bar_custom.dart';
import '../../../widgets/common/card_custom.dart';
import '../controller/profile_controller.dart';

/// Profile Edit screen
/// Based on mobile conversion guide Screen 17
class ProfileEditView extends StatefulWidget {
  const ProfileEditView({super.key});

  @override
  State<ProfileEditView> createState() => _ProfileEditViewState();
}

class _ProfileEditViewState extends State<ProfileEditView> {
  final ImagePicker _imagePicker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  
  // TextEditingControllers - properly managed
  late TextEditingController _nameController;
  late TextEditingController _yearOfEnrollmentController;
  late TextEditingController _phoneController;
  late TextEditingController _alternateEmailController;
  late TextEditingController _yearsOfExperienceController;
  late TextEditingController _chamberAddressController;
  late TextEditingController _coverageAreasController;
  
  String? _selectedPrimaryCourt;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    final controller = Get.find<ProfileController>();
    _nameController = TextEditingController(text: controller.profileData['name']?.toString() ?? '');
    _yearOfEnrollmentController = TextEditingController(text: controller.profileData['yearOfEnrollment']?.toString() ?? '');
    _phoneController = TextEditingController(text: controller.profileData['phoneNumber']?.toString() ?? '');
    _alternateEmailController = TextEditingController(text: controller.profileData['alternateEmail']?.toString() ?? '');
    _yearsOfExperienceController = TextEditingController(text: controller.profileData['yearsOfExperience']?.toString() ?? '');
    _chamberAddressController = TextEditingController(text: controller.profileData['chamberAddress']?.toString() ?? '');
    _coverageAreasController = TextEditingController(text: controller.profileData['coverageAreas']?.toString() ?? '');
    _selectedPrimaryCourt = controller.profileData['primaryCourt']?.toString();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _yearOfEnrollmentController.dispose();
    _phoneController.dispose();
    _alternateEmailController.dispose();
    _yearsOfExperienceController.dispose();
    _chamberAddressController.dispose();
    _coverageAreasController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        title: 'Edit Profile',
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.l),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Profile Picture Section
              _buildProfilePictureSection(controller),
              
              // Personal Information Section
              _buildPersonalInfoSection(),
              
              // Professional Information Section
              _buildProfessionalInfoSection(),
              
              // Last Updated
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
                child: Text(
                  'Last updated on ${controller.profileData['lastLogin']?.toString() ?? 'N/A'}',
                  style: AppTypography.caption(),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(AppSpacing.l),
        decoration: const BoxDecoration(
          color: AppColors.surface,
          border: Border(top: BorderSide(color: AppColors.border)),
        ),
        child: SafeArea(
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: _isSaving ? null : () => Get.back(),
                  child: const Text('Cancel'),
                ),
              ),
              const SizedBox(width: AppSpacing.m),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: _isSaving ? null : () => _saveProfile(),
                  icon: _isSaving
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.save, size: 18),
                  label: Text(_isSaving ? 'Saving...' : 'Save Changes'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfilePictureSection(ProfileController controller) {
    return CustomCard(
      padding: const EdgeInsets.all(AppSpacing.l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Profile Picture', style: AppTypography.h3()),
          const SizedBox(height: AppSpacing.l),
          Row(
            children: [
              Container(
                width: 96,
                height: 96,
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    controller.profileData['name']?.toString().substring(0, 2).toUpperCase() ?? 'RK',
                    style: AppTypography.h1(color: AppColors.primaryBlue),
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.l),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () async {
                        try {
                          final XFile? image = await _imagePicker.pickImage(
                            source: ImageSource.gallery,
                            maxWidth: 1024,
                            maxHeight: 1024,
                            imageQuality: 85,
                          );
                          if (image != null) {
                            // TODO: Save image to profile via API
                            if (mounted) {
                              Get.snackbar('Success', 'Image selected successfully');
                            }
                          }
                        } catch (e) {
                          if (mounted) {
                            Get.snackbar('Error', 'Failed to pick image: ${e.toString()}');
                          }
                        }
                      },
                      icon: const Icon(Icons.camera_alt, size: 18),
                      label: const Text('Change Photo'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 36),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      'JPG, PNG or GIF. Max size 2MB.',
                      style: AppTypography.caption(),
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

  Widget _buildPersonalInfoSection() {
    return CustomCard(
      padding: const EdgeInsets.all(AppSpacing.l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Personal Information', style: AppTypography.h3()),
          const SizedBox(height: AppSpacing.l),
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Full Name *',
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter your full name';
              }
              if (value.trim().length < 2) {
                return 'Name must be at least 2 characters';
              }
              return null;
            },
          ),
          const SizedBox(height: AppSpacing.m),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: TextEditingController(
                    text: Get.find<ProfileController>().profileData['barCouncilNumber']?.toString() ?? '',
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Bar Council Number',
                  ),
                  enabled: false,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            'This field cannot be changed',
            style: AppTypography.caption(),
          ),
          const SizedBox(height: AppSpacing.m),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _yearOfEnrollmentController,
                  decoration: const InputDecoration(
                    labelText: 'Year of Enrollment',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      final year = int.tryParse(value);
                      if (year == null) {
                        return 'Please enter a valid year';
                      }
                      if (year < 1950 || year > DateTime.now().year) {
                        return 'Please enter a valid year';
                      }
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.m),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number *',
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your phone number';
                    }
                    if (value.trim().length < 10) {
                      return 'Please enter a valid phone number';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.m),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _alternateEmailController,
                  decoration: const InputDecoration(
                    labelText: 'Alternate Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      if (!value.contains('@') || !value.contains('.')) {
                        return 'Please enter a valid email address';
                      }
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProfessionalInfoSection() {
    return CustomCard(
      padding: const EdgeInsets.all(AppSpacing.l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Professional Information', style: AppTypography.h3()),
          const SizedBox(height: AppSpacing.l),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: 'Primary Court *',
            ),
            initialValue: _selectedPrimaryCourt,
            items: const [
              DropdownMenuItem(value: 'High Court', child: Text('High Court')),
              DropdownMenuItem(value: 'District Court', child: Text('District Court')),
              DropdownMenuItem(value: 'Sessions Court', child: Text('Sessions Court')),
            ],
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select a primary court';
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                _selectedPrimaryCourt = value;
              });
            },
          ),
          const SizedBox(height: AppSpacing.m),
          TextFormField(
            controller: _yearsOfExperienceController,
            decoration: const InputDecoration(
              labelText: 'Years of Experience',
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value != null && value.isNotEmpty) {
                final years = int.tryParse(value);
                if (years == null || years < 0 || years > 50) {
                  return 'Please enter a valid number of years';
                }
              }
              return null;
            },
          ),
          const SizedBox(height: AppSpacing.m),
          TextFormField(
            controller: _chamberAddressController,
            decoration: const InputDecoration(
              labelText: 'Chamber/Office Address',
            ),
            maxLines: 3,
            validator: (value) {
              if (value != null && value.isNotEmpty && value.trim().length < 10) {
                return 'Please enter a complete address';
              }
              return null;
            },
          ),
          const SizedBox(height: AppSpacing.m),
          TextFormField(
            controller: _coverageAreasController,
            decoration: const InputDecoration(
              labelText: 'Coverage Areas',
            ),
            validator: (value) {
              if (value != null && value.isNotEmpty && value.trim().length < 3) {
                return 'Please enter valid coverage areas';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Future<void> _saveProfile() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isSaving = true;
    });

    try {
      // TODO: Save changes via API
      await Future.delayed(const Duration(seconds: 1)); // Simulate API call
      
      // Update controller
      final controller = Get.find<ProfileController>();
      await controller.fetchProfile();
      
      if (mounted) {
        Get.snackbar('Success', 'Profile updated successfully');
        Get.back();
      }
    } catch (e) {
      if (mounted) {
        Get.snackbar('Error', 'Failed to update profile: ${e.toString()}');
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSaving = false;
        });
      }
    }
  }
}

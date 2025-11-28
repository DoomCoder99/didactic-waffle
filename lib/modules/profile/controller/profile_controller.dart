import 'package:get/get.dart';

/// Controller for Profile screen
/// Following GetX pattern from WDI standards
class ProfileController extends GetxController {
  var isLoading = false.obs;
  var profileData = {}.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProfile();
  }

  Future<void> fetchProfile() async {
    isLoading(true);
    try {
      await Future.delayed(const Duration(seconds: 1));
      // Mock data
      profileData.assignAll({
        'name': 'Rajesh Kumar',
        'role': 'Local Lawyer',
        'twoFactorEnabled': true,
        'lastLogin': '07 Nov 2025, 09:30 am',
        'activeDevices': 2,
        'passwordChanged': '15/10/2025',
        'barCouncilNumber': 'D/1234/2015',
        'yearOfEnrollment': '2015',
        'yearsOfExperience': '8 years',
        'primaryCourt': 'High Court',
        'otherCourts': ['District Court', 'Sessions Court'],
        'specializations': ['Civil', 'Property', 'Family'],
        'languages': ['English', 'Hindi', 'Marathi'],
        'chamberAddress': 'Chamber No. 45, High Court Building, Mumbai - 400001',
        'primaryEmail': 'rajesh.kumar@example.com',
        'alternateEmail': 'rajesh.alt@example.com',
        'phoneNumber': '+91 98765 43210',
        'coverageAreas': 'Mumbai, Thane, Navi Mumbai',
        'workingHours': 'Monday - Friday, 9:00 AM - 6:00 PM IST',
      });
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to load profile: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading(false);
    }
  }
}


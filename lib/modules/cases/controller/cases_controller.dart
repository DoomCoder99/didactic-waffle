import 'package:get/get.dart';

/// Controller for My Cases screen
/// Following GetX pattern from WDI standards
class CasesController extends GetxController {
  var isLoading = false.obs;
  var selectedTab = 'open'.obs; // 'open' or 'closed'
  var cases = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCases();
  }

  Future<void> fetchCases() async {
    isLoading(true);
    try {
      await Future.delayed(const Duration(seconds: 1));
      // Mock data
      cases.assignAll([
        {
          'id': '1',
          'caseId': 'case-ll-001',
          'claimant': 'Rajesh Sharma',
          'age': 35,
          'gender': 'Male',
          'gic': 'National Insurance Company Ltd.',
          'court': 'Motor Accident Claims Tribunal, Mumbai',
          'status': 'UNDER_TRIAL',
          'priority': 'high',
          'nextHearing': '2025-01-15',
          'assignedDate': '2024-12-01',
        },
      ]);
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to load cases: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading(false);
    }
  }

  void switchTab(String tab) {
    selectedTab.value = tab;
    fetchCases();
  }
}


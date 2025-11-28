import 'package:get/get.dart';

/// Controller for My Hearings screen
/// Following GetX pattern from WDI standards
class HearingsController extends GetxController {
  // Observable variables
  var isLoading = false.obs;
  var selectedView = 'list'.obs; // 'list' or 'calendar'
  var hearings = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetchHearings();
  }

  /// Fetch hearings list
  Future<void> fetchHearings() async {
    isLoading(true);
    try {
      // TODO: Replace with actual API call
      await Future.delayed(const Duration(seconds: 1));
      // Mock data
      hearings.assignAll([
        {
          'id': '1',
          'caseId': 'MAC/2024/001',
          'date': '2025-01-15',
          'time': '10:30 AM',
          'type': 'Arguments Hearing',
          'status': 'scheduled',
        },
        {
          'id': '2',
          'caseId': 'MAC/2024/002',
          'date': '2025-01-17',
          'time': '11:00 AM',
          'type': 'Evidence Hearing',
          'status': 'scheduled',
        },
      ]);
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to load hearings: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading(false);
    }
  }

  /// Toggle between list and calendar view
  void toggleView() {
    selectedView.value = selectedView.value == 'list' ? 'calendar' : 'list';
  }
}


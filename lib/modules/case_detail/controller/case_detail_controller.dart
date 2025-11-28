import 'package:get/get.dart';

/// Controller for Case Detail screen
/// Following GetX pattern from WDI standards
class CaseDetailController extends GetxController {
  // Observable variables
  var isLoading = false.obs;
  var selectedTab = 0.obs; // 0: Overview, 1: Assignees, 2: Hearings, 3: Chat, 4: Activity
  var caseData = {}.obs;
  var isReadOnly = true.obs;

  // Tab names
  final List<String> tabs = [
    'Overview',
    'Assignees',
    'Hearings',
    'Chat',
    'Activity',
  ];

  @override
  void onInit() {
    super.onInit();
    final caseId = Get.parameters['caseId'] ?? 'case-ll-001';
    fetchCaseDetail(caseId);
  }

  /// Fetch case detail
  Future<void> fetchCaseDetail(String caseId) async {
    isLoading(true);
    try {
      await Future.delayed(const Duration(seconds: 1));
      // Mock data
      caseData.assignAll({
        'id': caseId,
        'caseId': caseId,
        'title': 'Rajesh Sharma vs. National Insurance Company Ltd.',
        'status': 'UNDER_TRIAL',
        'gic': 'National Insurance Company Ltd.',
        'court': 'Motor Accident Claims Tribunal, Mumbai',
        'advocate': 'Adv. Rajesh Kumar',
        'claimAmount': '₹5,00,000',
        'lastUpdated': 'Last updated 18:11 (IST)',
        'isReadOnly': true,
      });
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to load case details: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading(false);
    }
  }

  /// Switch tab
  void switchTab(int index) {
    selectedTab.value = index;
  }
}


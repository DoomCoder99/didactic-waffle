import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/spacing.dart' show AppSpacing;
import '../../core/theme/typography.dart';

/// Bottom sheet for adding/editing a hearing
class AddHearingBottomSheet extends StatefulWidget {
  final Map<String, dynamic>? hearingData;

  const AddHearingBottomSheet({super.key, this.hearingData});

  @override
  State<AddHearingBottomSheet> createState() => _AddHearingBottomSheetState();
}

class _AddHearingBottomSheetState extends State<AddHearingBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _typeController;
  late TextEditingController _dateController;
  late TextEditingController _timeController;
  late TextEditingController _locationController;
  String _status = 'scheduled';

  @override
  void initState() {
    super.initState();
    _typeController = TextEditingController(text: widget.hearingData?['type'] ?? '');
    _dateController = TextEditingController(text: widget.hearingData?['date'] ?? '');
    _timeController = TextEditingController(text: widget.hearingData?['time'] ?? '');
    _locationController = TextEditingController(text: widget.hearingData?['location'] ?? '');
    _status = widget.hearingData?['status'] ?? 'scheduled';
  }

  @override
  void dispose() {
    _typeController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.hearingData != null;
    
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.l),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      isEdit ? 'Edit Hearing' : 'Add Hearing',
                      style: AppTypography.h2(),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Get.back(),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.l),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Hearing Type *',
                  ),
                  initialValue: _typeController.text.isEmpty ? null : _typeController.text,
                  items: const [
                    DropdownMenuItem(value: 'Arguments Hearing', child: Text('Arguments Hearing')),
                    DropdownMenuItem(value: 'Evidence Hearing', child: Text('Evidence Hearing')),
                    DropdownMenuItem(value: 'Final Hearing', child: Text('Final Hearing')),
                    DropdownMenuItem(value: 'Other', child: Text('Other')),
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a hearing type';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _typeController.text = value ?? '';
                    });
                  },
                ),
                const SizedBox(height: AppSpacing.m),
                TextFormField(
                  controller: _dateController,
                  decoration: const InputDecoration(
                    labelText: 'Date *',
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  readOnly: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a date';
                    }
                    return null;
                  },
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                    );
                    if (date != null && mounted) {
                      setState(() {
                        _dateController.text = '${date.day}/${date.month}/${date.year}';
                      });
                    }
                  },
                ),
                const SizedBox(height: AppSpacing.m),
                TextFormField(
                  controller: _timeController,
                  decoration: const InputDecoration(
                    labelText: 'Time *',
                    suffixIcon: Icon(Icons.access_time),
                  ),
                  readOnly: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a time';
                    }
                    return null;
                  },
                  onTap: () async {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (time != null && mounted) {
                      setState(() {
                        _timeController.text = time.format(context);
                      });
                    }
                  },
                ),
                const SizedBox(height: AppSpacing.m),
                TextFormField(
                  controller: _locationController,
                  decoration: const InputDecoration(
                    labelText: 'Location *',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter a location';
                    }
                    if (value.trim().length < 3) {
                      return 'Please enter a valid location';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: AppSpacing.m),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Status',
                  ),
                  initialValue: _status,
                  items: const [
                    DropdownMenuItem(value: 'scheduled', child: Text('Scheduled')),
                    DropdownMenuItem(value: 'completed', child: Text('Completed')),
                    DropdownMenuItem(value: 'adjourned', child: Text('Adjourned')),
                    DropdownMenuItem(value: 'cancelled', child: Text('Cancelled')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _status = value ?? 'scheduled';
                    });
                  },
                ),
                const SizedBox(height: AppSpacing.xl),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // TODO: Save hearing via API
                        Get.snackbar(
                          'Success',
                          isEdit ? 'Hearing updated successfully' : 'Hearing added successfully',
                        );
                        Get.back(result: {
                          'type': _typeController.text,
                          'date': _dateController.text,
                          'time': _timeController.text,
                          'location': _locationController.text,
                          'status': _status,
                        });
                      }
                    },
                    child: Text(isEdit ? 'Update Hearing' : 'Add Hearing'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}

/// Helper class for showing AddHearingBottomSheet
class AddHearingBottomSheetHelper {
  static Future<Map<String, dynamic>?> show({
    required BuildContext context,
    Map<String, dynamic>? hearingData,
  }) async {
    return await showModalBottomSheet<Map<String, dynamic>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) => AddHearingBottomSheet(hearingData: hearingData),
    );
  }
}


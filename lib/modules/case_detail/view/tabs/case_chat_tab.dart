import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart' show AppSpacing, AppRadius;
import '../../../../core/theme/typography.dart';

/// Case Chat Tab
/// Based on mobile conversion guide Screen 12
class CaseChatTab extends StatefulWidget {
  const CaseChatTab({super.key});

  @override
  State<CaseChatTab> createState() => _CaseChatTabState();
}

class _CaseChatTabState extends State<CaseChatTab> {
  final TextEditingController _messageController = TextEditingController();
  final List<String> _attachedFiles = [];

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Chat Messages Area
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(AppSpacing.l),
            children: [
              _buildDateHeader('9 Jan 2025'),
              const SizedBox(height: AppSpacing.m),
              _buildReceivedMessage(
                sender: 'Adv. Priya Sharma',
                message: "Hi Rajesh, hope you're doing well. I wanted to discuss the evidence documents for tomorrow's hearing.",
                time: '10:00',
                avatar: 'APS',
              ),
              const SizedBox(height: AppSpacing.m),
              _buildSentMessage(
                message: "Hello Priya, yes I'm ready to discuss. What do you need?",
                time: '10:05',
              ),
              const SizedBox(height: AppSpacing.m),
              _buildReceivedMessage(
                sender: 'Adv. Priya Sharma',
                message: 'Please prepare the evidence documents for tomorrow',
                time: '14:30',
                avatar: 'APS',
              ),
            ],
          ),
        ),
        
        // Message Input Bar
        Container(
          padding: const EdgeInsets.all(AppSpacing.m),
          decoration: const BoxDecoration(
            color: AppColors.surface,
            border: Border(top: BorderSide(color: AppColors.border)),
          ),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _messageController,
                  decoration: InputDecoration(
                    hintText: 'Type your message... (Shift+Enter for new line)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppRadius.medium),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.m,
                      vertical: AppSpacing.s,
                    ),
                  ),
                  maxLines: null,
                  textInputAction: TextInputAction.newline,
                ),
                const SizedBox(height: AppSpacing.s),
                Row(
                  children: [
                    OutlinedButton.icon(
                      onPressed: () async {
                        // Simulate file picker
                        // In production, use file_picker package
                        if (_attachedFiles.length < 5) {
                          setState(() {
                            _attachedFiles.add('document_${_attachedFiles.length + 1}.pdf');
                          });
                          Get.snackbar('Success', 'File attached');
                        } else {
                          Get.snackbar('Error', 'Maximum 5 files allowed');
                        }
                      },
                      icon: const Icon(Icons.attach_file, size: 18),
                      label: const Text('Attach'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.m,
                          vertical: AppSpacing.s,
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.s),
                    Text(
                      '${_attachedFiles.length}/5 files',
                      style: AppTypography.bodySmall(),
                    ),
                    const Spacer(),
                    ElevatedButton.icon(
                      onPressed: () async {
                        if (_messageController.text.trim().isEmpty) {
                          Get.snackbar('Error', 'Please enter a message');
                          return;
                        }
                        try {
                          // TODO: Send message via API
                          await Future.delayed(const Duration(milliseconds: 500)); // Simulate API call
                          if (mounted) {
                            Get.snackbar('Success', 'Message sent');
                            _messageController.clear();
                            setState(() {
                              _attachedFiles.clear();
                            });
                          }
                        } catch (e) {
                          if (mounted) {
                            Get.snackbar('Error', 'Failed to send message: ${e.toString()}');
                          }
                        }
                      },
                      icon: const Icon(Icons.send, size: 18),
                      label: const Text('Send'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.m,
                          vertical: AppSpacing.s,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDateHeader(String date) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.m,
          vertical: AppSpacing.xs,
        ),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(AppRadius.pill),
        ),
        child: Text(
          date,
          style: AppTypography.bodySmall(),
        ),
      ),
    );
  }

  Widget _buildReceivedMessage({
    required String sender,
    required String message,
    required String time,
    required String avatar,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Avatar
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: AppColors.primaryBlue.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Text(
              avatar,
              style: AppTypography.bodySmall(color: AppColors.primaryBlue),
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.s),
        // Message Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                sender,
                style: AppTypography.bodySmall(color: AppColors.textSecondary),
              ),
              const SizedBox(height: AppSpacing.xs),
              Container(
                padding: const EdgeInsets.all(AppSpacing.m),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(AppRadius.medium),
                  border: Border.all(color: AppColors.border),
                ),
                child: Text(
                  message,
                  style: AppTypography.body(),
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                time,
                style: AppTypography.caption(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSentMessage({
    Key? key,
    required String message,
    required String time,
  }) {
    return Row(
      key: key,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Message Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.m),
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue,
                  borderRadius: BorderRadius.circular(AppRadius.medium),
                ),
                child: Text(
                  message,
                  style: AppTypography.body(color: AppColors.surface),
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    time,
                    style: AppTypography.caption(),
                  ),
                  const SizedBox(width: AppSpacing.xs),
                  Icon(
                    Icons.done_all,
                    size: 12,
                    color: AppColors.textSecondary,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}


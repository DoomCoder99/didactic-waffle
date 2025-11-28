import 'package:flutter/material.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/spacing.dart' show AppSpacing;
import '../../core/theme/typography.dart';

/// Context menu widget for showing action menus
class ContextMenu {
  /// Show a context menu with action items
  static Future<void> show({
    required BuildContext context,
    required List<ContextMenuItem> items,
    Offset? position,
  }) async {
    final RenderBox? overlay = Overlay.of(context).context.findRenderObject() as RenderBox?;
    if (overlay == null) return;

    final Offset tapPosition = position ?? const Offset(0, 0);
    
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        tapPosition.dx,
        tapPosition.dy,
        overlay.size.width - tapPosition.dx,
        overlay.size.height - tapPosition.dy,
      ),
      items: items.map((item) => PopupMenuItem<ContextMenuItem>(
        value: item,
        child: Row(
          children: [
            Icon(item.icon, size: 20, color: item.isDestructive ? AppColors.error : AppColors.textPrimary),
            const SizedBox(width: AppSpacing.m),
            Expanded(
              child: Text(
                item.label,
                style: AppTypography.body(
                  color: item.isDestructive ? AppColors.error : AppColors.textPrimary,
                ),
              ),
            ),
          ],
        ),
      )).toList(),
    ).then((value) {
      if (value != null) {
        value.onTap?.call();
      }
    });
  }

  /// Show a bottom sheet style context menu
  static Future<void> showBottomSheet({
    required BuildContext context,
    required List<ContextMenuItem> items,
    String? title,
  }) async {
    await showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.m),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (title != null) ...[
              Padding(
                padding: const EdgeInsets.all(AppSpacing.l),
                child: Text(title, style: AppTypography.h3()),
              ),
              const Divider(),
            ],
            ...items.map((item) => ListTile(
              leading: Icon(
                item.icon,
                color: item.isDestructive ? AppColors.error : AppColors.primaryBlue,
              ),
              title: Text(
                item.label,
                style: AppTypography.body(
                  color: item.isDestructive ? AppColors.error : AppColors.textPrimary,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                item.onTap?.call();
              },
            )),
          ],
        ),
      ),
    );
  }
}

/// Context menu item model
class ContextMenuItem {
  final String label;
  final IconData icon;
  final VoidCallback? onTap;
  final bool isDestructive;

  const ContextMenuItem({
    required this.label,
    required this.icon,
    this.onTap,
    this.isDestructive = false,
  });
}


import 'package:app/core/constants/theme/colors.dart';
import 'package:flutter/material.dart';

class CircularLoadingWidgetVariant {
  const CircularLoadingWidgetVariant({required this.color});
  final Color color;
}

class CircularLoadingWidgetVariants {
  static final primary = CircularLoadingWidgetVariant(color: AppColor.info);
  static final secondary = CircularLoadingWidgetVariant(
    color: AppColor.fonts.secondary,
  );
  static final success = CircularLoadingWidgetVariant(color: AppColor.success);
  static final danger = CircularLoadingWidgetVariant(color: AppColor.danger);
}

class CircularLoadingWidget extends StatelessWidget {
  CircularLoadingWidget({super.key, required this.radius, this.variant});

  final double radius;
  final CircularLoadingWidgetVariant? variant;

  @override
  Widget build(BuildContext context) {
    final resolvedVariant = variant ?? CircularLoadingWidgetVariants.primary;
    return SizedBox(
      width: this.radius * 2,
      height: this.radius * 2,
      child: CircularProgressIndicator(color: resolvedVariant.color),
    );
  }
}

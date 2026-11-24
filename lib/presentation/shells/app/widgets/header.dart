import 'package:app/core/constants/theme/colors.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: AppColor.primary),
      child: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [Icon(LucideIcons.settings)],
        ),
      ),
    );
  }
}

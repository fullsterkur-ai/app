import 'package:app/core/constants/theme/colors.dart';
import 'package:app/core/constants/theme/fonts.dart';
import 'package:app/presentation/shells/app/widgets/tab.dart';
import 'package:app/presentation/widgets/branding.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class Webnavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: AppColor.secondary),
      child: Padding(
        padding: EdgeInsetsGeometry.all(14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              spacing: 10,
              children: [
                AppIcon(height: AppFont.header.primary * 2),
                AppLogo(size: AppFont.header.primary),
              ],
            ),
            Row(
              spacing: 20,
              children: [
                AppShellTab(title: 'Home', route: '/app'),
                AppShellTab(title: 'Train', route: '/app/train'),
                AppShellTab(title: 'Recovery', route: '/app/recovery'),
                AppShellTab(title: 'Profile', route: '/app/profile'),
                Icon(LucideIcons.settings, color: AppColor.fonts.secondary),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

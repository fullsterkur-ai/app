import 'package:app/core/constants/theme/colors.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class AppShellTab extends StatelessWidget {
  AppShellTab({required this.title, this.icon, required this.route});

  final String title;
  final IconData? icon;
  final String route;

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context).uri.toString();
    final isActive = currentRoute == route;
    final color = isActive ? AppColor.primary : AppColor.fonts.secondary;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => context.go(route),
        child: Column(
          spacing: 5,
          children: [
            if (this.icon != null) Icon(this.icon, color: color),
            Text(
              this.title,
              style: TextStyle(color: color, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:app/core/constants/theme/colors.dart';
import 'package:app/presentation/shells/app/widgets/tab.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class NavBar extends StatelessWidget {
  const NavBar();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: AppColor.secondary),
      child: Padding(
        padding: EdgeInsetsGeometry.only(
          top: 10,
          bottom: 40,
          left: 32,
          right: 32,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppShellTab(title: 'Home', icon: LucideIcons.house, route: '/app'),
            AppShellTab(
              title: 'Train',
              icon: LucideIcons.dumbbell,
              route: '/app/train',
            ),
            AppShellTab(
              title: 'Recovery',
              icon: LucideIcons.activity,
              route: '/app/recovery',
            ),
            AppShellTab(
              title: 'Profile',
              icon: LucideIcons.user_round,
              route: '/app/profile',
            ),
          ],
        ),
      ),
    );
  }
}

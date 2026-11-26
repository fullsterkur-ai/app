import 'package:app/presentation/screens/app/index.dart';
import 'package:app/presentation/screens/app/profile.dart';
import 'package:app/presentation/screens/app/recovery.dart';
import 'package:app/presentation/screens/app/training.dart';
import 'package:app/presentation/shells/app/index.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

final _shellNavigatorKey = GlobalKey<NavigatorState>();

final ShellRoute appShellRoute = ShellRoute(
  navigatorKey: _shellNavigatorKey,
  builder: (context, state, child) => AppShell(child: child),
  routes: [
    GoRoute(
      path: '/app',
      pageBuilder: (context, state) => NoTransitionPage(child: HomeScreen()),
      routes: [
        GoRoute(
          path: 'train', // ← relative, no leading slash
          pageBuilder: (context, state) =>
              NoTransitionPage(child: TrainingScreen()),
        ),
        GoRoute(
          path: 'recovery', // ← relative, no leading slash
          pageBuilder: (context, state) =>
              NoTransitionPage(child: RecoveryScreen()),
        ),
        GoRoute(
          path: 'profile', // ← relative, no leading slash
          pageBuilder: (context, state) =>
              NoTransitionPage(child: ProfileScreen()),
        ),
      ],
    ),
  ],
);

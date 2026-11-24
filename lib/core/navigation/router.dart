import 'package:app/core/navigation/appShellRoute.dart';
import 'package:app/presentation/screens/components/index.dart';
import 'package:app/presentation/screens/loading/index.dart';
import 'package:app/presentation/screens/signin/index.dart';
import 'package:app/presentation/screens/signup/index.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/loading',
  routes: <RouteBase>[
    GoRoute(path: '/loading', builder: (context, state) => LoadingScreen()),
    GoRoute(
      path: '/components',
      builder: (context, state) => ComponentsScreen(),
    ),
    GoRoute(path: '/signup', builder: (context, state) => SignupScreen()),
    GoRoute(path: '/signin', builder: (context, state) => SigninScreen()),
    appShellRoute
  ],
);

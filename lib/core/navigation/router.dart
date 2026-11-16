import 'package:app/presentation/screens/home/index.dart';
import 'package:app/presentation/screens/components/index.dart';
import 'package:app/presentation/screens/loading/index.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (context, state) => LoadingScreen(),
      routes: <GoRoute>[
        GoRoute(
          path: 'components',
          builder: (context, state) => ComponentsScreen(),
        ),
        GoRoute(path: 'home', builder: (context, state) => HomeScreen()),
      ],
    ),
  ],
);

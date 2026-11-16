import 'package:app/presentation/widgets/branding.dart';
import 'package:app/presentation/widgets/loading.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class LoadingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  // TODO: temporary variables
  bool loggedIn = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      if (loggedIn) return context.go('/home');
      context.go('/signup');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsetsGeometry.only(top: 150, bottom: 150),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(children: [AppIcon(height: 160), AppLogo()]),
            CircularLoadingWidget(radius: 10),
          ],
        ),
      ),
    );
  }
}

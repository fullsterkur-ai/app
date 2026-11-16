import 'package:app/presentation/shells/app/widgets/header.dart';
import 'package:app/presentation/shells/app/widgets/navbar.dart';
import 'package:app/presentation/shells/app/widgets/webnavbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox.expand(
        child: Column(
          children: [
            if (kIsWeb) Webnavbar(),
            if (!kIsWeb) Header(),
            Expanded(child: child),
            if (!kIsWeb) NavBar(),
          ],
        ),
      ),
    );
  }
}

import 'package:app/presentation/widgets/branding.dart';
import 'package:app/presentation/widgets/loading.dart';
import 'package:flutter/widgets.dart';

class LoadingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppIcon(height: 160),
        AppLogo(),
        CircularLoadingWidget(radius: 10)
      ],
    );
  }

}
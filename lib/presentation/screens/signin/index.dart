import 'package:app/core/constants/theme/colors.dart';
import 'package:app/presentation/widgets/buttons.dart';
import 'package:app/presentation/widgets/heading.dart';
import 'package:app/presentation/widgets/inputs/base.dart';
import 'package:app/presentation/widgets/inputs/emailInput.dart';
import 'package:app/presentation/widgets/inputs/passwordInput.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class SigninScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final horizontalPadding = width > 600 ? width * 0.25 : 20.0;

    return SafeArea(
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(
          vertical: 40,
          horizontal: horizontalPadding,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 40,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PrimaryHeading(text: 'Welcome back!'),
                    Text(
                      'Sign in to continue',
                      style: TextStyle(color: AppColor.fonts.secondary),
                    ),
                  ],
                ),
                Column(
                  spacing: 50,
                  children: [
                    Column(
                      spacing: 14,
                      children: [
                        EmailInput(
                          inputProperties: InputProperties(
                            label: 'Email',
                            placeholder: 'jane.doe@example.com',
                          ),
                        ),
                        PasswordInput(
                          inputProperties: InputProperties(
                            label: 'Password',
                            placeholder: 'Enter your password',
                          ),
                        ),
                      ],
                    ),
                    Column(
                      spacing: 10,
                      children: [
                        Button(text: 'Sign in to Fullsterkur.AI'),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 1,
                                color: AppColor.fonts.secondary,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Text('or'),
                            ),
                            Expanded(
                              child: Container(
                                height: 1,
                                color: AppColor.fonts.secondary,
                              ),
                            ),
                          ],
                        ),
                        Button(
                          text: 'Sign in with Google',
                          variant: ButtonVariant.secondary,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account? '),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => context.go('signup'),
                    child: Text(
                      ' Signup ',
                      style: TextStyle(color: AppColor.fonts.info),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

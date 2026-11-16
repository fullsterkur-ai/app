import 'package:app/core/constants/theme/colors.dart';
import 'package:app/presentation/widgets/buttons.dart';
import 'package:app/presentation/widgets/heading.dart';
import 'package:app/presentation/widgets/inputs/base.dart';
import 'package:app/presentation/widgets/inputs/emailInput.dart';
import 'package:app/presentation/widgets/inputs/passwordInput.dart';
import 'package:app/presentation/widgets/inputs/textInput.dart';
import 'package:flutter/cupertino.dart';

class SignupScreen extends StatelessWidget {
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
              children: [
                PrimaryHeading(text: 'Create an account'),
                Text(
                  'Sign up to get started',
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
                    TextInput(
                      inputProperties: InputProperties(
                        label: 'Username',
                        placeholder: 'Jane Doe',
                      ),
                    ),
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
                    TextInput(
                      inputProperties: InputProperties(
                        label: 'Confirm Password',
                        placeholder: 'Confirm your password',
                      ),
                    ),
                  ],
                ),
                Column(
                  spacing: 10,
                  children: [
                    Button(text: 'Sign up to Fullsterkur.AI'),
                    Text('or'),
                    Button(
                      text: 'Sign up with Google',
                      variant: ButtonVariant.secondary,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account? '),
                Text(' Login ', style: TextStyle(color: AppColor.fonts.info)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

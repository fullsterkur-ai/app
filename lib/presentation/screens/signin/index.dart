import 'package:app/core/constants/theme/colors.dart';
import 'package:app/presentation/widgets/buttons.dart';
import 'package:app/presentation/widgets/heading.dart';
import 'package:app/presentation/widgets/inputs/base.dart';
import 'package:app/presentation/widgets/inputs/emailInput.dart';
import 'package:app/presentation/widgets/inputs/passwordInput.dart';
import 'package:app/utils/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:app/services/auth.service.dart';
import 'package:toastification/toastification.dart';

class SigninScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  handleLogin() async {
    final email = emailController.text;
    final password = passwordController.text;
    bool success = false;
    String? err;
    (success, err) = await login(email, password);
    if (!success) {
      toastification.dismissAll();
      return toastification.show(
        context: context,
        title: Text(capitalizeFirstLetter(err ?? 'An error occured')),
        type: ToastificationType.error,
        style: ToastificationStyle.flat,
        backgroundColor: AppColor.background,
        foregroundColor: AppColor.fonts.secondary,
        borderSide: BorderSide(color: AppColor.secondary),
        autoCloseDuration: Duration(seconds: 4),
        alignment: Alignment.bottomCenter,
      );
    }
    context.go('app');
  }

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
        child: ListenableBuilder(
          listenable: Listenable.merge([emailController, passwordController]),
          builder: (context, widget) => Column(
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
                              controller: emailController,
                            ),
                          ),
                          PasswordInput(
                            inputProperties: InputProperties(
                              label: 'Password',
                              placeholder: 'Enter your password',
                              controller: passwordController,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        spacing: 10,
                        children: [
                          Button(
                            text: 'Sign in to Fullsterkur.AI',
                            disabled:
                                emailController.text.isEmpty ||
                                passwordController.text.isEmpty,
                            onTap: handleLogin,
                          ),
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
      ),
    );
  }
}

import 'package:app/core/constants/theme/colors.dart';
import 'package:app/models/user.dart';
import 'package:app/presentation/widgets/buttons.dart';
import 'package:app/presentation/widgets/heading.dart';
import 'package:app/presentation/widgets/inputs/base.dart';
import 'package:app/presentation/widgets/inputs/emailInput.dart';
import 'package:app/presentation/widgets/inputs/passwordInput.dart';
import 'package:app/presentation/widgets/inputs/textInput.dart';
import 'package:app/services/auth.service.dart';
import 'package:app/services/user.service.dart';
import 'package:app/utils/notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();

  handleSignup() async {
    final username = usernameController.text;
    final email = emailController.text;
    final password = passwordController.text;
    final rePassword = rePasswordController.text;

    if (password != rePassword)
      return showNotification(
        context,
        title: 'Password and confirmation password does not match',
        type: ToastificationType.error,
      );

    bool success = false;
    String? err;
    (success, err) = await createAccount(
      User(name: username, email: email, roles: []),
      password,
    );
    if (!success) {
      return showNotification(
        context,
        title: err ?? 'An error occured',
        type: ToastificationType.error,
      );
    }
    handleLogin();
  }

  handleLogin() async {
    final email = emailController.text;
    final password = passwordController.text;
    bool success = false;
    String? err;
    (success, err) = await login(email, password);
    if (!success)
      return showNotification(
        context,
        title: err ?? 'An error occured',
        type: ToastificationType.error,
      );
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
          listenable: Listenable.merge([
            usernameController,
            emailController,
            passwordController,
            rePasswordController,
          ]),
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
                              controller: usernameController,
                            ),
                          ),
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
                          TextInput(
                            inputProperties: InputProperties(
                              label: 'Confirm Password',
                              placeholder: 'Confirm your password',
                              controller: rePasswordController,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        spacing: 10,
                        children: [
                          Button(
                            text: 'Sign up to Fullsterkur.AI',
                            disabled:
                                usernameController.text.isEmpty ||
                                emailController.text.isEmpty ||
                                passwordController.text.isEmpty ||
                                rePasswordController.text.isEmpty,
                            onTap: handleSignup,
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
                            text: 'Sign up with Google',
                            variant: ButtonVariant.secondary,
                            disabled: true,
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
                  Text('Already have an account? '),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => context.go('signin'),
                      child: Text(
                        ' Login ',
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

import 'package:app/presentation/widgets/branding.dart';
import 'package:app/presentation/widgets/buttons.dart';
import 'package:app/presentation/widgets/container.dart';
import 'package:app/presentation/widgets/heading.dart';
import 'package:app/presentation/widgets/inputs/base.dart';
import 'package:app/presentation/widgets/inputs/textInput.dart';
import 'package:app/presentation/widgets/inputs/numericInput.dart';
import 'package:app/presentation/widgets/inputs/emailInput.dart';
import 'package:app/presentation/widgets/inputs/passwordInput.dart';
import 'package:app/presentation/widgets/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class ComponentsScreen extends StatefulWidget {
  ComponentsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ComponentsScreenState();
}

class _ComponentsScreenState extends State<ComponentsScreen> {
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return (SafeArea(
      child: Padding(
        padding: EdgeInsetsGeometry.all(14),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 14,
            children: [
              Row(children: [AppIcon(), AppLogo()], spacing: 4),
              PrimaryHeading(text: 'Primary heading'),
              SecondaryHeading(text: 'Secondary heading'),
              TertiaryHeading(text: 'Tertiary heading'),
              Text('Normal text'),
              AppContainer(child: Text('Hello world\nThis is a container')),
              SecondaryHeading(text: 'Buttons'),
              Row(
                children: [
                  Button(
                    text: 'Primary button',
                    variant: ButtonVariant.primary,
                  ),
                  Button(
                    text: 'Secondary button',
                    variant: ButtonVariant.secondary,
                    onTap: () => print(nameController.text),
                  ),
                  Button(
                    text: 'Primary danger button',
                    variant: ButtonVariant.danger_primary,
                  ),
                  Button(
                    text: 'Secondary danger button',
                    variant: ButtonVariant.danger_secondary,
                  ),
                ],
                spacing: 8,
              ),
              TextInput(
                inputProperties: InputProperties(
                  label: 'Text input',
                  placeholder: 'Text input',
                ),
              ),
              NumericInput(
                inputProperties: InputProperties(
                  label: 'Numeric input',
                  placeholder: 'Numeric input',
                  initialValue: '89',
                  controller: nameController,
                ),
              ),
              EmailInput(
                inputProperties: InputProperties(
                  label: 'Email input',
                  placeholder: 'Email input',
                ),
              ),
              PasswordInput(
                inputProperties: InputProperties(
                  label: 'Password input',
                  placeholder: 'Password input',
                ),
              ),
              Row(
                spacing: 14,
                children: [
                  Column(
                    spacing: 14,
                    children: [
                      Text('Primary spinner'),
                      CircularLoadingWidget(radius: 10),
                    ],
                  ),
                  Column(
                    spacing: 14,
                    children: [
                      Text('Secondary spinner'),
                      CircularLoadingWidget(
                        radius: 10,
                        variant: CircularLoadingWidgetVariants.secondary,
                      ),
                    ],
                  ),
                  Column(
                    spacing: 14,
                    children: [
                      Text('Success spinner'),
                      CircularLoadingWidget(
                        radius: 10,
                        variant: CircularLoadingWidgetVariants.success,
                      ),
                    ],
                  ),
                  Column(
                    spacing: 14,
                    children: [
                      Text('Danger spinner'),
                      CircularLoadingWidget(
                        radius: 10,
                        variant: CircularLoadingWidgetVariants.danger,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

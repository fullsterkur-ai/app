import 'package:app/presentation/widgets/inputs/base.dart';
import 'package:flutter/widgets.dart';

class EmailInput extends StatelessWidget {
  EmailInput({super.key, this.inputProperties = const InputProperties()});

  final InputProperties inputProperties;

  @override
  Widget build(BuildContext context) {
    return Input(
      keyboardType: TextInputType.emailAddress,
      inputProperties: this.inputProperties,
    );
  }
}

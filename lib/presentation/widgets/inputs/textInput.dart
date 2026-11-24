import 'package:app/presentation/widgets/inputs/base.dart';
import 'package:flutter/widgets.dart';

class TextInput extends StatelessWidget {
  TextInput({super.key, this.inputProperties = const InputProperties()});

  final InputProperties inputProperties;

  @override
  Widget build(BuildContext context) {
    return Input(
      keyboardType: TextInputType.text,
      inputProperties: this.inputProperties,
    );
  }
}

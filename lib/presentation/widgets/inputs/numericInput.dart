import 'package:app/core/constants/theme/colors.dart';
import 'package:app/presentation/widgets/inputs/base.dart';
import 'package:flutter/widgets.dart';

class NumericInput extends StatefulWidget {
  NumericInput({super.key, this.inputProperties = const InputProperties()});

  final InputProperties inputProperties;

  @override
  State<StatefulWidget> createState() => _NumericInputState();
}

class _NumericInputState extends State<NumericInput> {
  _onMinusTap() {
    var controller = widget.inputProperties.controller;
    if (controller != null) {
      controller.text = ((double.tryParse(controller.text) ?? 0) - 1)
          .toString();
    }
  }

  _onPlusTap() {
    var controller = widget.inputProperties.controller;
    if (controller != null) {
      controller.text = ((double.tryParse(controller.text) ?? 0) + 1)
          .toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    final initialValue = widget.inputProperties.initialValue;
    final existingController = widget.inputProperties.controller;

    final controller =
        existingController ??
        TextEditingController(text: initialValue?.toString() ?? '0');

    if (initialValue != null) {
      controller.text = initialValue.toString().replaceAll(
        RegExp(r'[^-\d.]'),
        '',
      );
    } else {
      controller.text = controller.text.replaceAll(RegExp(r'[^-\d.]'), '');
    }

    if (controller.text.isEmpty) controller.text = '0';

    return Input(
      keyboardType: TextInputType.numberWithOptions(),
      inputProperties: widget.inputProperties,
      inputFormatters: [Input.digitsOnlyTextInputFormatter],
      suffix: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          spacing: 10,
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: _onMinusTap,
                child: Padding(
                  padding: EdgeInsetsGeometry.all(2),
                  child: Text(
                    '-',
                    style: TextStyle(color: AppColor.fonts.secondary),
                  ),
                ),
              ),
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: _onPlusTap,
                child: Padding(
                  padding: EdgeInsetsGeometry.all(2),
                  child: Text(
                    '+',
                    style: TextStyle(color: AppColor.fonts.secondary),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

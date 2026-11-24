import 'package:app/core/constants/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class InputProperties {
  const InputProperties({
    this.label,
    this.initialValue,
    this.controller,
    this.placeholder,
    this.maxLength,
    this.min,
    this.max,
  });

  final String? label;
  final Object? initialValue;
  final TextEditingController? controller;
  final String? placeholder;
  final int? maxLength;
  final int? min;
  final int? max;
}

class Input extends StatefulWidget {
  const Input({
    super.key,
    this.keyboardType = TextInputType.text,
    this.obscure = false,
    this.inputProperties = const InputProperties(),
    this.inputFormatters,
    this.prefix,
    this.suffix,
  });

  final TextInputType keyboardType;
  final bool obscure;
  final InputProperties inputProperties;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefix;
  final Widget? suffix;

  static final digitsOnlyTextInputFormatter = TextInputFormatter.withFunction((
    before,
    after,
  ) {
    return RegExp(r'^-?\d*\.?\d*$').hasMatch(after.text) ? after : before;
  });

  static final lengthLimitingTextInputFormatter = (int maxLength) =>
      LengthLimitingTextInputFormatter(maxLength);

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  final FocusNode _focusNode = FocusNode();
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() => _focused = _focusNode.hasFocus);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        if (widget.inputProperties.label != null)
          Text(
            widget.inputProperties.label!,
            style: TextStyle(color: AppColor.fonts.secondary),
          ),
        CupertinoTextField(
          controller: widget.inputProperties.controller,
          focusNode: _focusNode,
          obscureText: widget.obscure,
          keyboardType: widget.keyboardType,
          decoration: BoxDecoration(
            color: AppColor.background,
            border: Border.all(
              color: _focused ? AppColor.primary : AppColor.secondary,
              width: 1,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          padding: EdgeInsetsGeometry.only(
            top: 8,
            bottom: 8,
            left: 12,
            right: 12,
          ),
          inputFormatters: widget.inputFormatters,
          placeholder: widget.inputProperties.placeholder,
          prefix: widget.prefix,
          suffix: widget.suffix,
        ),
      ],
    );
  }
}

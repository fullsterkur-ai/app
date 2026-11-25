import 'package:app/core/constants/theme/colors.dart';
import 'package:flutter/widgets.dart';

enum ButtonVariant { primary, secondary, danger_primary, danger_secondary }

class Button extends StatefulWidget {
  const Button({
    super.key,
    required this.text,
    this.variant = ButtonVariant.primary,
    this.disabled = false,
    this.width,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
  });

  final ButtonVariant variant;
  final String text;
  final bool disabled;

  final double? width;
  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;
  final VoidCallback? onLongPress;
  final GestureTapDownCallback? onTapDown;
  final GestureTapUpCallback? onTapUp;
  final VoidCallback? onTapCancel;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool _pressed = false;
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = switch (widget.variant) {
      ButtonVariant.primary => AppColor.primary,
      ButtonVariant.secondary => AppColor.background,
      ButtonVariant.danger_primary => AppColor.danger,
      ButtonVariant.danger_secondary => AppColor.background,
    };

    final borderColor = switch (widget.variant) {
      ButtonVariant.primary => AppColor.primary,
      ButtonVariant.secondary => AppColor.primary,
      ButtonVariant.danger_primary => AppColor.danger,
      ButtonVariant.danger_secondary => AppColor.danger,
    };

    final opacity = _pressed ? 0.7 : (_hovered ? 0.85 : 1.0);

    return MouseRegion(
      cursor: widget.disabled
          ? SystemMouseCursors.forbidden
          : SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: !widget.disabled ? widget.onTap : null,
        onDoubleTap: widget.onDoubleTap,
        onLongPress: widget.onLongPress,
        onTapDown: (details) {
          if (widget.disabled) return;
          setState(() => _pressed = true);
          widget.onTapDown?.call(details);
        },
        onTapUp: (details) {
          if (widget.disabled) return;
          setState(() => _pressed = false);
          widget.onTapUp?.call(details);
        },
        onTapCancel: () {
          if (widget.disabled) return;
          setState(() => _pressed = false);
          widget.onTapCancel?.call();
        },
        child: AnimatedScale(
          scale: _pressed ? 0.97 : 1.0,
          duration: const Duration(milliseconds: 100),
          child: AnimatedOpacity(
            opacity: opacity,
            duration: const Duration(milliseconds: 100),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: widget.disabled
                    ? (backgroundColor == AppColor.background
                          ? AppColor.background
                          : AppColor.secondary)
                    : backgroundColor,
                border: Border.all(
                  color: widget.disabled ? AppColor.background : borderColor,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SizedBox(
                width: widget.width ?? double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 8,
                  ),
                  child: Text(
                    widget.text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

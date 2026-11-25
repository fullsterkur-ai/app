import 'dart:math';

import 'package:app/core/constants/theme/colors.dart';
import 'package:app/models/user.dart';
import 'package:flutter/widgets.dart';

class ProfilePicture extends StatelessWidget {
  ProfilePicture(this.user, {this.size = 20});

  final User user;
  final double size;

  @override
  Widget build(BuildContext context) {
    List<String> initials = user.name
        .toUpperCase()
        .replaceAll(RegExp(r'\s+'), ' ')
        .split(' ')
        .map((s) => s[0])
        .toList();

    final abbreviatedName = initials
        .sublist(0, min(2, initials.length))
        .join('');
    return DecoratedBox(
      decoration: BoxDecoration(
        //borderRadius: const BorderRadius.all(Radius.circular(100)),
        color: AppColor.primary,
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.all(size / 2),
        child: Text(
          abbreviatedName,
          style: TextStyle(
            fontSize: abbreviatedName.length > 1 ? size / 2 : size,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

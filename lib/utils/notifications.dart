import 'package:app/core/constants/theme/colors.dart';
import 'package:flutter/widgets.dart';
import 'package:toastification/toastification.dart';

void showNotification(
  BuildContext context, {
  required String title,
  ToastificationType type = ToastificationType.info,
}) {
  toastification.dismissAll();
  toastification.show(
    context: context,
    title: Text(title),
    type: type,
    style: ToastificationStyle.flat,
    backgroundColor: AppColor.background,
    foregroundColor: AppColor.fonts.secondary,
    borderSide: BorderSide(color: AppColor.secondary),
    autoCloseDuration: Duration(seconds: 4),
    alignment: Alignment.bottomCenter,
  );
}

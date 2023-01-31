import 'package:dw9_delivery_app/app/core/ui/styles/colors_app.dart';
import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class AppStyles {
  static AppStyles? _instance;

  AppStyles._();

  static AppStyles get instance {
    _instance ??= AppStyles._();
    return _instance!;
  }

  ButtonStyle get primaryButton => ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7),
      ),
      // TODO: Rever pq não exite backgroundColor. versão Dart?
      surfaceTintColor: ColorsApp.instance.primary,
      textStyle: TextStyles.instance.textButtonLabel);
}

extension AppStyleExtensions on BuildContext {
  AppStyles get appStyles => AppStyles.instance;
}

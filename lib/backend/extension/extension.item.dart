import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../services/service.theme.dart';

extension ItemExtension on Widget {
  Widget get outline => Container(
        child: this,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: themeService.br,
            border: Border.all(
              color: themeService.grey,
              width: 1,
            ),
            boxShadow: [themeService.primaryShadow]),
      );
}

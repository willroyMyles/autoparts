import 'package:flutter/material.dart';

import '../../../backend/services/service.theme.dart';

class BaseItem extends StatelessWidget {
  final Widget child;
  const BaseItem({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: themeService.br,
          border: Border.all(
            color: themeService.grey,
            width: 1,
          ),
          boxShadow: [themeService.primaryShadow]),
      child: child,
    );
  }
}

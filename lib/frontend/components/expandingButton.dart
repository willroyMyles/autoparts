import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum EBLevel { Primary, Secondary, Teritairy }

extension eblevelext on EBLevel {
  bool get isPrimary => this == EBLevel.Primary;
  bool get isSecondary => this == EBLevel.Secondary;
  bool get isTeritairy => this == EBLevel.Teritairy;
}

class ExpandingButton extends StatelessWidget {
  final String text;
  final EBLevel level;

  const ExpandingButton(
      {Key? key, required this.text, this.level = EBLevel.Primary})
      : super(key: key);

  getDecoraion() {
    var mainColor = Theme.of(Get.context!).colorScheme.secondary;
    var color = level.isPrimary
        ? mainColor.withOpacity(.3)
        : level.isSecondary
            ? Colors.transparent
            : Colors.transparent;
    double bw = level.isPrimary ? 1.0 : 0;
    return BoxDecoration(
        color: color,
        border: Border.all(
          width: bw * 1.0,
          color: color.withOpacity(bw),
        ),
        borderRadius: BorderRadius.circular(5));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: () {},
        child: Container(
          // alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          decoration: getDecoraion(),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("button one"),
              ]),
        ),
      ),
    );
  }
}

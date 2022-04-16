import 'package:flutter/material.dart';

class BottomSheetCustom extends StatelessWidget {
  final Widget child;
  const BottomSheetCustom({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      maxChildSize: 1,
      minChildSize: .2,
      initialChildSize: 1,
      builder: (context, scrollController) {
        return LayoutBuilder(builder: (context, constraints) {
          return Container(
            // height: constraints.maxHeight,
            color: Colors.white,
            child: child,
          );
        });
      },
    );
  }
}

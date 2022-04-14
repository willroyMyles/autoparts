import 'package:flutter/material.dart';

class BottomSheetCustom extends StatelessWidget {
  final Widget child;
  const BottomSheetCustom({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: true,
      minChildSize: .5,
      maxChildSize: .8,
      initialChildSize: .5,
      builder: (context, scrollController) {
        return Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              // border: Border.all(width: 3, color: Colors.blue.withOpacity(.5)),
              boxShadow: [
                BoxShadow(
                    blurRadius: 3,
                    color:
                        Theme.of(context).colorScheme.secondary.withOpacity(.0),
                    offset: Offset(5, 5))
              ],
              color: Theme.of(context).colorScheme.primaryContainer),
          child: SingleChildScrollView(
            controller: scrollController,
            child: child,
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:wrg3/backend/enums/enum.itemType.dart';
import 'package:wrg3/backend/network/general.executor.dart';
import 'package:wrg3/frontend/components/items/item.post.dart';

class GenericListView extends StatelessWidget {
  final List<dynamic> items;
  final bool refresh;
  final Function? onRefresh;
  final Itemtype itemtype;
  GenericListView(
      {Key? key,
      required this.items,
      this.refresh = false,
      this.onRefresh,
      required this.itemtype})
      : super(key: key);

  bool onEndReached = false;

  Future<void> _onRefreshCallback() async {
    if (onRefresh != null) {
      onRefresh!();
    }
  }

  void _onEndReachedCallback() async {
    print("object");
    onEndReached = true;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      child: RefreshIndicator(
        onRefresh: _onRefreshCallback,
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            var model = items.elementAt(index);
            if (itemtype == Itemtype.POST) return PostItem(model: model);

            return Container(
              height: 100,
              color: Colors.green,
              margin: EdgeInsets.symmetric(vertical: 5),
            );
          },
        ),
      ),
      onNotification: (scrollNotification) {
        if (scrollNotification.metrics.pixels >
            scrollNotification.metrics.maxScrollExtent - 100) {
          if (!onEndReached) _onEndReachedCallback();
        }
        return true;
      },
    );
  }
}

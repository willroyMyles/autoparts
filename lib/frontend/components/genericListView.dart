import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg3/backend/enums/enum.itemType.dart';
import 'package:wrg3/backend/extension/ext.dart';
import 'package:wrg3/backend/models/model.post.dart';
import 'package:wrg3/backend/network/general.executor.dart';
import 'package:wrg3/backend/services/service.theme.dart';
import 'package:wrg3/frontend/components/items/item.post.dart';

class GenericListView extends StatelessWidget {
  final List<dynamic> items;
  final bool refresh;
  final Function? onRefresh;
  final Itemtype itemtype;
  final RxStatus status;
  GenericListView(
      {Key? key,
      required this.items,
      this.refresh = false,
      this.onRefresh,
      required this.itemtype,
      required this.status})
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
          itemCount: items.length +
              (status.isLoading ? 3 : 0) +
              (status.isError ? 1 : 0),
          itemBuilder: (context, index) {
            if (status.isSuccess || status.isLoading && index > 2) {
              var model = items.elementAt(index);
              if (itemtype == Itemtype.POST) {
                return PostItem(
                  model: model,
                );
              }
            }

            if (status.isLoading) {
              return PostItem(
                loading: true,
              );
            }

            if (status.isError) {
              return Container(
                height: Get.width / 2,
                alignment: Alignment.center,
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.blueGrey.shade900,
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        status.errorMessage!,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        _onRefreshCallback();
                      },
                      child: Text("try again"),
                    )
                  ],
                ),
              );
            }
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

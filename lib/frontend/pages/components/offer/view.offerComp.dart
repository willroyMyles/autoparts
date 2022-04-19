import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg3/backend/extension/ext.dart';
import 'package:wrg3/backend/models/model.post.dart';
import 'package:wrg3/frontend/components/items/item.base.dart';
import 'package:wrg3/frontend/components/items/item.offer.dart';
import 'package:wrg3/frontend/pages/components/offer/state.offerComp.dart';

class OfferComp extends StatelessWidget {
  final PostModel model;
  OfferComp({Key? key, required this.model}) : super(key: key);
  final controller = Get.put(OfferCompState());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OfferCompState>(
      initState: (_) {
        controller.setCurrentPostModel(model);
      },
      builder: (_) {
        var amount = controller.displayList.length;

        return Container(
          margin: EdgeInsets.only(top: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("offers"),
                      if (!controller.displayList.isEmpty)
                        TextButton(
                          onPressed: () {
                            controller.toggleHideOffers();
                          },
                          child: Text(
                              "${controller.hideOffers ? 'show' : 'hide'} $amount offer${amount != 1 ? 's' : ''}"),
                        )
                    ],
                  )),
              if (controller.displayList.isEmpty)
                Container(
                  margin: EdgeInsets.all(20),
                  alignment: Alignment.center,
                  child: Container(
                          padding: EdgeInsets.all(20),
                          child: Text("currently no offers"))
                      .outline,
                ),
              AnimatedSwitcher(
                duration: Duration(milliseconds: 450),
                child: controller.hideOffers
                    ? Container()
                    : Column(children: [
                        ...controller.displayList.values.map((e) => Offeritem(
                              model: e,
                            ))
                      ]),
                transitionBuilder: (child, animation) {
                  return SizeTransition(
                    sizeFactor: animation,
                    axis: Axis.vertical,
                    child: FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }
}

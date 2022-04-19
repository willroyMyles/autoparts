import 'package:get/get.dart';
import 'package:wrg3/backend/models/model.offer.dart';
import 'package:wrg3/backend/models/model.post.dart';

import '../../../../backend/network/general.executor.dart';

class OfferCompState extends GetxController {
  bool hideOffers = false;
  late PostModel currentPostModel;
  Map<String, OfferModel> displayList = {};

  void setCurrentPostModel(PostModel model) {
    currentPostModel = model;
    getOffersForPost();
  }

  void toggleHideOffers() {
    hideOffers = !hideOffers;
    refresh();
  }

  void getOffersForPost() async {
    try {
      var res = await GE.offer_getOffersForPost(currentPostModel.id);
      for (OfferModel model in (res as List)) {
        displayList.putIfAbsent(model.id, () => model);
      }
      refresh();
    } catch (e) {
      refresh();
    }
  }
}

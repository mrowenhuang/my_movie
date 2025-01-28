import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MovieDetailController extends GetxController {
  //TODO: Implement MovieDetailController

  late ScrollController bigScrollController;
  late ScrollController smallScrollController;

  @override
  void onInit() {
    super.onInit();
    bigScrollController = ScrollController();
    smallScrollController = ScrollController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    bigScrollController.dispose();
    smallScrollController.dispose();
  }
}

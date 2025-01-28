import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchingController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  //TODO: Implement SearchingController

  var movieYear = Rx<DateTime?>(null);
  var movieLanguage = Rx<String?>(null);
  var filterStatus = false.obs;
  var activePage = Rx<int>(1);

  late TextEditingController searchC;

  @override
  void onInit() {
    super.onInit();
    searchC = TextEditingController();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    searchC.dispose();
    animationController.dispose();
  }
}

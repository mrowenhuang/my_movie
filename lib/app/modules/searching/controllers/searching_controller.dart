import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchingController extends GetxController {
  //TODO: Implement SearchingController

  var movieYear = Rx<DateTime?>(null);
  var movieLanguage = Rx<String?>(null);

  late TextEditingController searchC;

  @override
  void onInit() {
    super.onInit();

    searchC = TextEditingController();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    searchC.dispose();
  }
}

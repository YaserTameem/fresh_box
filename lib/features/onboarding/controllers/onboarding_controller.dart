import 'package:flutter/material.dart';
import 'package:fresh_box/core/services/local_storage_service.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final LocalStorageService storage = Get.find<LocalStorageService>();
  late PageController pageController;
  RxInt currentPage = 0.obs;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void onPageChange(int page) {
    currentPage.value = page;
    storage.cacheOnboardingPage(page);
  }

  Future<void> completeOnboarding() async {
    await storage.completeOnboarding();
  }
}

import 'package:fresh_box/core/routing/app_routes.dart';
import 'package:fresh_box/core/services/local_storage_service.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final LocalStorageService storage = Get.find<LocalStorageService>();

  @override
  void onReady() {
    super.onReady();
    _navigateUser();
  }

  Future<void> _navigateUser() async {
    await Future.delayed(Duration(seconds: 2));
    if (!storage.isOnboardingCompleted) {
      Get.offAllNamed(AppRoutes.onboarding);
      return;
    }
    if (!storage.isLoggedIn) {
      Get.offAllNamed(AppRoutes.login);
      return;
    }
    Get.offAllNamed(AppRoutes.home);
  }
}

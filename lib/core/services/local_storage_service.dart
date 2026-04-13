import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocalStorageService extends GetxService {
  LocalStorageService(this._box);

  final GetStorage _box;

  static const String _onboardingCompletedKey = 'onboarding.completed';
  static const String _onboardingPageKey = 'onboarding.page';
  static const String _isLoggedInKey = 'is_logged_in';

  bool get isOnboardingCompleted => _box.read<bool>(_onboardingCompletedKey) ?? false;

  int get onboardingPage => _box.read<int>(_onboardingPageKey) ?? 0;

  bool get isLoggedIn => _box.read<bool>(_isLoggedInKey) ?? false;

  Future<void> cacheOnboardingPage(int page) async {
    await _box.write(_onboardingPageKey, page);
  }

  Future<void> completeOnboarding() async {
    await _box.write(_onboardingCompletedKey, true);
    await _box.remove(_onboardingPageKey);
  }

  Future<void> setLoggedIn() async {
    await _box.write(_isLoggedInKey, true);
  }

  Future<void> logOut() async {
    await _box.remove(_isLoggedInKey);
  }
}

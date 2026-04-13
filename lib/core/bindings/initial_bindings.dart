import 'package:fresh_box/core/services/local_storage_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<LocalStorageService>(LocalStorageService(GetStorage()), permanent: true);
  }
}

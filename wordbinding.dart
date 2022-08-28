import 'package:get/get.dart';
import 'package:wordsextract/wordcontroller.dart';

class wordbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => words(), fenix: true);
  }
}

import 'package:get/get.dart';

class DataController extends GetxController
    with StateMixin<Map<String, String>> {
  var count = 0.obs;
  void inc() {
    count++;
  }

  @override
  void onInit() {
    super.onInit();
    Provider().getUser().then((value) {
      change(value, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error("hgfghfhhhhhhhhhhhhhhhhhherror.toString()"));
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}

class Provider extends GetConnect {
  Future<dynamic> getUser() async {
    String res = "";
    final response = await get(
        'https://raw.githubusercontent.com/matthewreagan/WebstersEnglishDictionary/master/dictionary.json');
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      res = "${response.body}";
      print("${httpClient.timeout}");
      return response.body;
    }
  }
}

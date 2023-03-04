import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';

import '../models/example_model.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  Timer? timer;
  UserModel? usemrModel;
  var isDataLoading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    getApi();
    timer = Timer.periodic(const Duration(seconds: 60), (Timer t) => getApi());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  getApi() async {
    try {
      isDataLoading(true);
      http.Response response =
          await http.get(Uri.tryParse('http://localhost:3000/')!);
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        usemrModel = UserModel.fromJson(result);
      } else {
        ///error
      }
    } catch (e) {
      // print('Error while getting data is $e');
    } finally {
      isDataLoading(false);
    }
  }
}

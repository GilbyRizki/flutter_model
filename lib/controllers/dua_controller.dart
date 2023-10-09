import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:new_project_flutter/models/model_dua.dart';
// import 'package:flutter/services.dart';

class DuaController extends GetxController {
  RxBool isLoading = false.obs;

  Rx<List<modelDua>> listdua = Rx<List<modelDua>>([]);

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    try {
      isLoading.value = true;
      // var response = await rootBundle.loadString('assets/satu.json');
      var response = await http.get(Uri.parse(
          'https://mocki.io/v1/240bc6c2-1da0-4cea-a51b-39cb05260fd5'));

      if (response.statusCode == 200) {
        isLoading.value = false;
        final content = jsonDecode(response.body);

        for (Map<String, dynamic> i in content) {
          listdua.value.add(modelDua.fromJson(i));
          print(listdua.value.length);
        }
      } else {
        isLoading.value = false;
        print('terjadi kesalahan');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

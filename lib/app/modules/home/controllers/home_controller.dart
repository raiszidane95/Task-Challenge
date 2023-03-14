import 'package:get/get.dart';

import '../../../data/bank_service.dart';
import '../models/bank__models.dart';

class HomeController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<Datum> listData = <Datum>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAllData();
  }

  getAllData() async {
    try {
      final response = await BankService().getData();
      listData.addAll(response.data);
      print(listData);
      isLoading.toggle();
    } catch (e) {
      isLoading.toggle();
      Get.snackbar('Controller Error', e.toString());
      print(e);
    }
  }
}

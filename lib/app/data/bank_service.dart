import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../modules/home/models/bank__models.dart';

class BankService {
  final _connect = Get.find<GetConnect>();

  Future<BankModels> getData() async {
    final response = await _connect.get('home', decoder: (data) => BankModels.fromJson(data));
    if (!response.hasError) {
      Logger().d(response.body);
      return response.body!;
    } else {
      throw Get.snackbar(
        "Error",
        response.statusCode.toString(),
        duration: const Duration(seconds: 10),
      );
    }
  }
}

import 'package:yoked/App/Home/Model/product_model.dart';
import 'package:yoked/Network/api_client.dart';
import 'package:dio/dio.dart';
import 'package:yoked/Network/api_url.dart';
import 'package:yoked/Utils/toast_message.dart';

mixin HomeService {
  Future<List<ProductsModel>> getProductsService() async {
    List<ProductsModel> result = [];
    var response = await ApiClient(Dio()).getRequest(apiUrl: ApiUrl.products);
    if (response.statusCode == 200) {
      result = ProductsModel.jsonToList(response.data);
      ShowMessage.onSuccess('Success');
    } else {
      ShowMessage.onFail('Failed');
    }
    return result;
  }
}

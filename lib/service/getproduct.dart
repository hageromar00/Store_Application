import 'package:store_application/helper/api.dart';
import 'package:store_application/model/category.dart';

class GetAllProduct {
  Future<List<ProductModel>> getallproduct() async {
    List<dynamic> data = await API().getService(
      URI: 'https://fakestoreapi.com/products',
    );
    List<ProductModel> product = [];
    for (int i = 0; i < data.length; i++) {
      product.add(ProductModel.fromJson(data[i]));
    }
    return product;
  }
}

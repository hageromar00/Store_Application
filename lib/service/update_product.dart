


import 'package:store_application/helper/api.dart';
import 'package:store_application/model/category.dart';


class UpdateProductServices {
  Future<ProductModel> updateProduct(
      {required String title,
      required String price,
      required String desc,
      required String image,
      required String category,
      required int id}) async {
    print('product id  = $id');
    Map<String, dynamic> datas =
        await API().putService(URI: 'https://fakestoreapi.com/products/$id', body: {
      'title': title,
      'price': price,
      'description': desc,
      'image': image,
      'category': category
    });
    return ProductModel.fromJson(datas);
  }
}

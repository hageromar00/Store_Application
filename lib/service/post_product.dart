import 'package:store_application/helper/api.dart';
import 'package:store_application/model/category.dart';
class PostProductServices {
  Future<ProductModel> postProduct(
      {required String title,
      required String price,
      required String desc,
      required String image,
      required String category,
      required int id}) async {
    print('product id  = $id');
    Map<String, dynamic> datas =
        await API().postService(URI: 'https://fakestoreapi.com/products', body: {
      'title': title,
      'price': price,
      'description': desc,
      'image': image,
      'category': category
    });
    return ProductModel.fromJson(datas);
  }
}
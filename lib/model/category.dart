class ProductModel {
  final dynamic id;
  final String title;
  final String description;
  final String image;
  final String category;
  // final RatingModel? rating;
  final dynamic price;
  // final RatingModel? rating;
  ProductModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.image,
      required this.category,
      required this.price,
      // required this.rating 
      // required this.rating
      });
  factory ProductModel.fromJson(json) {
    return ProductModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        image: json['image'],
        category: json['category'],
        price: json['price'],
        
        // rating: json['rating'] ==null? null:RatingModel.fromJson(json['rating']) 
        );
  }
}

class RatingModel {
  final dynamic rate;
  final int count;
  RatingModel({required this.count, required this.rate});
  factory RatingModel.fromJson(data){
    return RatingModel(count: data['count'],rate: data['rate']);
  }
}

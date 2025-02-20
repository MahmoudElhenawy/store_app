class ProductModel {
  final dynamic id;
  final String title;
  final double price;
  final String description;
  final String image;
  final String category; //  إضافة الـ category
  final RatingModel? rating; //  خليه nullable عشان لو الـ API مش راجع تقييم

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.category, //  إضافة الـ category كـ required
    this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductModel(
      id: jsonData['id'],
      title: jsonData['title'],
      price: (jsonData['price'] as num).toDouble(), //  تحويل صحيح لـ double
      description: jsonData['description'],
      image: jsonData['image'],
      category: jsonData['category'] ?? "Uncategorized", // تعيين قيمة افتراضية
      rating: jsonData['rating'] != null
          ? RatingModel.fromJson(jsonData['rating'])
          : null, //  تجنب Null Error
    );
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(Map<String, dynamic> jsonData) {
    return RatingModel(
      rate: (jsonData['rate'] as num).toDouble(), //  تأكيد إنه double
      count: jsonData['count'],
    );
  }
}

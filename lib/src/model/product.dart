class Product {
  int id;
  String title;
  double price;
  String image;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        title: json['title'],
        price: double.parse(json['price'].toString()),
        image: json['thumbnail'],
      );
}

import 'package:flutter/material.dart';
import 'package:flutter_helloworld/src/model/product.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(product.title),
        ),
        body: Column(
          children: [
            Text(product.title),
            Text('ราคาสินค้า ${product.price} บาท'),
          ],
        ));
  }
}

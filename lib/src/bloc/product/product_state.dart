part of 'product_bloc.dart';

class GetProductsStateSuccess extends MyState {
  List<Product> products;
  GetProductsStateSuccess({required this.products});
}

class GetProductStateSuccess extends MyState {
  Product product;
  GetProductStateSuccess({required this.product});
}

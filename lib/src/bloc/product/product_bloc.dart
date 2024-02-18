import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_helloworld/src/bloc/common_bloc.dart';
import 'package:flutter_helloworld/src/model/product.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<MyEvent, MyState> {
  ProductBloc() : super(StateInitialized()) {
    on<GetProductsEvent>((event, emit) async {
      emit(StateLoading());

      final res = await http.get(
        Uri.parse('https://dummyjson.com/products?limit=20'),
      );
      if (res.statusCode != HttpStatus.ok) {
        emit(StateError(message: res.body));
        return;
      }

      final json = jsonDecode(utf8.decode(res.bodyBytes));
      print(json);
      final products =
          (json['products'] as List).map((e) => Product.fromJson(e)).toList();
      emit(GetProductsStateSuccess(products: products));
    });

    on<GetProductEvent>((event, emit) async {
      emit(StateLoading());

      final res = await http.get(
        Uri.parse(
            'https://dummyjson.com/products/${event.id}?limit=10&skip=10&select=title,price'),
      );
      if (res.statusCode != HttpStatus.ok) {
        emit(StateError(message: res.body));
        return;
      }

      final json = jsonDecode(utf8.decode(res.bodyBytes));
      print(json);
      final product = Product.fromJson(json);
      emit(GetProductStateSuccess(product: product));
    });
  }
}

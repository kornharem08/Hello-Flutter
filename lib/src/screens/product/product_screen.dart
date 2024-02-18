// ignore_for_file: prefer_final_fields, unused_field, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_helloworld/src/bloc/product/product_bloc.dart';
import 'package:flutter_helloworld/src/bloc/common_bloc.dart';
import 'package:flutter_helloworld/src/screens/product/product_details_screen.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<ProductBloc>().add(GetProductsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: BlocConsumer<ProductBloc, MyState>(
        builder: (context, state) {
          if (state is StateLoading) {
            return Text(state.toString());
          } else if (state is GetProductsStateSuccess) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                return ListTile(
                    title: Text(state.products[index].title),
                    subtitle:
                        Text('ราคาสินค้า ${state.products[index].price} บาท'),
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(state.products[index].image),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetailScreen(
                                  product: state.products[index])));
                    });
              },
            );
          }
          return Container();
        },
        listener: (context, state) {
          if (state is StateError) {
            print(state);
          }
        },
      ),
    );
  }
}

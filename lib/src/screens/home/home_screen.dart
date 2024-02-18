// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_helloworld/src/screens/home/widget/catagory.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final _selectedCategoryNotifier = ValueNotifier<String?>(null);

  @override
  Widget build(BuildContext context) {
    final categories = [
      'Hotels',
      'Flights',
      'Cars',
      'Experiences',
      'foods',
    ];
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          MyCatagory(
              categories: categories,
              onCategorySelected: (categorie) {
                _updateSelectedCategory(categorie);
              }),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: _selectedCategoryNotifier,
              builder: (context, selectedCategory, child) =>
                  Text('Selected category: $selectedCategory'),
            ),
          )
        ],
      ),
    );
  }

  void _updateSelectedCategory(String categorie) {
    _selectedCategoryNotifier.value = categorie;
  }
}

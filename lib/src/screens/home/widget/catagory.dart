import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class MyCatagory extends StatefulWidget {
  final List<String> categories;
  final Function(String) onCategorySelected;
  const MyCatagory({
    super.key,
    required this.categories,
    required this.onCategorySelected,
  });

  @override
  State<MyCatagory> createState() => _MyCatagoryState();
}

class _MyCatagoryState extends State<MyCatagory> {
  String? selectedCategory;
  @override
  Widget build(BuildContext context) {
    final categories = widget.categories;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Categories',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w800),
          ),
        ),
        const SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: SizedBox(
            height: 100.0,
            child: ListView.builder(
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final category = categories[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = category;
                      });
                      widget.onCategorySelected(category);
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 56,
                          height: 56,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.grey[200], // Use a neutral color
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            // Choose an icon based on category (e.g., MaterialIcons.hotel for "Hotels")
                            getIconData(category.toLowerCase()),
                            size: 30.0,
                            color: Colors.black, // Adjust color as needed
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          category,
                          style: const TextStyle(fontSize: 14.0),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

// Add a function to map categories to icon data
IconData getIconData(String category) {
  switch (category.toLowerCase()) {
    case 'hotels':
      return MingCute.building_1_line;
    case 'flights':
      return MingCute.flight_takeoff_line;
    case 'cars':
      return MingCute.jeep_line;
    case 'experiences':
      return MingCute.star_2_line;
    case 'foods':
      return MingCute.cookie_line;
    default:
      return MingCute.question_line;
  }
}

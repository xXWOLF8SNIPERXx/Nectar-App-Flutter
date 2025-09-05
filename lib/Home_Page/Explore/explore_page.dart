import 'package:flutter/material.dart';
import 'package:nectar_ui/core/constants/app_images.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        "title": "Fresh Fruits & Vegetable",
        "image": AppImages.vegetables,
        "color": Colors.greenAccent,
      },
      {
        "title": "Cooking Oil & Ghee",
        "image": AppImages.oil,
        "color": Colors.yellowAccent,
      },
      {
        "title": "Meat & Fish",
        "image": AppImages.meat,
        "color": Colors.redAccent,
      },
      {
        "title": "Bakery & Snacks",
        "image": AppImages.bakery,
        "color": Colors.orangeAccent,
      },
      {
        "title": "Dairy & Eggs",
        "image": AppImages.dairy,
        "color": Colors.purpleAccent,
      },
      {
        "title": "Beverages",
        "image": AppImages.beverages,
        "color": Colors.blueAccent,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Find Products",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Search Store",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final cat = categories[index];
                  final bgColor = (cat["color"] as Color);
                  return Container(
                    decoration: BoxDecoration(
                      color: bgColor.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: bgColor.withValues(alpha: 0.4)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(cat["image"] as String, height: 70),
                        const SizedBox(height: 12),
                        Text(
                          cat["title"] as String,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

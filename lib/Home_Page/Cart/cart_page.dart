import 'package:flutter/material.dart';
import 'package:nectar_ui/core/constants/app_images.dart';
import 'package:nectar_ui/Home_Page/Cart/cart_checkout.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<Map<String, dynamic>> items = [
    {
      "title": "Bell Pepper Red",
      "subtitle": "1kg, Price",
      "image": AppImages.peppercart,
      "price": 4.99,
      "quantity": 1,
    },
    {
      "title": "Egg Chicken Red",
      "subtitle": "8pcs, Price",
      "image": AppImages.eggcart,
      "price": 1.99,
      "quantity": 1,
    },
    {
      "title": "Organic Bananas",
      "subtitle": "10kg, Price",
      "image": AppImages.bananacart,
      "price": 3.00,
      "quantity": 1,
    },
    {
      "title": "Ginger",
      "subtitle": "250gm, Price",
      "image": AppImages.gingercart,
      "price": 2.99,
      "quantity": 1,
    },
  ];

  double get total {
    return items.fold(
      0,
      (sum, item) =>
          sum + (item["price"] as double) * (item["quantity"] as int),
    );
  }

  void increaseQuantity(int index) {
    setState(() {
      items[index]["quantity"]++;
    });
  }

  void decreaseQuantity(int index) {
    setState(() {
      if (items[index]["quantity"] > 1) {
        items[index]["quantity"]--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.only(
              top: 55,
              left: 16,
              right: 16,
              bottom: 32,
            ),
            color: Colors.white,
            child: const Center(
              child: Text(
                "My Cart",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Divider(color: Colors.grey.shade300, thickness: 1, height: 1),

          // Cart list
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: items.length,
              separatorBuilder: (context, index) =>
                  Divider(thickness: 1, color: Colors.grey.shade300),
              itemBuilder: (context, index) {
                final item = items[index];
                return buildCartItem(
                  item["title"] as String,
                  item["subtitle"] as String,
                  item["image"] as String,
                  item["price"] as double,
                  item["quantity"] as int,
                  index,
                );
              },
            ),
          ),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) => CheckoutScreen(total: total),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Go to Checkout",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 21),
                        Text(
                          '\$${total.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCartItem(
    String title,
    String subtitle,
    String imagePath,
    double price,
    int quantity,
    int index,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Image.asset(imagePath, width: 60, height: 60),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(subtitle, style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 10),

                Row(
                  children: [
                    GestureDetector(
                      onTap: () => decreaseQuantity(index),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(17),
                          border: Border.all(color: Color(0xFFE2E2E2)),
                        ),
                        child: Icon(Icons.remove, color: Color(0xFF7C7C7C)),
                      ),
                    ),
                    const SizedBox(width: 20),

                    Text(
                      "$quantity",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 20),

                    GestureDetector(
                      onTap: () => increaseQuantity(index),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(17),
                          border: Border.all(color: Color(0xFFE2E2E2)),
                        ),
                        child: Icon(Icons.add, color: Color(0xFF53B175)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          Text(
            "\$${(price * quantity).toStringAsFixed(2)}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

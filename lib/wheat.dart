import 'package:flutter/material.dart';
import 'package:internshipproject2/midel/listviewmodel.dart';
import 'package:internshipproject2/productdetailwheatbag.dart';
import 'midel/wheatsgridview.dart';

class Wheat extends StatefulWidget {
  const Wheat({super.key});

  @override
  State<Wheat> createState() => _WheatState();
}

class _WheatState extends State<Wheat> {
  // Brand list
  List<listviewmodel> list1 = [
    listviewmodel(image: "assets/images/brand1.png", name: "brand"),
    listviewmodel(image: "assets/images/brand2.png", name: "brand"),
    listviewmodel(image: "assets/images/neon.png", name: "Neon"),
    listviewmodel(image: "assets/images/brand3.png", name: "brand"),
    listviewmodel(image: "assets/images/brand4.png", name: "brand"),
  ];

  // Product list
  List<ProductModel> products = [
    ProductModel(
      image: "assets/images/w3.png",
      name: "Premium Wheat Bag",
      price: "1200 Rs",
      oldPrice: "1600 Rs",
    ),
    ProductModel(
      image: "assets/images/w3.png",
      name: "Neon Wheat Pack",
      price: "950 Rs",
      oldPrice: "1100 Rs",
    ),
    ProductModel(
      image: "assets/images/w3.png",
      name: "Organic Wheat",
      price: "1450 Rs",
      oldPrice: "1700 Rs",
    ),
    ProductModel(
      image: "assets/images/w3.png",
      name: "Fresh Wheat Bag",
      price: "1000 Rs",
      oldPrice: "1300 Rs",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Top header
            Row(
              children: [
                Image.asset("assets/images/w1.png", width: 46, height: 43),
                const SizedBox(width: 8),
                const Text(
                  "Wheat",
                  style: TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: -1),
                )
              ],
            ),
            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 10),

            /// Brand row
            const Text(
              "Choose Brand",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: -1),
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: list1.length,
                itemBuilder: (context, index) {
                  final item = list1[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.grey[200],
                          backgroundImage: AssetImage(item.image),
                        ),
                        const SizedBox(height: 6),
                        Text(item.name, style: const TextStyle(fontSize: 12)),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            /// Section title
            const Text(
              "Neon's Wheats",
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: 18, letterSpacing: -1),
            ),

            const SizedBox(height: 10),

            /// Product Grid
            Expanded(
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 items per row
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.60,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Card(
                    color: const Color(0xffEEF0F6), // Grey background
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        /// Product Image (inside card but above white box)
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16)),
                          child: Image.asset(
                            product.image,
                            fit: BoxFit.cover,
                            height: 120,
                            width: double.infinity,
                          ),
                        ),

                        const SizedBox(height: 6),

                        /// White container for name, prices, heart, and button
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10,left: 10),
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(16),
                                  bottomRight: Radius.circular(16),
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// Product Name
                                  Text(
                                    product.name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600, fontSize: 14),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),

                                  const SizedBox(height: 6),

                                  /// Price + Old Price + Heart
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            product.price,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            product.oldPrice,
                                            style: const TextStyle(
                                              decoration: TextDecoration.lineThrough,
                                              color: Colors.grey,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                     IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border,))
                                    ],
                                  ),

                                  const Spacer(),

                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8)),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => ProductDetailsPage()),
                                        );
                                      },
                                      child: Text(
                                        product.buttonText,
                                        style: const TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

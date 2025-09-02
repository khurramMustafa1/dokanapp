import 'package:flutter/material.dart';
import 'package:internshipproject2/widgets/Textfield.dart';

import 'midel/wheatsgridview.dart' show ProductModel;
class saveditem extends StatelessWidget {
  saveditem({super.key});
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Saved Item",style: TextStyle(
          fontSize: 24,fontWeight: FontWeight.w700,letterSpacing: -1
        ),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          children: [
            SizedBox(height: 5,),
            TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.search),
                hintText: "Search",
                filled: true,
                fillColor: Color(0xFFEEF0F6),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 20,),
            Divider(),
            SizedBox(height: 20,),
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

                        const SizedBox(height: 2),

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

                                  const SizedBox(height: 2),

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

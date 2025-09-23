import 'package:flutter/material.dart';
import 'package:internshipproject2/midel/listviewmodel.dart';
import 'package:internshipproject2/productdetailwheatbag.dart';
import 'package:internshipproject2/services/servicebrand.dart'; // API service
import 'midel/brand.dart' show Brand; // ✅ ensure correct Brand model
import 'midel/wheatsgridview.dart';

class Wheat extends StatefulWidget {
  const Wheat({super.key});

  @override
  State<Wheat> createState() => _WheatState();
}

class _WheatState extends State<Wheat> {
  bool isLoading = true;
  List<Brand> brandList = [];

  // Product list (unchanged)
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
  void initState() {
    super.initState();
    fetchBrands();
  }

  Future<void> fetchBrands() async {
    try {
      final response = await BrandService.getBrands(); // returns Brandlist?

      if (response != null && response.brands != null) {
        setState(() {
          brandList = response.brands!; // ✅ directly assign
          isLoading = false;
        });

        // Debug log
        print("✔ Brands fetched: ${brandList.length}");
        for (var b in brandList) {
          print("➡ ${b.name} | ${b.image}");
        }
      } else {
        setState(() {
          isLoading = false;
        });
        print("❌ No brands found in API response");
      }
    } catch (e) {
      setState(() => isLoading = false);
      print("⚠️ Error fetching brands: $e");
    }
  }

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
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1,
                  ),
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
                fontSize: 18,
                fontWeight: FontWeight.w600,
                letterSpacing: -1,
              ),
            ),
            SizedBox(
              height: 100,
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : brandList.isEmpty
                  ? const Center(child: Text("No brands available"))
                  : ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: brandList.length,
                itemBuilder: (context, index) {
                  final brand = brandList[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.grey[200],
                          backgroundImage: brand.image != null
                              ? NetworkImage(brand.image!)
                              : null,
                          child: brand.image == null
                              ? const Icon(Icons.image_not_supported)
                              : null,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          brand.name ?? "",
                          style: const TextStyle(fontSize: 12),
                        ),
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
                fontWeight: FontWeight.w600,
                fontSize: 18,
                letterSpacing: -1,
              ),
            ),

            const SizedBox(height: 10),

            /// Product Grid (unchanged)
            Expanded(
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.60,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Card(
                    color: const Color(0xffEEF0F6),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                          child: Image.asset(
                            product.image,
                            fit: BoxFit.cover,
                            height: 120,
                            width: double.infinity,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Expanded(
                          child: Padding(
                            padding:
                            const EdgeInsets.only(right: 10, left: 10),
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                BorderRadius.all(Radius.circular(16)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            product.price,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            product.oldPrice,
                                            style: const TextStyle(
                                              decoration:
                                              TextDecoration.lineThrough,
                                              color: Colors.grey,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.favorite_border,
                                        ),
                                      )
                                    ],
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(8),
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ProductDetailsPage(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        product.buttonText,
                                        style: const TextStyle(
                                            color: Colors.white),
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

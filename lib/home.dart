import 'package:flutter/material.dart';
import 'package:internshipproject2/Widgets/textfield.dart';
import 'package:internshipproject2/midel/bannermodellist.dart';
import 'package:internshipproject2/midel/productlistmodel.dart';
import 'package:internshipproject2/notifications.dart';
import 'package:internshipproject2/productdetail.dart' show ProductDetailsPage;
import 'package:internshipproject2/provider/category.dart' show CategoryProvider;
import 'package:internshipproject2/provider/token.dart';
import 'package:internshipproject2/services/bannerservices.dart';
import 'package:internshipproject2/services/productsdervice.dart' show ProductService;
import 'package:internshipproject2/wheat.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';
import 'package:internshipproject2/midel/categorylisrmodel.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  bool isLoading = false;
  TextEditingController name = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<CategoryProvider>(context, listen: false).loadCategories());
  }

  @override
  Widget build(BuildContext context) {
    var tokenProvider = Provider.of<TokenProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Dokan",
          style: TextStyle(
            fontSize: 21.18,
            fontWeight: FontWeight.w400,
            color: Color(0xffFF5934),
            letterSpacing: -1.74,
            fontFamily: "KronaOne",
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.5),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => notification()),
                );
              },
              icon: Image.asset(
                'assets/images/alaram.png',
                height: 19.11,
                width: 17.62,
              ),
            ),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.5),
          child: IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/images/dot.png',
              height: 24,
              width: 24,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            LoadingOverlay(
              isLoading: isLoading,
              child: FutureProvider.value(
                value: BannerListService().getBanners(tokenProvider.getToken()),
                initialData: BannerlistModel(),
                builder: (context, child) {
                  BannerlistModel bannerListingModel =
                  context.watch<BannerlistModel>();
                  return bannerListingModel.banners == null
                      ? Center(child: CircularProgressIndicator())
                      : SizedBox(
                    height: 190,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: bannerListingModel.banners?.length ?? 0,
                      itemBuilder: (context, index) {
                        final item = bannerListingModel.banners![index];
                        return Padding(
                          padding: const EdgeInsets.only(
                            left: 24,
                            right: 24,
                          ),
                          child: Container(
                            width: 380,
                            height: 181,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(item.image ?? ''),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: customTextField(
                hintText: "Search",
                controller: name,
                prefixImage: "assets/images/serach.png",
              ),
            ),
            const SizedBox(height: 20),

            /// ✅ Category Grid from Backend
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: categoryProvider.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : categoryProvider.categoryModelList == null ||
                  categoryProvider.categoryModelList!.categories == null ||
                  categoryProvider
                      .categoryModelList!.categories!.isEmpty
                  ? const Center(child: Text("No categories found"))
                  : GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: categoryProvider
                    .categoryModelList!.categories!.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  final Category category = categoryProvider
                      .categoryModelList!.categories![index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Wheat()));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                "${category.name ?? "Unknown"} clicked")),
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.grey[200],
                          backgroundImage: (category.image != null &&
                              category.image!.isNotEmpty)
                              ? NetworkImage(category.image!)
                              : null,
                          child: (category.image == null ||
                              category.image!.isEmpty)
                              ? const Icon(Icons.image_not_supported)
                              : null,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          category.name ?? "Unnamed",
                          style: const TextStyle(fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            // 👇 Replace your "FutureBuilder<Productlistmodel?>" wala part with this
            Text("Recommended for you",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            FutureBuilder<Productlistmodel?>(
              future: ProductService().fetchProducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data == null || snapshot.data!.products == null || snapshot.data!.products!.isEmpty) {
                  return const Center(child: Text("No products found"));
                }

                final products = snapshot.data!.products!;

                return Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Column(
                    children: List.generate(
                      (products.length / 2).ceil(),
                          (rowIndex) {
                        final start = rowIndex * 2;
                        final end = (start + 2 <= products.length) ? start + 2 : products.length;
                        final rowProducts = products.sublist(start, end);

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            children: rowProducts.map((product) {
                              return Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProductDetailsPage(product: product),
                                      ),
                                    );
                                  },
                                  child: Stack(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(right: 10),
                                        height: 129,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          image: product.image != null
                                              ? DecorationImage(
                                            image: NetworkImage(product.image!),
                                            fit: BoxFit.cover,
                                          )
                                              : null,
                                          color: Colors.grey[200],
                                        ),
                                      ),
                                      Positioned(
                                        right: 10,
                                        top: 10,
                                        child: const CircleAvatar(
                                          backgroundColor: Colors.white,
                                          child: Icon(Icons.favorite_border, color: Colors.red),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),



          ],
        ),
      ),
    );
  }
}

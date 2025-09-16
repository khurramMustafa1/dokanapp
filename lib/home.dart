import 'package:flutter/material.dart';
import 'package:internshipproject2/Widgets/textfield.dart';
import 'package:internshipproject2/midel/bannermodellist.dart';
import 'package:internshipproject2/midel/gridviewmodel.dart';
import 'package:internshipproject2/notifications.dart';
import 'package:internshipproject2/provider/token.dart';
import 'package:internshipproject2/services/bannerservices.dart';
import 'package:internshipproject2/wheat.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  bool isLoading = false;
  TextEditingController name = TextEditingController();
  List<GridItem> items = [
    GridItem(name: "Rice", image: "assets/images/rice.png", page: Wheat()),
    GridItem(name: "Wheat", image: "assets/images/w.png", page: Wheat()),
    GridItem(name: "Oats", image: "assets/images/o.png", page: Wheat()),
    GridItem(name: "Barely", image: "assets/images/barely.png", page: Wheat()),
    GridItem(name: "Corn", image: "assets/images/corn.png", page: Wheat()),
    GridItem(name: "Wheat", image: "assets/images/w.png", page: Wheat()),
    GridItem(name: "Oats", image: "assets/images/o.png", page: Wheat()),
    GridItem(name: "Barely", image: "assets/images/barely.png", page: Wheat()),
    GridItem(name: "Corn", image: "assets/images/corn.png", page: Wheat()),
    GridItem(
      name: "Show All",
      image: "assets/images/showall.png",
      page: Wheat(),
    ),
  ];

  Widget build(BuildContext context) {
    var tokenProvider = Provider.of<TokenProvider>(context);
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
          // Image Button
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
                'assets/images/alaram.png', // Your image path
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
              'assets/images/dot.png', // Your image path
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
                  BannerlistModel bannerListingModel = context
                      .watch<BannerlistModel>();
                  return bannerListingModel.banners == null
                      ? Center(child: CircularProgressIndicator())
                      : SizedBox(
                          height: 190,
                          child: ListView.builder(
                            itemCount: bannerListingModel.banners?.length ?? 0,
                            itemBuilder: (context, index) {
                              final item = bannerListingModel.banners![index];
                              return Padding(
                                padding: const EdgeInsets.only(
                                  left: 24,
                                  right: 24,
                                ),
                                child: Expanded(
                                  child: Container(
                                    width: 380,
                                    height: 181,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: NetworkImage(item.image ?? ''),
                                        fit: BoxFit.cover,
                                      ),
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
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: customTextField(
                hintText: "Search",
                controller: name,
                prefixImage: "assets/images/serach.png",
              ),
            ),
            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                shrinkWrap: true,
                // 👈 so it doesn’t take full height
                physics: const NeverScrollableScrollPhysics(),
                // 👈 disable inner scroll
                itemCount: items.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5, // like in your pic → 5 items in a row
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  final item = items[index];
                  return GestureDetector(
                    onTap: () {
                      // 👇 what happens when user taps item
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("${item.name} clicked")),
                      );

                      // if you want to navigate to page:
                      if (item.page != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => item.page!),
                        );
                      }
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.grey[200],
                          backgroundImage: AssetImage(item.image),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          item.name,
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
            Padding(
              padding: const EdgeInsets.only(right: 170),
              child: Text(
                "Recommended for you",
                style: TextStyle(
                  fontSize: 18,
                  letterSpacing: -1,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Row(
                children: [
                  Image.asset("assets/images/111.png", height: 129, width: 167),
                  SizedBox(width: 10),
                  Image.asset("assets/images/111.png", height: 129, width: 167),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Row(
                children: [
                  Image.asset("assets/images/111.png", height: 129, width: 167),
                  SizedBox(width: 10),
                  Image.asset("assets/images/111.png", height: 129, width: 167),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

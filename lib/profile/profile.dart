import 'package:flutter/material.dart';
import 'package:internshipproject2/midel/menu.dart';
import 'package:internshipproject2/profile/profilesetting.dart' show account_setting;

class profile extends StatelessWidget {
  const profile({super.key});

  @override
  Widget build(BuildContext context) {
    // Menu items
    final List<MenuItemModel> menuItems = [
      MenuItemModel(name: "Account Settings", page: account_setting()),
      MenuItemModel(name: "Terms & Conditions", ),
      MenuItemModel(name: "Privacy Policy",),
      MenuItemModel(name: "Help & Support", ),
      MenuItemModel(name: "Rate Our App", ),
      MenuItemModel(name: "Logout"), // no page
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xffEEF0F6),
        elevation: 0,
        title: const Text(
          "Profile",
          style: TextStyle(color:Color(0xFF121212), fontSize: 24,
              fontWeight: FontWeight.w700, fontFamily: "Inter", letterSpacing: -1
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.more_vert, color: Colors.black),
          ),
        ],
      ),
      body: Column(
        children: [
          // Profile Card
          Container(
            color: Color(0xffEEF0F6),
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 6,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/images/profile1.png"),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Muhammad Wajahat",
                              style: TextStyle(color:Color(0xFF121212), fontSize: 18,
                                  fontWeight: FontWeight.w600, fontFamily: "Inter", letterSpacing: -1
                              ),
                            ),

                            Image.asset("assets/images/edit.png", width: 20,height: 20,)
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                          "mwajahat.038@gmail.com",
                          style: TextStyle(color:Color(0xffFF5934), fontSize: 14,
                              fontWeight: FontWeight.w500, fontFamily: "Inter", letterSpacing: -1
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "+44 647886434",
                          style: TextStyle(color:Color(0xFF121212), fontSize: 14,
                              fontWeight: FontWeight.w500, fontFamily: "Inter", letterSpacing: -1
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),

          SizedBox(height: 20,),

          // Menu List as Cards
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                final item = menuItems[index];
                final isLogout = index == menuItems.length - 1;
                return Card(
                  color: Color(0xffEEF0F6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 2,
                  child: ListTile(
                    title: Text(
                      item.name,
                      style: TextStyle(color:Color(0xFF121212), fontSize: 14,
                          fontWeight: FontWeight.w500, fontFamily: "Inter", letterSpacing: -1
                      ),
                    ),
                    trailing: isLogout
                        ? null
                        : const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      if (isLogout) {
                        // // Logout logic
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   const SnackBar(content: Text("Logged out")),
                        // );
                      } else if (item.page != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => item.page!),
                        );
                      }
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Dummy screen to test navigation
class DummyScreen extends StatelessWidget {
  final String title;
  const DummyScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text(
          "This is $title page",
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

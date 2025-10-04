import 'package:flutter/material.dart';
import 'package:internshipproject2/midel/menu.dart';
import 'package:internshipproject2/profile/privacy.dart';
import 'package:internshipproject2/profile/profilesetting.dart' show account_setting;
import 'package:internshipproject2/midel/profile.dart';
import 'package:internshipproject2/services/profile.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  User? user;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchProfile();
  }

  Future<void> _fetchProfile() async {
    try {
      final fetchedUser = await ProfileService.getProfile();
      setState(() {
        user = fetchedUser;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        user = null;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // NOTE: account_setting() called without a `user:` named parameter
    final List<MenuItemModel> menuItems = [
      MenuItemModel(name: "Account Settings", page: account_setting()), // <- no user param
      MenuItemModel(name: "Terms & Conditions"),
      MenuItemModel(name: "Privacy Policy",page: PrivacyPage()),
      MenuItemModel(name: "Help & Support"),
      MenuItemModel(name: "Rate Our App"),
      MenuItemModel(name: "Logout"),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xffEEF0F6),
        elevation: 0,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Color(0xFF121212),
            fontSize: 24,
            fontWeight: FontWeight.w700,
            fontFamily: "Inter",
            letterSpacing: -1,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.more_vert, color: Colors.black),
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
        children: [
          // Profile Card
          Container(
            color: const Color(0xffEEF0F6),
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
                    backgroundImage:
                    AssetImage("assets/images/profile1.png"),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              user?.name ?? "Guest User",
                              style: const TextStyle(
                                color: Color(0xFF121212),
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Inter",
                                letterSpacing: -1,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // navigate without passing named parameter
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => account_setting(),
                                  ),
                                );
                              },
                              child: Image.asset(
                                "assets/images/edit.png",
                                width: 20,
                                height: 20,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          user?.email ?? "No email",
                          style: const TextStyle(
                            color: Color(0xffFF5934),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Inter",
                            letterSpacing: -1,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          user?.phoneNumber ?? "No phone",
                          style: const TextStyle(
                            color: Color(0xFF121212),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Inter",
                            letterSpacing: -1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Menu List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                final item = menuItems[index];
                final isLogout = index == menuItems.length - 1;
                return Card(
                  color: const Color(0xffEEF0F6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 2,
                  child: ListTile(
                    title: Text(
                      item.name,
                      style: const TextStyle(
                        color: Color(0xFF121212),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Inter",
                        letterSpacing: -1,
                      ),
                    ),
                    trailing: isLogout
                        ? null
                        : const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      if (isLogout) {
                        // TODO: Logout logic
                      } else if (item.page != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => item.page!,
                          ),
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

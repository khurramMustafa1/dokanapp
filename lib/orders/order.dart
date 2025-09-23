import 'package:flutter/material.dart';
import 'package:internshipproject2/orders/canceeldorder.dart';
import 'package:internshipproject2/orders/complete.dart';
import 'package:internshipproject2/orders/pending.dart' show pending;

class order extends StatefulWidget {
  const order({Key? key}) : super(key: key);

  @override
  State<order> createState() => _orderState();
}

class _orderState extends State<order> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Orders",
          style: TextStyle(color:Color(0xFF121212), fontSize: 24,
              fontWeight: FontWeight.w700, fontFamily: "Inter", letterSpacing: -1
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFFEEF0F6),
              ),
              // background color of tab bar
              child: TabBar(
                dividerColor: Colors.white,
                controller: _tabController,
                isScrollable: false,
                labelPadding: const EdgeInsets.symmetric(horizontal: 8),

                labelStyle:TextStyle(color:Color(0xFFFF5934), fontSize: 14,
                    fontWeight: FontWeight.w500, fontFamily: "Inter", letterSpacing: -1),// selected text color

                unselectedLabelStyle:TextStyle(color:Color(0xff121212), fontSize: 14,
                    fontWeight: FontWeight.w500, fontFamily: "Inter", letterSpacing: -1),// unselected text color
                indicator: BoxDecoration(
                  color: Colors.white, // selected tab background color
                  borderRadius: BorderRadius.circular(8),
                ),
                indicatorColor: Colors.transparent,
                indicatorPadding:
                const EdgeInsets.symmetric(horizontal: -5, vertical: 6),
                tabs: const [
                  Tab(text: "Pending",),
                  Tab(text: "Completed"),
                  Tab(text: "Cancelled"),
                  Tab(text: "Processed"),
                ],
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          pending(),
          completed(),
          cancelled(),
          const Center(child: Text("Processed Orders")),
        ],
      ),
    );
  }
}

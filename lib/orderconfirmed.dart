import 'package:flutter/material.dart';
import 'package:internshipproject2/transctioncompleted.dart' show TransactionPage;
class ConfirmOrder extends StatefulWidget {
  final String userName;
  final List<Map<String, dynamic>> items;
  final int itemsPrice;
  final int discount;
  final int totalBill;

  const ConfirmOrder({
    super.key,
    required this.userName,
    required this.items,
    required this.itemsPrice,
    required this.discount,
    required this.totalBill,
  });

  @override
  State<ConfirmOrder> createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEF0F6),
      body: Column(
        children: [
          Stack(
            children: [
              Container(height: 500),
              Image.asset("assets/images/aaa.png"),
              Positioned(
                left: 55,
                top: 90,
                child: Image.asset("assets/images/confirmbg1.png", width: 90),
              ),
              Positioned(
                left: 50,
                child: Image.asset("assets/images/confirmbg2.png", width: 320),
              ),
              Positioned(
                top: 100,
                left: 0,
                child: Image.asset("assets/images/confirmbg2.png", width: 320),
              ),
              Positioned(
                top: 200,
                left: 190,
                child: Image.asset("assets/images/confirmbg1.png", width: 100),
              ),
              Positioned(
                top: 110,
                left: 127,
                child: Image.asset("assets/images/bgtruck.png",
                    height: 121, width: 121),
              ),

              /// Content
              Padding(
                padding:
                const EdgeInsets.only(right: 20, left: 20, top: 215),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Your Order Has Been Placed Successfully",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF121212),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Inter",
                        letterSpacing: -1,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Your order has been successfully placed and is on its way to being delivered. We appreciate your business and are excited to fulfill your purchase.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF121212),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Inter",
                        letterSpacing: -1,
                      ),
                    ),
                    const SizedBox(height: 24),

                    /// Order summary card
                    Container(
                      height: 338,
                      width: 338,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "Orders details",
                              style: TextStyle(
                                color: Color(0xFF121212),
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Inter",
                                letterSpacing: -1,
                              ),
                            ),
                          ),
                          const Divider(color: Color(0xffEEF0F6)),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                const Text("Order ID",
                                    style: TextStyle(
                                        color: Color(0x66000000),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500)),
                                Text(
                                  "#KR${DateTime.now().millisecondsSinceEpoch}",
                                  style: const TextStyle(
                                      color: Color(0xFF121212),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 16),
                                const Text("Number of Items",
                                    style: TextStyle(
                                        color: Color(0x66000000),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500)),
                                Text("${widget.items.length}",
                                    style: const TextStyle(
                                        color: Color(0xFF121212),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                                const SizedBox(height: 16),
                                const Text("Delivery Address",
                                    style: TextStyle(
                                        color: Color(0x66000000),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500)),
                                const Text(
                                    "SD-21, North Nazimabad, Karachi",
                                    style: TextStyle(
                                        color: Color(0xFF121212),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                                const SizedBox(height: 16),
                                const Text("Expected Delivery",
                                    style: TextStyle(
                                        color: Color(0x66000000),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500)),
                                const Text("Monday, 14 April",
                                    style: TextStyle(
                                        color: Color(0xFF121212),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),
                          const Divider(color: Color(0xffEEF0F6)),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Total",
                                    style: TextStyle(
                                        color: Color(0xff121212),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                                Text("${widget.totalBill} Rs",
                                    style: const TextStyle(
                                        color: Color(0xffFF5934),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 14),

          /// Bottom Buttons
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Color(0x33000000)),
              ),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 160.5,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF121212),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context); // ✅ back to Home
                    },
                    child: const Text(
                      "Home",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Inter",
                        letterSpacing: -1,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                SizedBox(
                  width: 160.5,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF5934),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TransactionPage(
                            userName: widget.userName,
                            items: widget.items,
                            itemsPrice: widget.itemsPrice,
                            discount: widget.discount,
                            totalBill: widget.totalBill,
                            reference:
                            "TXN-${DateTime.now().millisecondsSinceEpoch}",
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      "View Orders",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Inter",
                        letterSpacing: -1,
                      ),
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
}

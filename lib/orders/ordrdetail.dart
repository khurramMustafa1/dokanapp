import 'package:flutter/material.dart';
import '../midel/modellist.dart' show Order; // <-- use Orderlist model

class OrderDetail extends StatelessWidget {
  final Order order; // ✅ Correct: your inner class is Order

  const OrderDetail({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEF0F6),
      appBar: AppBar(
        backgroundColor: const Color(0xffEEF0F6),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Order Details",
                      style: TextStyle(
                        color: Color(0xFF121212),
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Inter",
                        letterSpacing: -1,
                      ),
                    ),
                    Image.asset(
                      "Assets/images/watsapp.png",
                      height: 24,
                      width: 24,
                    )
                  ],
                ),
                const SizedBox(height: 20),

                // Order Card
                Card(
                  color: const Color(0xffFFFFFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "Order Details",
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
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _detailRow("Order ID", order.orderNumber ?? order.id ?? ""),
                            _detailRow("Number of items", order.orderItems?.length.toString() ?? "0"),
                            _detailRow("Delivery Address", order.shippingAddress?.address ?? "No address"),
                            _detailRow(
                              "Expected Delivery",
                              order.deliveryDate != null
                                  ? order.deliveryDate!.toLocal().toString().split(" ")[0]
                                  : "Not set",
                            ),
                          ],
                        ),
                      ),

                      const Divider(color: Color(0xffEEF0F6)),

                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Total",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "${order.totalAmount ?? 0} Rs",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const Spacer(),

          // Bottom Buttons
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: Color(0x33000000))),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Download Invoice
                SizedBox(
                  width: 160.5,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF121212),
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      // TODO: Implement invoice download
                    },
                    child: const Text(
                      "Download Invoice",
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Inter",
                        letterSpacing: -1,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 6),

                // Cancel Order
                SizedBox(
                  width: 160.5,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF5934),
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      // TODO: Implement cancel order
                    },
                    child: const Text(
                      "Cancel Order",
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
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

  Widget _detailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
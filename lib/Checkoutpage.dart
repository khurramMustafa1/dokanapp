import 'package:flutter/material.dart';
import 'package:internshipproject2/midel/cartmodel.dart';
import 'package:internshipproject2/orderconfirmed.dart';
import 'package:internshipproject2/transctioncompleted.dart';

class CheckoutPage extends StatelessWidget {
  final List<CartItem> cartItems;
  final int totalPrice;

  const CheckoutPage({
    super.key,
    required this.cartItems,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    // 👉 dynamic values (name, discount, finalBill, items)
    String name = "Muhammad Wajahat"; // later you can fetch from login/session
    int discount = totalPrice > 5000 ? 300 : 0;
    int finalBill = totalPrice - discount;

    // convert cart items to simple map for TransactionCompleted
    List<Map<String, dynamic>> items = cartItems
        .map((e) => {
      "name": "${e.weight} ${e.title}",
      "qty": e.quantity,
    })
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      // ✅ AppBar (only title + back)
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Checkout",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Delivery Address",
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("SD-21, North Nazimabad, Karachi",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                      SizedBox(height: 4),
                      Text("Muhammad Wajahat"),
                      Text("+92321-6646491"),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // ✅ Items
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text("Items",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xffEEF0F6),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 6,
                        spreadRadius: 2,
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      // Product Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(item.image,
                            height: 60, width: 60, fit: BoxFit.cover),
                      ),
                      const SizedBox(width: 12),

                      // Title + Weight + Price
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            Text(item.weight,
                                style: TextStyle(color: Colors.grey[600])),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Text("${item.price} Rs",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red)),
                                const SizedBox(width: 8),
                                Text("${item.oldPrice} Rs",
                                    style: const TextStyle(
                                        decoration:
                                        TextDecoration.lineThrough,
                                        color: Colors.grey)),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Quantity only
                      Text("Quantity ${item.quantity}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                    ],
                  ),
                );
              },
            ),
          ),

          // ✅ Sales Person Section
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text("Sales Person",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage("assets/images/w3.png"),
                ),
                SizedBox(width: 12),
                Text("Ali Raza",
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),

      // ✅ Bottom Section (Final Price left + Button right)
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 4,
              spreadRadius: 1,
              offset: const Offset(0, -2),
            )
          ],
        ),
        child: Row(
          children: [
            // Final Price (bottom left)
            Text(
              "Total: $totalPrice Rs",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.red),
            ),
            const Spacer(),
            // Place Order Button
            SizedBox(
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConfirmOrder(userName: name, items: items, itemsPrice: totalPrice, discount: discount, totalBill: totalPrice)
                  ),
                );
              },

                child: const Text(
                  "Place Order",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

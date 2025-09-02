import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:internshipproject2/Checkoutpage.dart';
import 'package:internshipproject2/midel/cartmodel.dart';
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartItem> cartItems = [
    CartItem(
      image: "assets/images/w3.png",
      title: "Wheat Grain Bag",
      weight: "x 10 Kg",
      price: 1200,
      oldPrice: 1600,
      quantity: 3,
    ),
    CartItem(
      image: "assets/images/w3.png",
      title: "Wheat Grain Bag",
      weight: "x 10 Kg",
      price: 1200,
      oldPrice: 1600,
      quantity: 1,
    ),
    CartItem(
      image: "assets/images/w3.png",
      title: "Wheat Grain Bag",
      weight: "x 10 Kg",
      price: 1200,
      oldPrice: 1600,
      quantity: 2,
    ),
  ];

  int get totalPrice {
    return cartItems.fold(
        0, (sum, item) => sum + (item.price * item.quantity));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Slidable(
                  key: ValueKey(item.title + index.toString()),
                  endActionPane: ActionPane(
                    motion: const DrawerMotion(),
                    extentRatio: 0.25,
                    children: [
                      SlidableAction(
                        onPressed: (_) {
                          setState(() {
                            cartItems.removeAt(index);
                          });
                        },
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                      ],
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Color(0xffEEF0F6),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(item.image, height: 60, width: 60),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item.title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
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
                                          color: Colors.grey,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove_circle_outline),
                                onPressed: () {
                                  setState(() {
                                    if (item.quantity > 1) {
                                      item.quantity--;
                                    }
                                  });
                                },
                              ),
                              Text(item.quantity.toString(),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              IconButton(
                                icon: const Icon(Icons.add_circle_outline),
                                onPressed: () {
                                  setState(() {
                                    item.quantity++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // ✅ Total & Buy Now
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(color: Colors.grey.shade200),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Total"),
                    Text(
                      "$totalPrice Rs",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.red),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CheckoutPage(
                          cartItems: cartItems,
                          totalPrice: totalPrice,
                        ),
                      ),
                    );
                  },
                  child: const Text("Buy Now",style: TextStyle(color: Colors.white),),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

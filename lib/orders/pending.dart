
import 'package:flutter/material.dart' show StatefulWidget, State, Key, BuildContext, Widget, Center, EdgeInsets, Color, TextStyle, SizedBox, Text, VerticalDivider, ConnectionState, CircularProgressIndicator, ListView, BorderRadius, RoundedRectangleBorder, MainAxisAlignment, CrossAxisAlignment, FontWeight, Column, Container, Row, BoxDecoration, Padding, Card, Navigator, MaterialPageRoute, InkWell, FutureBuilder;
import 'package:internshipproject2/midel/modellist.dart';
import 'package:internshipproject2/orders/ordrdetail.dart';
import 'package:internshipproject2/provider/token.dart';
import 'package:internshipproject2/services/orderservices.dart';
import 'package:provider/provider.dart';

class pending extends StatefulWidget {
  const pending({Key? key}) : super(key: key);

  @override
  State<pending> createState() => _pendingState();
}

class _pendingState extends State<pending> {
  late Future<Orderlist> _futureOrders;

  @override
  void initState() {
    super.initState();
    // Don’t load API here directly, wait until we get token from provider in build()
  }

  @override
  Widget build(BuildContext context) {
    final tokenProvider = Provider.of<Token>(context);
    final token = tokenProvider.getToken(); // ✅ get token from login

    if (token == null || token.isEmpty) {
      return const Center(child: Text("No token found. Please login again."));
    }

    // Call API when token is available
    _futureOrders = OrderService().getPendingOrders(token);

    return FutureBuilder<Orderlist>(
      future: _futureOrders,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        }

        if (!snapshot.hasData || snapshot.data!.orders!.isEmpty) {
          return const Center(child: Text("No pending orders"));
        }

        final orders = snapshot.data!.orders!;

        return ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderDetail(order: order), // ✅ pass correct order
                  ),
                );
              },
              child: Card(
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: const Color(0xFFEEF0F6),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Left Column
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ID # ${order.orderNumber ?? order.id}",
                            style: const TextStyle(
                              color: Color(0xFF121212),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Inter",
                              letterSpacing: -1,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            "${order.orderItems?.length ?? 0} items",
                            style: const TextStyle(
                              color: Color(0x66000000),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Inter",
                              letterSpacing: -1,
                            ),
                          ),
                          Text(
                            order.shippingAddress?.address ?? "No address",
                            style: const TextStyle(
                              color: Color(0x66000000),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Inter",
                              letterSpacing: -1,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Amount",
                                    style: TextStyle(
                                      color: Color(0x66000000),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Inter",
                                      letterSpacing: -1,
                                    ),
                                  ),
                                  Text(
                                    "${order.totalAmount ?? 0} Rs",
                                    style: const TextStyle(
                                      color: Color(0xFFFF5934),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Inter",
                                      letterSpacing: -1,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 19),
                              Container(
                                height: 30,
                                child: const VerticalDivider(
                                  color: Color(0x40000000),
                                  thickness: 1,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Expected Delivery",
                                    style: TextStyle(
                                      color: Color(0x66000000),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Inter",
                                      letterSpacing: -1,
                                    ),
                                  ),
                                  Text(
                                    order.deliveryDate != null
                                        ? "${order.deliveryDate!.toLocal()}".split(" ")[0]
                                        : "Not set",
                                    style: const TextStyle(
                                      color: Color(0xff121212),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Inter",
                                      letterSpacing: -1,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0x17000000),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          order.status ?? "Pending",
                          style: const TextStyle(
                            color: Color(0xff121212),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Inter",
                            letterSpacing: -1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
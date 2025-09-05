import 'package:flutter/material.dart';
import 'package:internshipproject2/midel/ordermodel.dart' show OrderModel;
import 'package:internshipproject2/orders/ordrdetail.dart';
class pending extends StatefulWidget {
  pending({Key? key}) : super(key: key);

  @override
  State<pending> createState() => _pendingState();
}

class _pendingState extends State<pending> {
  final List<OrderModel> _orders = [
    OrderModel(
      orderId: "KR21241",
      items: 3,
      address: "SD-21, North Nazimabad, Karachi",
      amount: 1200,
      deliveryDate: "Monday, 14 April",
      status: "Pending",
    ),
    OrderModel(
      orderId: "KR21242",
      items: 5,
      address: "Gulshan-e-Iqbal, Karachi",
      amount: 7400,
      deliveryDate: "Tuesday, 15 April",
      status: "Pending",
    ),
    OrderModel(
      orderId: "KR21243",
      items: 2,
      address: "Clifton Block 5, Karachi",
      amount: 2400,
      deliveryDate: "Wednesday, 16 April",
      status: "Pending",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: _orders.length,
      itemBuilder: (context, index) {
        final order = _orders[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => order_Detail(order: order)),
            );
          },
          child: Card(
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            color: Color(0xFFEEF0F6),
            //elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Order ID + Status
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("ID # ${order.orderId}",
                            style: TextStyle(color:Color(0xFF121212), fontSize: 14,
                                fontWeight: FontWeight.w500, fontFamily: "Inter", letterSpacing: -1
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text("${order.items} items",
                        style: TextStyle(color:Color(0x66000000), fontSize: 12,
                            fontWeight: FontWeight.w500, fontFamily: "Inter", letterSpacing: -1
                        ),),
                      Text(order.address,
                        style: TextStyle(color:Color(0x66000000), fontSize: 12,
                            fontWeight: FontWeight.w500, fontFamily: "Inter", letterSpacing: -1
                        ),),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Amount",
                                style: TextStyle(color:Color(0x66000000), fontSize: 12,
                                    fontWeight: FontWeight.w500, fontFamily: "Inter", letterSpacing: -1
                                ),
                              ),
                              Text(
                                "${order.amount} Rs",
                                style: TextStyle(color:Color(0xFFFF5934), fontSize: 16,
                                    fontWeight: FontWeight.w600, fontFamily: "Inter", letterSpacing: -1
                                ),
                              ),

                            ],
                          ),
                          SizedBox(width: 19,),

                          Container(
                            height: 30, // adjust height
                            child: const VerticalDivider(
                              color: Color(0x40000000), // divider color
                              thickness: 1,       // line thickness
                            ),
                          ),

                          SizedBox(width: 6,),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Expected Delivery",
                                style: TextStyle(color:Color(0x66000000), fontSize: 12,
                                    fontWeight: FontWeight.w500, fontFamily: "Inter", letterSpacing: -1
                                ),),
                              Text(
                                order.deliveryDate,
                                style: TextStyle(color:Color(0xff121212), fontSize: 14,
                                    fontWeight: FontWeight.w500, fontFamily: "Inter", letterSpacing: -1
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Color(0x17000000),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      order.status,
                      style: TextStyle(color:Color(0xff121212), fontSize: 12,
                          fontWeight: FontWeight.w500, fontFamily: "Inter", letterSpacing: -1
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
  }
}

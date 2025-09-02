import 'package:dotted_line/dotted_line.dart' show DottedLine;
import 'package:flutter/material.dart';

class TransactionPage extends StatelessWidget {
  final String userName;
  final List<Map<String, dynamic>> items;
  final int itemsPrice;
  final int discount;
  final int totalBill;
  final String reference;

  const TransactionPage({
    super.key,
    required this.userName,
    required this.items,
    required this.itemsPrice,
    required this.discount,
    required this.totalBill,
    required this.reference,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: SafeArea(
        child: Column(
          children: [
            // White container (receipt)
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                     Stack(
                       alignment: Alignment.center,
                       children: [
                         Container(),
                         const Text(
                           "Dokan",textAlign: TextAlign.center,
                           style: TextStyle(
                             fontSize: 28,
                             fontWeight: FontWeight.bold,
                             color: Colors.redAccent,
                           ),
                         ),
                         Positioned(
                           top: 27,
                           left: 178,
                           child: const Text(
                             "Lorem Ipsum",
                             style: TextStyle(fontSize: 12, color: Colors.black54),
                           ),
                         ),
                       ],
                     ),
                    const Text(
                      "Transaction Completed",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "11:13 03-09-2023",
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                    const SizedBox(height: 16),

                    // Price Box
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "$totalBill Rs",
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: DottedLine(
                        dashLength: 6,   // length of each dash
                        dashGapLength: 4, // gap between dashes
                        lineThickness: 1,
                        dashColor: Colors.grey,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                        child: ListView(
                          children: [
                            Row(
                              children: [
                                const Expanded(
                                  child: Text("Paid by:",
                                      style: TextStyle(fontWeight: FontWeight.bold)),
                                ),
                                Text(userName),
                              ],
                            ),
                            const SizedBox(height: 8),
                            const Text("Items:",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 8),

                            // ✅ Items aligned left/right
                            ...items.map((item) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        item['name'],
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ),
                                    Text(
                                      "x${item['qty']}",
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                              );
                            }),

                            const SizedBox(height: 12),
                            Row(
                              children: [
                                const Expanded(child: Text("Items Price:")),
                                Text("$itemsPrice Rs"),
                              ],
                            ),
                            Row(
                              children: [
                                const Expanded(child: Text("Discount:")),
                                Text("-$discount Rs"),
                              ],
                            ),
                            Row(
                              children: [
                                const Expanded(
                                    child: Text("Total Bill:",
                                        style: TextStyle(fontWeight: FontWeight.bold))),
                                Text(
                                  "$totalBill Rs",
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: DottedLine(
                                dashLength: 6,   // length of each dash
                                dashGapLength: 4, // gap between dashes
                                lineThickness: 1,
                                dashColor: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Center(
                              child: Text("Reference: $reference",
                                  style: const TextStyle(fontSize: 12)),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // ✅ Zigzag at bottom of container
                    ClipPath(
                      clipper: ZigZagClipper(),
                      child: Container(
                        height: 25,
                        color: Color(0xffFF5934),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Buttons outside
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
                  Expanded(
                    child: SizedBox(
                      width: 160,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF121212),
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text("Share",style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SizedBox(
                      width: 160.5,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffFF5934),
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text("Download",style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ✅ Zigzag clipper
class ZigZagClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const double zigzagHeight = 10.0;
    const double zigzagWidth = 15.0;

    final Path path = Path();
    path.moveTo(0, 0);

    for (double x = 0; x < size.width; x += zigzagWidth) {
      path.lineTo(x + zigzagWidth / 2, zigzagHeight);
      path.lineTo(x + zigzagWidth, 0);
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

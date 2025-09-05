class OrderModel {
  final String orderId;
  final int items;
  final String address;
  final int amount;
  final String deliveryDate;
  final String status;

  OrderModel({
    required this.orderId,
    required this.items,
    required this.address,
    required this.amount,
    required this.deliveryDate,
    required this.status,
  });
}

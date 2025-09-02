// ✅ Model
class CartItem {
  final String image;
  final String title;
  final String weight;
  final int price;
  final int oldPrice;
  int quantity;

  CartItem({
    required this.image,
    required this.title,
    required this.weight,
    required this.price,
    required this.oldPrice,
    this.quantity = 1,
  });
}
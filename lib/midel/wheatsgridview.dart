class ProductModel {
  final String image;      // product image
  final String name;       // product name (e.g. "Wheat Grain Bag")
  final String price;      // current price (e.g. "1200 Rs")
  final String oldPrice;   // old price (e.g. "1600 Rs")
  final String buttonText;

  ProductModel({
    required this.image,
    required this.name,
    required this.price,
    required this.oldPrice,
    this.buttonText = "Buy Now", // default value
  });
}

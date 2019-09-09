class CartProduct {
  final String id;
  final String productId;
  final String title;
  final int quantity;
  final double price;

  const CartProduct(
      {this.id, this.title, this.quantity, this.price, this.productId});
}

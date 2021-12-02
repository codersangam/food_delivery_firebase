class ProductModel {
  String? productId;
  String? productName;
  String? productImageUrl;
  String? productPrice;
  List<dynamic>? productUnit;

  ProductModel(
      {this.productId,
      this.productName,
      this.productImageUrl,
      this.productPrice,
      this.productUnit});
}

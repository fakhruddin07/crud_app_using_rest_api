class Product {
  final String id;
  final String productName;
  final String productCode;
  final String productImage;
  final String unitPrice;
  final String quantity;
  final String totalPrice;
  final String createdDate;

  Product(
    this.id,
    this.productName,
    this.productCode,
    this.productImage,
    this.unitPrice,
    this.quantity,
    this.totalPrice,
    this.createdDate,
  );

  factory Product.toJson(Map<String, dynamic> e){
    return Product(
      e["_id"],
      e["ProductName"],
      e["ProductCode"],
      e["Img"],
      e["UnitPrice"],
      e["Qty"],
      e["TotalPrice"],
      e["CreatedDate"],
    );
  }
}

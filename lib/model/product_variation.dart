// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:slash/model/product_property_and_value.dart';

class ProductVariation {
  final int id;
  final int productId;
  final num price;
  final int quantity;
  final bool inStock; //to enable/disable addToCart button
  final List<String> productVarientImages;
  final List<ProductPropertyAndValue> productPropertiesValues;

  ProductVariation({
    required this.id,
    required this.productId,
    required this.price,
    required this.quantity,
    required this.inStock,
    required this.productVarientImages,
    required this.productPropertiesValues,
  });
}

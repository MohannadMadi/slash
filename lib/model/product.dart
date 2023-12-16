// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:slash/model/product_property_and_value.dart';
import 'package:slash/model/product_variation.dart';

class Product {
  final int id;
  final String name;
  final String description;
  final int brandId;
  final String? brandName;
  final String? brandLogoUrl;
  final double rating;
  final List<ProductVariation> variations;
  final List<ProductPropertyAndValue>
      availableProperties; //What properties are offered //(multiple colors or non, multiple sizes or non, materials)

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.brandId,
    this.brandName,
    this.brandLogoUrl,
    required this.rating,
    required this.variations,
    required this.availableProperties,
  });
}

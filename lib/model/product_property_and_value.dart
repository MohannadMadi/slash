// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductPropertyAndValue {
  final String property; //color, or size, or material
  final String
      value; //if property is color, value may be: #008000(hex for Green)
  ProductPropertyAndValue({
    required this.property,
    required this.value,
  });
  //if property is size, value may be: XL
}

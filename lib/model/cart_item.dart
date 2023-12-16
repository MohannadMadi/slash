// ignore_for_file: public_member_api_docs, sort_constructors_first
class CartItem {
  int? id;
  int productVariationId;
  int quantity; //user can add one or multiple items of the same product variation at once
  CartItem({
    this.id,
    required this.productVariationId,
    required this.quantity,
  });
}

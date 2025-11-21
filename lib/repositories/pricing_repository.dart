class PricingRepository {
  /// Simple pricing helper.
  ///
  /// Calculates total price for `quantity` sandwiches.
  /// If [isFootlong] is true, the unit price is 11, otherwise 7.
  int calculate(int quantity, bool isFootlong) {
    final int unitPrice = isFootlong ? 11 : 7;
    if (quantity <= 0) return 0;
    return unitPrice * quantity;
  }
}
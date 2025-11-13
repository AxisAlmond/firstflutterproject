class OrderRepository {
  int _quantity = 0;
  final int maxQuantity;

  OrderRepository({required this.maxQuantity});

  int get quantity => _quantity;

  bool get canIncrement => _quantity < maxQuantity;
  bool get canDecrement => _quantity > 0;

  void increment() {
    if (canIncrement) {
      _quantity++;
    }
  }

  void decrement() {
    if (canDecrement) {
      _quantity--;
    }
  }
}


class PricingRepository {
  int _price = 0;
  int _quantity = 0;
  bool type = false;

  int get quantity => _quantity;

  int calculate(quantity, type) {
    if (type) {
      int _price = 5;
    }
    else{
      int _price = 8;
    }
    return(_price * _quantity);
  }
}
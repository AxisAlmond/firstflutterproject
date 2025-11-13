import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/repositories/order_repository.dart';

void main() {
  group('OrderRepository', () {
    test('initial quantity should be 0', () {
      final repository = OrderRepository(maxQuantity: 5);
      expect(repository.quantity, 0);
    });

    test('increment should increase quantity by 1', () {
      final repository = OrderRepository(maxQuantity: 5);
      repository.increment();
      expect(repository.quantity, 1);
    });

    test('decrement should decrease quantity by 1', () {
      final repository = OrderRepository(maxQuantity: 5);
      repository.increment(); // quantity is now 1
      repository.decrement(); // quantity is now 0
      expect(repository.quantity, 0);
    });

    test('quantity should not exceed maxQuantity', () {
      final repository = OrderRepository(maxQuantity: 2);
      repository.increment(); // quantity is 1
      repository.increment(); // quantity is 2
      repository.increment(); // should not change
      expect(repository.quantity, 2);
    });

    test('quantity should not go below 0', () {
      final repository = OrderRepository(maxQuantity: 5);
      repository.decrement(); // should not change
      expect(repository.quantity, 0);
    });
  });
  
  group('PricingRepository', () {
    test('footlong price calculation (unit price 11)', () {
      final pricing = PricingRepository();
      // 3 footlong sandwiches -> 3 * 11 = 33
      expect(pricing.calculate(3, true), 33);
    });

    test('six-inch price calculation (unit price 7)', () {
      final pricing = PricingRepository();
      // 2 six-inch sandwiches -> 2 * 7 = 14
      expect(pricing.calculate(2, false), 14);
    });

    test('zero quantity returns 0', () {
      final pricing = PricingRepository();
      expect(pricing.calculate(0, true), 0);
      expect(pricing.calculate(0, false), 0);
    });

    test('negative quantity treated as zero (returns 0)', () {
      final pricing = PricingRepository();
      expect(pricing.calculate(-1, true), 0);
    });
  });
}
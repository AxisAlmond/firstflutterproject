import 'package:sandwich_shop/repositories/pricing_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
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

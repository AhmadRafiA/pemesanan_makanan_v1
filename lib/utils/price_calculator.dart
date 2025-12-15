class PriceCalculator {
  static const double serviceChargeRate = 0.075; // 7.5%
  static const double pb1Rate = 0.10;            // 10%

  static int calculateServiceCharge(int subtotal) {
    return (subtotal * serviceChargeRate).round();
  }

  static int calculatePB1(int subtotalPlusService) {
    return (subtotalPlusService * pb1Rate).round();
  }

  static Map<String, int> calculateTotal(int subtotal) {
    final serviceCharge = calculateServiceCharge(subtotal);
    final afterService = subtotal + serviceCharge;
    final pb1 = calculatePB1(afterService);
    final total = afterService + pb1;

    return {
      'subtotal': subtotal,
      'serviceCharge': serviceCharge,
      'pb1': pb1,
      'total': total,
    };
  }
}

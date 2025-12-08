import 'package:flutter/material.dart';

class Voucher {
  final String code;
  final String description;
  final double discountAmount;

  Voucher({
    required this.code,
    required this.description,
    required this.discountAmount,
  });
}

class VoucherModel extends ChangeNotifier {
  Voucher? _appliedVoucher;

  Voucher? get appliedVoucher => _appliedVoucher;

  double get discount => _appliedVoucher?.discountAmount ?? 0.0;

  void applyVoucher(Voucher voucher) {
    _appliedVoucher = voucher;
    notifyListeners();
  }

  void clearVoucher() {
    _appliedVoucher = null;
    notifyListeners();
  }
}

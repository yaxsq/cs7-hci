import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:hci_app/src/features/models/voucher_model.dart';
import 'package:hci_app/generated/app_localizations.dart';
import 'package:hci_app/src/core/widgets/custom_button.dart';

class VoucherSelectionPage extends StatefulWidget {
  const VoucherSelectionPage({super.key});

  @override
  State<VoucherSelectionPage> createState() => _VoucherSelectionPageState();
}

class _VoucherSelectionPageState extends State<VoucherSelectionPage> {
  final TextEditingController _voucherController = TextEditingController();

  // Mock data for available vouchers
  final List<Voucher> _availableVouchers = [
    Voucher(code: 'SAVE10', description: 'Get \$10 off on your order', discountAmount: 10.0),
    Voucher(code: 'FREEDELIVERY', description: 'Free delivery on your order', discountAmount: 5.0),
    Voucher(code: 'WINTER20', description: '20% off for winter season (max \$15)', discountAmount: 15.0),
  ];

  void _applyAndGoBack(Voucher voucher) {
    Provider.of<VoucherModel>(context, listen: false).applyVoucher(voucher);
    if (context.canPop()) {
      context.pop();
    }
  }

  void _validateAndApplyManualCode() {
    final localizations = AppLocalizations.of(context)!;
    final code = _voucherController.text.trim().toUpperCase();
    if (code.isEmpty) return;

    try {
      final voucher = _availableVouchers.firstWhere((v) => v.code == code);
      _applyAndGoBack(voucher);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(localizations.invalidVoucher),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.addVoucher),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => GoRouter.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(localizations.enterVoucherCode, style: theme.textTheme.titleLarge),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextField(
                    controller: _voucherController,
                    decoration: InputDecoration(
                      hintText: 'e.g., SAVE10',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  height: 50,
                  child: CustomButton(
                    text: localizations.apply,
                    onPressed: _validateAndApplyManualCode,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Divider(color: theme.dividerColor),
            const SizedBox(height: 16),
            Text(localizations.availableVouchers, style: theme.textTheme.titleLarge),
            const SizedBox(height: 16),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _availableVouchers.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final voucher = _availableVouchers[index];
                return _buildVoucherCard(theme, voucher);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVoucherCard(ThemeData theme, Voucher voucher) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () => _applyAndGoBack(voucher),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(Icons.local_offer_outlined, color: theme.colorScheme.tertiary, size: 30),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(voucher.code, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(voucher.description, style: theme.textTheme.bodyMedium),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _voucherController.dispose();
    super.dispose();
  }
}

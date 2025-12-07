import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hci_app/src/core/widgets/custom_button.dart';
import 'package:hci_app/src/core/widgets/custom_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hci_app/generated/app_localizations.dart';

class AccountSetupPage extends StatefulWidget {
  const AccountSetupPage({super.key});

  @override
  State<AccountSetupPage> createState() => _AccountSetupPageState();
}

class _AccountSetupPageState extends State<AccountSetupPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  Future<void> _onContinue() async {
    if (_formKey.currentState!.validate()) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('userName', _nameController.text);
      await prefs.setString('userEmail', _emailController.text);
      await prefs.setString('userPhone', _phoneController.text);
      await prefs.setString('userAddress', _addressController.text);
      await prefs.setBool('hasCompletedSetup', true);

      if (mounted) {
        context.go('/');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.accountTitle),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                localizations.createAccountTitle,
                style: theme.textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                localizations.createAccountSubtitle,
                style: theme.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              CustomTextField(
                controller: _nameController,
                hintText: localizations.fullNameHint,
                prefixIcon: const Icon(Icons.person_outline),
                validator: (value) =>
                    value!.isEmpty ? localizations.nameValidator : null,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _emailController,
                hintText: localizations.emailHint,
                prefixIcon: const Icon(Icons.email_outlined),
                keyboardType: TextInputType.emailAddress,
                validator: (value) =>
                    value!.isEmpty ? localizations.emailValidator : null,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _phoneController,
                hintText: localizations.phoneHint,
                prefixIcon: const Icon(Icons.phone_outlined),
                keyboardType: TextInputType.phone,
                validator: (value) =>
                    value!.isEmpty ? localizations.phoneValidator : null,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _addressController,
                hintText: localizations.addressHint,
                prefixIcon: const Icon(Icons.location_on_outlined),
                validator: (value) =>
                    value!.isEmpty ? localizations.addressValidator : null,
              ),
              const SizedBox(height: 32),
              CustomButton(
                text: localizations.continueButton,
                onPressed: _onContinue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

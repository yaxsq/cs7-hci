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
      // In a real app, you would save this data.
      // For now, we just mark the setup as complete.
      final prefs = await SharedPreferences.getInstance();
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
                "Create Your Account", // This should be localized
                style: theme.textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                "Let's get you set up for a seamless shopping experience.", // This should be localized
                style: theme.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              CustomTextField(
                controller: _nameController,
                hintText: "Full Name",
                prefixIcon: const Icon(Icons.person_outline),
                validator: (value) =>
                    value!.isEmpty ? "Please enter your name" : null,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _emailController,
                hintText: "Email Address",
                prefixIcon: const Icon(Icons.email_outlined),
                keyboardType: TextInputType.emailAddress,
                validator: (value) =>
                    value!.isEmpty ? "Please enter your email" : null,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _phoneController,
                hintText: "Phone Number",
                prefixIcon: const Icon(Icons.phone_outlined),
                keyboardType: TextInputType.phone,
                validator: (value) =>
                    value!.isEmpty ? "Please enter your phone number" : null,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _addressController,
                hintText: "Delivery Address",
                prefixIcon: const Icon(Icons.location_on_outlined),
                validator: (value) =>
                    value!.isEmpty ? "Please enter your address" : null,
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

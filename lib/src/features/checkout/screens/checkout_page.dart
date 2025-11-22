// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Checkout'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.dark(
            primary: Color(0xFF4CAF50), // Green for stepper
          ),
        ),
        child: Stepper(
          type: StepperType.horizontal,
          currentStep: _currentStep,
          onStepContinue: () {
            if (_currentStep < 2) {
              setState(() {
                _currentStep += 1;
              });
            } else {
              // Complete the checkout
            }
          },
          onStepCancel: () {
            if (_currentStep > 0) {
              setState(() {
                _currentStep -= 1;
              });
            }
          },
          steps: [
            Step(
              title: const Text('Address'),
              content: _buildAddressStep(),
              isActive: _currentStep >= 0,
              state: _currentStep > 0 ? StepState.complete : StepState.indexed,
            ),
            Step(
              title: const Text('Payment'),
              content: _buildPaymentStep(),
              isActive: _currentStep >= 1,
              state: _currentStep > 1 ? StepState.complete : StepState.indexed,
            ),
            Step(
              title: const Text('Review'),
              content: _buildReviewStep(),
              isActive: _currentStep >= 2,
              state: _currentStep >= 2 ? StepState.complete : StepState.indexed,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressStep() {
    return Column(
      children: [
        const Text('Select a delivery address:', style: TextStyle(color: Colors.white)),
        const SizedBox(height: 16),
        RadioListTile(
          title: const Text('Home', style: TextStyle(color: Colors.white)),
          subtitle: const Text('123 Green Grocer Lane, Freshville, 90210', style: TextStyle(color: Colors.white70)),
          value: 1,
          groupValue: 1, // Example value
          onChanged: (value) {},
          activeColor: const Color(0xFF4CAF50),
        ),
        RadioListTile(
          title: const Text('Work', style: TextStyle(color: Colors.white)),
          subtitle: const Text('456 Business Park Ave, Suite 500, Metro City, 10001', style: TextStyle(color: Colors.white70)),
          value: 2,
          groupValue: 1, // Example value
          onChanged: (value) {},
          activeColor: const Color(0xFF4CAF50),
        ),
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add, color: Color(0xFF4CAF50)),
          label: const Text('Add New Address', style: TextStyle(color: Color(0xFF4CAF50))),
        )
      ],
    );
  }

  Widget _buildPaymentStep() {
    return Column(
      children: [
        const Text('Select a payment method:', style: TextStyle(color: Colors.white)),
        const SizedBox(height: 16),
        RadioListTile(
          title: const Text('Visa **** 1234', style: TextStyle(color: Colors.white)),
          value: 1,
          groupValue: 1, // Example value
          onChanged: (value) {},
          activeColor: const Color(0xFF4CAF50),
          secondary: const Icon(Icons.credit_card, color: Colors.white),
        ),
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add, color: Color(0xFF4CAF50)),
          label: const Text('Add New Payment Method', style: TextStyle(color: Color(0xFF4CAF50))),
        )
      ],
    );
  }

  Widget _buildReviewStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Review your order:', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        const Text('Delivery Address:', style: TextStyle(color: Colors.white70)),
        const Text('123 Green Grocer Lane, Freshville, 90210', style: TextStyle(color: Colors.white)),
        const SizedBox(height: 16),
        const Text('Payment Method:', style: TextStyle(color: Colors.white70)),
        const Text('Visa **** 1234', style: TextStyle(color: Colors.white)),
        const SizedBox(height: 16),
        const Text('Order Summary:', style: TextStyle(color: Colors.white70)),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal (3 items)', style: TextStyle(color: Colors.white)),
            Text('\$28.55', style: TextStyle(color: Colors.white)),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Delivery Fee', style: TextStyle(color: Colors.white)),
            Text('\$3.99', style: TextStyle(color: Colors.white)),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Taxes & Fees', style: TextStyle(color: Colors.white)),
            Text('\$1.96', style: TextStyle(color: Colors.white)),
          ],
        ),
        const Divider(color: Colors.grey),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
            Text('\$34.50', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
          ],
        ),
      ],
    );
  }
}

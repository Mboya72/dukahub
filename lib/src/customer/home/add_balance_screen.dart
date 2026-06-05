import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class AddBalanceScreen extends StatefulWidget {
  const AddBalanceScreen({super.key});

  @override
  State<AddBalanceScreen> createState() => _AddBalanceScreenState();
}

class _AddBalanceScreenState extends State<AddBalanceScreen> {
  final TextEditingController _amountController = TextEditingController();
  String? _selectedMethod = 'M-Pesa';

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: AppTheme.primaryDark, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Add Balance',
          style: textTheme.titleLarge?.copyWith(color: AppTheme.primaryDark, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter Amount (Ksh)',
              style: textTheme.bodyMedium?.copyWith(color: AppTheme.primaryDark, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              style: textTheme.headlineMedium?.copyWith(color: AppTheme.primaryDark, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                hintText: '0.00',
                prefixText: 'Ksh ',
                prefixStyle: textTheme.headlineMedium?.copyWith(color: AppTheme.primaryDark, fontWeight: FontWeight.bold),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              ),
            ),
            const SizedBox(height: 16),

            // Quick selection row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: ['500', '1000', '2000', '5000'].map((amt) {
                return InkWell(
                  onTap: () => setState(() => _amountController.text = amt),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppTheme.borderColor),
                    ),
                    child: Text('+$amt', style: const TextStyle(fontWeight: FontWeight.bold, color: AppTheme.primaryDark)),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 32),

            Text(
              'Select Payment Method',
              style: textTheme.bodyMedium?.copyWith(color: AppTheme.primaryDark, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildPaymentMethodTile('M-Pesa', Icons.phone_android_rounded),
            _buildPaymentMethodTile('Bank Transfer / Card', Icons.credit_card_rounded),

            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Trigger STK push / load action here
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF10CE5F), // Success Green matching your metrics card
                foregroundColor: AppTheme.primaryDark,
                minimumSize: const Size(double.infinity, 54),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 0,
              ),
              child: const Text('Confirm Deposit', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethodTile(String name, IconData icon) {
    final isSelected = _selectedMethod == name;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isSelected ? AppTheme.primaryDark : Colors.transparent, width: 1.5),
      ),
      child: RadioListTile<String>(
        value: name,
        groupValue: _selectedMethod,
        activeColor: AppTheme.primaryDark,
        title: Row(
          children: [
            Icon(icon, color: AppTheme.primaryDark),
            const SizedBox(width: 12),
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold, color: AppTheme.primaryDark)),
          ],
        ),
        onChanged: (val) => setState(() => _selectedMethod = val),
      ),
    );
  }
}
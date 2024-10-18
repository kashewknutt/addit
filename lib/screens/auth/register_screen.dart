import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/common/custom_input.dart';
import '../../widgets/common/custom_button.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _usernameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _otpController = TextEditingController();
  bool _isOtpSent = false;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Register',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            CustomInput(
              controller: _usernameController,
              hintText: 'Enter Username',
            ),
            SizedBox(height: 16),
            CustomInput(
              controller: _isOtpSent ? _otpController : _phoneController,
              hintText: _isOtpSent ? 'Enter OTP' : 'Enter Phone Number',
              keyboardType: _isOtpSent ? TextInputType.number : TextInputType.phone,
            ),
            SizedBox(height: 16),
            CustomButton(
              text: _isOtpSent ? 'Verify OTP' : 'Send OTP',
              onPressed: () {
                if (_isOtpSent) {
                  int otp = int.parse(_otpController.text);
                  authProvider.verifyOtp(otp);
                } else {
                  authProvider.registerUser(_usernameController.text, _phoneController.text);
                  setState(() {
                    _isOtpSent = true;
                  });
                }
              },
            ),
            if (authProvider.isOtpVerified)
              Text('Registration Successful!', style: TextStyle(color: Colors.green)),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  String? _userId;
  bool _isLoggedIn = false;
  String? _phoneNumber;
  bool _isOtpSent = false;
  bool _isOtpVerified = false;

  bool get isLoggedIn => _isLoggedIn;
  bool get isOtpSent => _isOtpSent;
  bool get isOtpVerified => _isOtpVerified;
  String? get userId => _userId;

  // Register the user with phone number
  void registerUser(String username, String phoneNumber) {
    _phoneNumber = phoneNumber;
    _userId = _authService.registerUser(username, phoneNumber);
    _isOtpSent = true;
    notifyListeners();
  }

  // Verify OTP
  void verifyOtp(int otp) {
    if (_authService.verifyOtp(_phoneNumber!, otp)) {
      _isOtpVerified = true;
      _isLoggedIn = true;
    } else {
      _isOtpVerified = false;
    }
    notifyListeners();
  }

  // Log out the user
  void logout() {
    _isLoggedIn = false;
    _isOtpSent = false;
    _isOtpVerified = false;
    _userId = null;
    notifyListeners();
  }
}

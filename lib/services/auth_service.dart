import 'dart:math';

class AuthService {
  final Map<String, String> _users = {}; // Store phone numbers and user IDs
  final Map<String, int> _otps = {}; // Store OTPs for phone numbers
  
  // Register user with phone number and generate OTP
  String registerUser(String username, String phoneNumber) {
    String userId = _generateUserId();
    _users[phoneNumber] = userId;
    int otp = _generateOtp();
    _otps[phoneNumber] = otp;
    print("OTP for $phoneNumber is $otp"); // Simulate sending OTP
    return userId;
  }

  // Verify OTP
  bool verifyOtp(String phoneNumber, int otp) {
    if (_otps.containsKey(phoneNumber) && _otps[phoneNumber] == otp) {
      _otps.remove(phoneNumber); // Clear OTP after verification
      return true;
    }
    return false;
  }

  // Helper function to generate a user ID
  String _generateUserId() {
    return Random().nextInt(10000).toString();
  }

  // Helper function to generate an OTP
  int _generateOtp() {
    return Random().nextInt(9000) + 1000; // OTP of 4 digits
  }
}

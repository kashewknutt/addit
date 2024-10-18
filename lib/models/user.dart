class User {
  final String id;
  final String username;
  final String phoneNumber;  // Changed from email to phoneNumber
  final int? otp;  // OTP for phone number verification
  
  User({
    required this.id,
    required this.username,
    required this.phoneNumber,
    this.otp,
  });
}

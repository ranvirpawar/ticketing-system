class LoginRequest {
  final String email;
  final String password;

  LoginRequest({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'email_id': email,
      'password': password,
    };
  }
}

class LoginResponse {
  final String token;
  // Add other fields from the API response

  LoginResponse({
    required this.token,
    // Initialize other fields
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['token'],
      // Assign other fields from the JSON
    );
  }
}

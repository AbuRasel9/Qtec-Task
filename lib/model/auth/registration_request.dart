
import 'dart:convert';

RegistrationRequest registrationRequestFromJson(String str) => RegistrationRequest.fromJson(json.decode(str));

String registrationRequestToJson(RegistrationRequest data) => json.encode(data.toJson());

class RegistrationRequest {
  String? name;
  String? email;
  String? password;
  String? phone;
  String? confirmPassword;

  RegistrationRequest({
    this.name,
    this.email,
    this.password,
    this.phone,
    this.confirmPassword,
  });

  RegistrationRequest copyWith({
    String? name,
    String? email,
    String? password,
    String? phone,
    String? confirmPassword,
  }) =>
      RegistrationRequest(
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        phone: phone ?? this.phone,
        confirmPassword: confirmPassword ?? this.confirmPassword,
      );

  factory RegistrationRequest.fromJson(Map<String, dynamic> json) => RegistrationRequest(
    name: json["name"],
    email: json["email"],
    password: json["password"],
    phone: json["phone"],
    confirmPassword: json["confirmPassword"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "password": password,
    "phone": phone,
    "confirmPassword": confirmPassword,
  };
}

class User {
  final String name;
  final String surname;
  final String email;
  final String password;

  User({
    required this.name,
    required this.surname,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'first_name': name,
      'second_name': surname,
      'email': email,
      'password': password,
    };
  }
}

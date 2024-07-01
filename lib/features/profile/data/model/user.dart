import 'package:allservice/features/profile/data/model/executor.dart';

class User {
  final int id;
  final String firstName;
  final String secondName;
  final String email;
  final String contact;
  final bool isExecutor;
  final Executor executor;
  final String? photo;

  User({
    required this.id,
    required this.firstName,
    required this.secondName,
    required this.email,
    required this.contact,
    required this.isExecutor,
    required this.executor,
    required this.photo,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['first_name'],
      secondName: json['second_name'],
      email: json['email'],
      contact: json['contact'],
      isExecutor: json['is_executor'],
      executor: Executor.fromJson(json['executor_data']),
      photo: json['photo'],
    );
  }
}

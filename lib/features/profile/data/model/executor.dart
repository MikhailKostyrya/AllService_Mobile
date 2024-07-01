class Executor {
  final String content;
  final String contactExecutor;
  final String inn;

  Executor({
    required this.content,
    required this.contactExecutor,
    required this.inn,
  });

  factory Executor.fromJson(Map<String, dynamic> json) {
    return Executor(
      content: json['content'],
      contactExecutor: json['contact_executor'],
      inn: json['inn'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'contact_executor': contactExecutor,
      'inn': inn,
    };
  }
}

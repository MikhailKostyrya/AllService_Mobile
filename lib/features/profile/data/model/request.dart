class Request {
  final int id;
  final Status status;
  final String address;
  final String createDate;
  final String dateTimes;
  final int user;
  final int service;

  Request({
    required this.id,
    required this.status,
    required this.address,
    required this.createDate,
    required this.dateTimes,
    required this.user,
    required this.service,
  });

  factory Request.fromJson(Map<String, dynamic> json) {
    return Request(
      id: json['id'],
      status: _parseStatus(json['status']),
      address: json['address'],
      createDate: json['create_date'],
      dateTimes: json['date_times'],
      user: json['user'],
      service: json['service'],
    );
  }

  static Status _parseStatus(String status) {
    switch (status) {
      case 'pending':
        return Status.pending;
      case 'approved':
        return Status.approved;
      case 'rejected':
        return Status.rejected;
      case 'completed':
        return Status.completed;
      default:
        throw ArgumentError('Unknown status: $status');
    }
  }
}

enum Status {
  pending,
  approved,
  rejected,
  completed,
}

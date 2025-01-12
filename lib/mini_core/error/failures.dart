abstract class Failure {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  final String statusMessage;
  final int? statusCode;

  const ServerFailure({
    required this.statusMessage,
    this.statusCode,
  }) : super(statusMessage);

  // Define fromJson method to create ServerFailure from a Map (JSON)
  factory ServerFailure.fromJson(Map<String, dynamic> json) {
    return ServerFailure(
      statusMessage: json['message'] ?? 'Unknown error', // Or any fallback string
      statusCode: json['status_code'], // Handle null values gracefully
    );
  }
}

class CacheFailure extends Failure {
  const CacheFailure(String message) : super(message);
}
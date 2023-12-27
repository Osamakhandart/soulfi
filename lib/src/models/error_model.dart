class ApiError {
  final int statusCode;
  final List<String> messages;
  final String error;

  ApiError({
    required this.statusCode,
    required this.messages,
    required this.error,
  });

  factory ApiError.fromJson(Map<String, dynamic> json) {
    return ApiError(
      statusCode: json['statusCode'] ?? 500,
      messages: (json['message']['message'] as List<dynamic>)
          .map((message) => message.toString())
          .toList(),
      error: json['message']['error'] ?? 'Unknown error',
    );
  }
}

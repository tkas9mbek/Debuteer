import 'package:flutter/foundation.dart';

@immutable
class ClientResponse {
  const ClientResponse({
    required this.status,
    this.data,
    this.errorCode,
    this.message,
    this.error,
  });

  final bool status;
  final dynamic data;
  final int? errorCode;
  final String? message;
  final Object? error;

  @override
  String toString() => 'ClientResponse{status: $status, data: $data, errorCode: $errorCode, message: $message, error: $error}';
}

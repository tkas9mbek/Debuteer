import 'package:flutter/foundation.dart';

import 'client_response.dart';

@immutable
class ProviderResponse<T> {
  const ProviderResponse({
    required this.status,
    this.data,
    this.errorCode,
    this.message,
  });

  factory ProviderResponse.fromResponse(ClientResponse response, {
    T? data,
  }) => ProviderResponse(
    status: response.status,
    data: data ?? (response.data as T),
    errorCode: response.errorCode,
    message: response.message,
  );

  final bool status;
  final T? data;
  final int? errorCode;
  final String? message;

  @override
  String toString() => 'ProviderResponse{ status: $status, data: $data, errorCode: $errorCode, message: $message,}';
}

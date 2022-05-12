import 'dart:io';

import 'package:dio/dio.dart';

import '../value/constants.dart';
import 'client_response.dart';

enum Method {
  get,
  post,
  put,
  patch,
  delete,
}

class MyClient {
  static final MyClient _instance = MyClient._internal();
  factory MyClient() => _instance;

  MyClient._internal() {
    _dio = Dio(_options);

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Do something before request is sent
          return handler.next(options); //continue
          // If you want to resolve the request with some custom data，
          // you can resolve a `Response` object eg: `handler.resolve(response)`.
          // If you want to reject the request with a error message,
          // you can reject a `DioError` object eg: `handler.reject(dioError)`
        },
        onResponse: (response, handler) {
          // Do something with response data
          return handler.next(response); // continue
          // If you want to reject the request with a error message,
          // you can reject a `DioError` object eg: `handler.reject(dioError)`
        },
        onError: (DioError e, handler) {
          // Do something with response error
          return handler.next(e); //continue
          // If you want to resolve the request with some custom data，
          // you can resolve a `Response` object eg: `handler.resolve(response)`.
        },
      ),
    );
  }

  late Dio _dio;
  final BaseOptions _options = BaseOptions(
    baseUrl: BACKEND_API,
    connectTimeout: 30000,
    receiveTimeout: 15000,
  );

  Future<ClientResponse> call(
    String uri, {
    required Method method,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    Response response;

    try {
      switch (method) {
        case Method.get:
          response = await _dio.get<dynamic>(
            uri,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress,
          );
          break;
        case Method.post:
          response = await _dio.post<dynamic>(
            uri,
            data: data,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress,
            onSendProgress: onSendProgress,
          );
          break;
        case Method.put:
          response = await _dio.put<dynamic>(
            uri,
            data: data,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress,
            onSendProgress: onSendProgress,
          );
          break;
        case Method.patch:
          response = await _dio.patch<dynamic>(
            uri,
            data: data,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress,
            onSendProgress: onSendProgress,
          );
          break;
        case Method.delete:
          response = await _dio.delete<dynamic>(
            uri,
            data: data,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
          );
          break;
      }

      return ClientResponse(
        status: true,
        data: response.data,
        message: response.statusMessage,
      );
    } on SocketException catch (e) {
      return ClientResponse(
        status: false,
        message: e.message,
        errorCode: -1,
        error: e,
      );
    } on DioError catch (e) {
      return ClientResponse(
        status: false,
        message: e.response?.data.toString() ?? e.message,
        errorCode: e.response?.statusCode,
        error: e,
      );
    } catch (e) {
      return ClientResponse(
        status: false,
        message: e.toString(),
        errorCode: 0,
        error: e,
      );
    }
  }

  Future<ClientResponse> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async =>
      call(
        uri,
        method: Method.get,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

  Future<ClientResponse> post(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async =>
      call(
        uri,
        method: Method.post,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      );

  Future<ClientResponse> put(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async =>
      call(
        uri,
        method: Method.put,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      );

  Future<ClientResponse> patch(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async =>
      call(
        uri,
        method: Method.patch,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      );

  Future<ClientResponse> delete(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async =>
      call(
        uri,
        method: Method.delete,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
}

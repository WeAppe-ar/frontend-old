import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:http_handler/http_handler.dart';

/// Thrown if an exception occurs while making an http request.
class HttpException implements Exception {}

/// {@template http_request_failure}
/// Thrown if an http request returns a non-200 status code.
/// {@endtemplate}
class HttpRequestFailure implements Exception {
  /// {@macro http_request_failure}
  const HttpRequestFailure(this.statusCode, this.error);

  /// The status code of the response.
  final int statusCode;

  /// The error message of the response.
  final String error;

  @override
  String toString() =>
      'HttpRequestFailure(statusCode: $statusCode, error: $error)';
}

/// A class that contains the error gotten from the backend methods.
class ExceptionResponse with EquatableMixin implements Exception {
  /// Creates a new instance of the [ExceptionResponse] class.
  const ExceptionResponse({
    this.statusCode,
    this.message,
  });

  /// Creates a new instance of the [ExceptionResponse] class from a JSON
  factory ExceptionResponse.fromMap(Map<String, dynamic> map) {
    return ExceptionResponse(
      statusCode: (map['statusCode'] as num?)?.toInt() ?? 500,
      message: map['message'] as String?,
    );
  }

  /// The status code of the response.
  final int? statusCode;

  /// The error message of the response.
  final String? message;

  @override
  String toString() =>
      'ExceptionResponse(statusCode: $statusCode, message: $message)';

  @override
  List<Object?> get props => [statusCode, message];
}

/// Thrown when an error occurs while decoding the response body.
class JsonDecodeException implements Exception {}

/// Thrown when an error occurs while decoding the response body.
class SpecifiedTypeNotMatchedException implements Exception {}

/// Thrown when an unknown error occurs.
class UnknownException implements Exception {}

/// Class to handle http requests.
class HttpHandler extends Equatable {
  /// constructor of the [HttpHandler] class.
  HttpHandler({String? token}) : _token = token;

  final String? _token;

  final _httpClient = http.Client();

  /// This method is used to make a GET request.
  Future<T> httpGet<T>(Uri uri) async {
    http.Response response;

    try {
      response = await _httpClient.get(
        uri,
        headers: {
          if (_token != null) 'Authorization': 'Bearer $_token',
        },
      );
    } catch (_) {
      throw HttpException();
    }

    return _handleResponse<T>(response);
  }

  /// This method is used to make a POST request.
  Future<T> httpPost<T>(
    Uri uri, {
    Map<String, dynamic>? body,
    Map<String, String>? queryParams,
  }) async {
    http.Response response;

    try {
      response = await _httpClient.post(
        uri,
        body: body,
        headers: {
          if (_token != null) 'Authorization': 'Bearer $_token',
        },
      );
    } catch (_) {
      throw HttpException();
    }

    return _handleResponse<T>(response);
  }

  /// This method is used to make a PUT request.
  Future<T> httpPut<T>(
    Uri uri, {
    Map<String, dynamic>? body,
  }) async {
    http.Response response;

    try {
      response = await _httpClient.put(
        uri,
        body: (body != null) ? jsonEncode(body) : null,
        headers: {
          if (_token != null) 'Authorization': 'Bearer $_token',
        },
      );
    } catch (_) {
      throw HttpException();
    }

    return _handleResponse<T>(response);
  }

  /// This method is used to make a DELETE request.
  Future<T> httpDelete<T>(
    Uri uri, {
    Map<String, dynamic>? body,
  }) async {
    http.Response response;

    try {
      response = await _httpClient.delete(
        uri,
        body: (body != null) ? jsonEncode(body) : null,
        headers: {
          if (_token != null) 'Authorization': 'Bearer $_token',
        },
      );
    } catch (_) {
      throw HttpException();
    }

    return _handleResponse<T>(response);
  }

  T _handleResponse<T>(http.Response response) {
    try {
      if (response is T) return response as T;

      final dynamic decodedResponse = jsonDecode(response.body);

      if (response.isFailure && decodedResponse is Map<String, dynamic>) {
        if (decodedResponse.containsKey('exception')) {
          throw ExceptionResponse.fromMap(decodedResponse);
        }
        throw HttpRequestFailure(
          response.statusCode,
          response.reasonPhrase ?? '',
        );
      }

      if (decodedResponse is T) return decodedResponse;

      try {
        if (T is JSON) {
          (decodedResponse as Map).cast<String, dynamic>() as T;
        }
        return decodedResponse as T;
      } catch (_) {
        throw SpecifiedTypeNotMatchedException();
      }
    } on FormatException {
      throw JsonDecodeException();
    }
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}

/// A class to make it easier to handle the response from the API.
extension Result on http.Response {
  /// Returns true if the response is a success.
  bool get isSuccess => statusCode >= 200 && statusCode < 300;

  /// Returns true if the response is a failure.
  bool get isFailure => !isSuccess;
}

/// Generates an [Exception] from a [String] or an already [Exception].
extension ExceptionFromObject on Object {
  /// Generates an [Exception] from a [String] or an already [Exception].
  Exception get toException {
    if (this is Exception) {
      return this as Exception;
    }
    return Exception(toString());
  }
}

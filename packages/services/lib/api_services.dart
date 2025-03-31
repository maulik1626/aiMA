// ignore_for_file: depend_on_referenced_packages
// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:http_parser/http_parser.dart' show MediaType;

class ResponseCodes {
  static const int APIServices_EXCEPTION = -1;
  static const int SUCCESS = 200;
  static const int CREATED = 201;
  static const int NO_CONTENT = 204;
  static const int TEMPORARY_REDIRECT = 302;
  static const int BAD_REQUEST = 400;
  static const int UNAUTHORIZED = 401;
  static const int FORBIDDEN = 403;
  static const int NOT_FOUND = 404;
  static const int TOO_MANY_REQUESTS = 429;
  static const int INTERNAL_SERVER_ERROR = 500;
  static const int BAD_GATEWAY = 502;
  static const int SERVICE_UNAVAILABLE = 503;
  static const int GATEWAY_TIMEOUT = 504;
}

class APIServices {
  /// Makes a multipart POST request to the specified endpoint.
  ///
  /// The [endPoint] parameter is required and should be the API endpoint to communicate with.
  ///
  /// The [body] parameter is optional and represents additional data to include in the request.
  /// It can be a Map<String, String> or any other JSON-encodable object.
  ///
  /// The [file] parameter is required and should be a list of files to be included in the request.
  ///
  /// Returns a Future containing a map with the status code and response body.
  ///
  /// Example:
  /// ```dart
  /// final response = await APIServices.postMultiPart(
  ///   endPoint: 'https://example.com/upload',
  ///   body: {'key': 'value'},
  ///   files: [File('path/to/file')],
  /// );
  /// print('Status Code: ${response['statusCode']}');
  /// print('Response Body: ${response['responseBody']}');
  /// ```
  static Future<Map<String, dynamic>> postMultiPart({
    required String endPoint,
    required dynamic body,
    File? file,
    String? token,
  }) async {
    // Validate required parameters
    ArgumentError.checkNotNull(endPoint, 'endPoint');

    log('Communicating with endpoint: $endPoint');
    log('Body: ${jsonEncode(body)}');
    try {
      // Create a multipart request
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(endPoint),
      );

      if (file != null) {
        // Add files to the request
        request.files.add(await http.MultipartFile.fromPath(
          'profile_image',
          file.path,
          filename: 'profile_picture.jpeg',
          contentType: MediaType('image', 'jpeg'),
        ));
        log('File added to request. filename: ${file.path}');
      }

      // Add headers
      final Map<String, String> headers = (token != null)
          ? {
              'Content-Type': 'multipart/form-data',
              'Authorization': 'Bearer $token'
            }
          : {'Content-Type': 'multipart/form-data'};
      request.headers.addAll(headers);

      // Add body if present
      if (body != null) {
        request.fields.addAll(body);
      } else {
        Map<String, String> body = {};
        request.fields.addAll(body);
      }

      log('Request Headers: ${request.headers}');
      log('Request Body: ${request.fields}');
      log('Request Files: ${request.files}');
      log('Request: $request');

      // Send the request with a timeout of 30 seconds
      final streamedResponse =
          await request.send().timeout(const Duration(seconds: 30));

      // Get the response
      final response = await http.Response.fromStream(streamedResponse);

      // Log response details
      log('Response Status Code: ${streamedResponse.statusCode}');
      log('Response Body: ${response.body}');

      // Return status code and response body as a map
      return {
        "statusCode": streamedResponse.statusCode,
        "responseBody": jsonDecode(response.body),
      };
    } on TimeoutException catch (e, stackTrace) {
      log('Stacktrace: $stackTrace');
      // Handle timeout exception
      log('TimeoutException: $e');
      return {
        "statusCode": -1,
        "responseBody": {"error": "Request timed out."},
      };
    } on SocketException catch (e, stackTrace) {
      log('Stacktrace: $stackTrace');
      // Handle network-related exception
      log('SocketException: $e');
      return {
        "statusCode": -1,
        "responseBody": {
          "error": "Network error. Please check your internet connection."
        },
      };
    } on http.ClientException catch (e, stackTrace) {
      log('Stacktrace: $stackTrace');
      // Handle client-related exception
      log('ClientException: $e');
      return {
        "statusCode": -1,
        "responseBody": {"error": "An error occurred during the request."},
      };
    } catch (e, stackTrace) {
      log('Stacktrace: $stackTrace');
      // Handle other unexpected exceptions
      log('Error in postMultiPart: $e');
      return {
        "statusCode": -1,
        "responseBody": {"error": "An unexpected error occurred."},
      };
    }
  }

  /// Makes a multipart POST request to the specified endpoint.
  ///
  /// The [endPoint] parameter is required and should be the API endpoint to communicate with.
  ///
  /// The [body] parameter is optional and represents additional data to include in the request.
  /// It can be a Map<String, String> or any other JSON-encodable object.
  ///
  /// The [files] parameter is required and should be a list of files to be included in the request.
  /// The [fileField] parameter is required and specifies the form field name for the files.
  ///
  /// Returns a Future containing a map with the status code and response body.
  ///
  /// Example:
  /// ```dart
  /// final response = await APIServices.postMultiPartWithFiles(
  ///   endPoint: 'https://example.com/upload',
  ///   body: {'key': 'value'},
  ///   files: [File('path/to/file1'), File('path/to/file2')],
  ///   fileField: 'files',
  /// );
  /// print('Status Code: ${response['statusCode']}');
  /// print('Response Body: ${response['responseBody']}');
  /// ```
  static Future<Map<String, dynamic>> postMultiPartWithFilesList({
    required String endPoint,
    required Map<String, String> body,
    required List<File> files,
    required String fileField,
    String? token,
  }) async {
    // Validate required parameters
    ArgumentError.checkNotNull(endPoint, 'endPoint');
    ArgumentError.checkNotNull(files, 'files');
    ArgumentError.checkNotNull(fileField, 'fileField');

    log('Communicating with endpoint: $endPoint');
    log('Body: ${jsonEncode(body)}');
    try {
      // Create a multipart request
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(endPoint),
      );

      // Add files to the request
      for (var file in files) {
        request.files.add(await http.MultipartFile.fromPath(
          fileField,
          file.path,
          filename: file.uri.pathSegments.last,
          contentType:
              MediaType('application', 'octet-stream'), // Generic content type
        ));
        log('File added to request. filename: ${file.path}');
      }

      // Add headers
      final Map<String, String> headers = (token != null)
          ? {
              'Content-Type': 'multipart/form-data',
              'Authorization': 'Bearer $token'
            }
          : {'Content-Type': 'multipart/form-data'};
      request.headers.addAll(headers);

      // Add body
      request.fields.addAll(body);

      log('Request Headers: ${request.headers}');
      log('Request Body: ${request.fields}');
      log('Request Files: ${request.files}');
      log('Request: $request');

      // Send the request with a timeout of 30 seconds
      final streamedResponse =
          await request.send().timeout(const Duration(seconds: 30));

      // Get the response
      final response = await http.Response.fromStream(streamedResponse);

      // Log response details
      log('Response Status Code: ${streamedResponse.statusCode}');
      log('Response Body: ${response.body}');

      // Return status code and response body as a map
      return {
        "statusCode": streamedResponse.statusCode,
        "responseBody": jsonDecode(response.body),
      };
    } on TimeoutException catch (e, stackTrace) {
      log('Stacktrace: $stackTrace');
      // Handle timeout exception
      log('TimeoutException: $e');
      return {
        "statusCode": -1,
        "responseBody": {"error": "Request timed out."},
      };
    } on SocketException catch (e, stackTrace) {
      log('Stacktrace: $stackTrace');
      // Handle network-related exception
      log('SocketException: $e');
      return {
        "statusCode": -1,
        "responseBody": {
          "error": "Network error. Please check your internet connection."
        },
      };
    } on http.ClientException catch (e, stackTrace) {
      log('Stacktrace: $stackTrace');
      // Handle client-related exception
      log('ClientException: $e');
      return {
        "statusCode": -1,
        "responseBody": {"error": "An error occurred during the request."},
      };
    } catch (e, stackTrace) {
      log('Stacktrace: $stackTrace');
      // Handle other unexpected exceptions
      log('Error in postMultiPartWithFiles: $e');
      return {
        "statusCode": -1,
        "responseBody": {"error": "An unexpected error occurred."},
      };
    }
  }

  /// Makes a multipart POST request to the specified endpoint with multiple files.
  ///
  /// The [endPoint] parameter is required and should be the API endpoint to communicate with.
  ///
  /// The [body] parameter is optional and represents additional data to include in the request.
  /// It can be a Map<String, String> or any other JSON-encodable object.
  ///
  /// The [files] parameter is required and should be a map where the keys are field names and
  /// the values are files to be included in the request.
  ///
  /// The [token] parameter is optional and represents the authorization token for the request.
  ///
  /// Returns a Future containing a map with the status code and response body.
  ///
  /// Example:
  /// ```dart
  /// final response = await APIServices.postMultiPartWithFiles(
  ///   endPoint: 'https://example.com/upload',
  ///   body: {'key': 'value'},
  ///   files: {
  ///     'profile_image': File('path/to/file1.jpeg'),
  ///     'cover_image': File('path/to/file2.jpeg'),
  ///   },
  /// );
  /// print('Status Code: ${response['statusCode']}');
  /// print('Response Body: ${response['responseBody']}');
  /// ```
  static Future<Map<String, dynamic>> postMultiPartWithFiles({
    required String endPoint,
    required dynamic body,
    required Map<String, File> files,
    String? token,
  }) async {
    // Validate required parameters
    ArgumentError.checkNotNull(endPoint, 'endPoint');
    ArgumentError.checkNotNull(files, 'files');

    log('Communicating with endpoint: $endPoint');
    log('Body: ${jsonEncode(body)}');
    try {
      // Create a multipart request
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(endPoint),
      );

      // Add files to the request
      files.forEach((fieldName, file) async {
        request.files.add(await http.MultipartFile.fromPath(
          fieldName,
          file.path,
          filename: file.uri.pathSegments.last,
          contentType: MediaType.parse(
              'image/${file.uri.pathSegments.last.split('.').last}'),
        ));
        log('File added to request. FieldName: $fieldName, Filename: ${file.path}');
      });

      // Add headers
      final Map<String, String> headers = (token != null)
          ? {
              'Content-Type': 'multipart/form-data',
              'Authorization': 'Bearer $token'
            }
          : {'Content-Type': 'multipart/form-data'};
      request.headers.addAll(headers);

      // Add body if present
      if (body != null) {
        request.fields.addAll(body);
      } else {
        Map<String, String> body = {};
        request.fields.addAll(body);
      }

      log('Request Headers: ${request.headers}');
      log('Request Body: ${request.fields}');
      log('Request Files: ${request.files}');
      log('Request: $request');

      // Send the request with a timeout of 30 seconds
      final streamedResponse =
          await request.send().timeout(const Duration(seconds: 30));

      // Get the response
      final response = await http.Response.fromStream(streamedResponse);

      // Log response details
      log('Response Status Code: ${streamedResponse.statusCode}');
      log('Response Body: ${response.body}');

      // Return status code and response body as a map
      return {
        "statusCode": streamedResponse.statusCode,
        "responseBody": jsonDecode(response.body),
      };
    } on TimeoutException catch (e, stackTrace) {
      log('Stacktrace: $stackTrace');
      // Handle timeout exception
      log('TimeoutException: $e');
      return {
        "statusCode": -1,
        "responseBody": {"error": "Request timed out."},
      };
    } on SocketException catch (e, stackTrace) {
      log('Stacktrace: $stackTrace');
      // Handle network-related exception
      log('SocketException: $e');
      return {
        "statusCode": -1,
        "responseBody": {
          "error": "Network error. Please check your internet connection."
        },
      };
    } on http.ClientException catch (e, stackTrace) {
      log('Stacktrace: $stackTrace');
      // Handle client-related exception
      log('ClientException: $e');
      return {
        "statusCode": -1,
        "responseBody": {"error": "An error occurred during the request."},
      };
    } catch (e, stackTrace) {
      log('Stacktrace: $stackTrace');
      // Handle other unexpected exceptions
      log('Error in postMultiPartWithFiles: $e');
      return {
        "statusCode": -1,
        "responseBody": {"error": "An unexpected error occurred."},
      };
    }
  }

  /// Makes a multipart PUT request to the specified endpoint.
  ///
  /// The [endPoint] parameter is required and should be the API endpoint to communicate with.
  ///
  /// The [body] parameter is optional and represents additional data to include in the request.
  /// It can be a Map<String, String> or any other JSON-encodable object.
  ///
  /// The [file] parameter is required and should be a list of files to be included in the request.
  ///
  /// Returns a Future containing a map with the status code and response body.
  ///
  /// Example:
  /// ```dart
  /// final response = await APIServices.putMultiPart(
  ///   endPoint: 'https://example.com/upload',
  ///   body: {'key': 'value'},
  ///   files: [File('path/to/file')],
  /// );
  /// print('Status Code: ${response['statusCode']}');
  /// print('Response Body: ${response['responseBody']}');
  /// ```
  static Future<Map<String, dynamic>> putMultiPart({
    required String endPoint,
    required dynamic body,
    File? file,
    String? token,
  }) async {
    // Validate required parameters
    ArgumentError.checkNotNull(endPoint, 'endPoint');

    log('Communicating with endpoint: $endPoint');
    log('Body: ${jsonEncode(body)}');
    try {
      // Create a multipart request
      var request = http.MultipartRequest(
        'PUT',
        Uri.parse(endPoint),
      );

      if (file != null) {
        // Add files to the request
        request.files.add(await http.MultipartFile.fromPath(
          'profile_image',
          file.path,
          filename: 'profile_picture.jpeg',
          contentType: MediaType('image', 'jpeg'),
        ));
        log('File added to request. filename: ${file.path}');
      }

      // Add headers
      final Map<String, String> headers = (token != null)
          ? {
              'Content-Type': 'multipart/form-data',
              'Authorization': 'Bearer $token'
            }
          : {'Content-Type': 'multipart/form-data'};
      request.headers.addAll(headers);

      // Add body if present
      if (body != null) {
        request.fields.addAll(body);
      } else {
        Map<String, String> body = {};
        request.fields.addAll(body);
      }

      log('Request Headers: ${request.headers}');
      log('Request Body: ${request.fields}');
      log('Request Files: ${request.files}');
      log('Request: $request');

      // Send the request with a timeout of 30 seconds
      final streamedResponse =
          await request.send().timeout(const Duration(seconds: 30));

      // Get the response
      final response = await http.Response.fromStream(streamedResponse);

      // Log response details
      log('Response Status Code: ${streamedResponse.statusCode}');
      log('Response Body: ${response.body}');

      // Return status code and response body as a map
      return {
        "statusCode": streamedResponse.statusCode,
        "responseBody": jsonDecode(response.body),
      };
    } on TimeoutException catch (e, stackTrace) {
      log('Stacktrace: $stackTrace');
      // Handle timeout exception
      log('TimeoutException: $e');
      return {
        "statusCode": -1,
        "responseBody": {"error": "Request timed out."},
      };
    } on SocketException catch (e, stackTrace) {
      log('Stacktrace: $stackTrace');
      // Handle network-related exception
      log('SocketException: $e');
      return {
        "statusCode": -1,
        "responseBody": {
          "error": "Network error. Please check your internet connection."
        },
      };
    } on http.ClientException catch (e, stackTrace) {
      log('Stacktrace: $stackTrace');
      // Handle client-related exception
      log('ClientException: $e');
      return {
        "statusCode": -1,
        "responseBody": {"error": "An error occurred during the request."},
      };
    } catch (e, stackTrace) {
      log('Stacktrace: $stackTrace');
      // Handle other unexpected exceptions
      log('Error in putMultiPart: $e');
      return {
        "statusCode": -1,
        "responseBody": {"error": "An unexpected error occurred."},
      };
    }
  }

  /// Makes a POST request to the specified endpoint.
  ///
  /// The [endPoint] parameter is required and should be the API endpoint to communicate with.
  ///
  /// The [body] parameter represents the data to include in the request. It can be a Map<String, dynamic>,
  /// any other JSON-encodable object, or null if the request does not have a body.
  ///
  /// Returns a Future containing a map with the status code and response body.
  ///
  /// Throws ArgumentError if [endPoint] is null.
  ///
  /// Example:
  /// ```dart
  /// final response = await APIServices.postEndPoint(
  ///   endPoint: 'https://example.com/api',
  ///   body: {'key': 'value'},
  /// );
  /// print('Status Code: ${response['statusCode']}');
  /// print('Response Body: ${response['responseBody']}');
  /// ```
  static Future<Map<String, dynamic>> postEndPoint({
    required String endPoint,
    dynamic body,
    String? token,
  }) async {
    // Validate required parameters
    ArgumentError.checkNotNull(endPoint, 'endPoint');

    // Log communication details
    log('Communicating with endpoint: $endPoint');
    log('Request Body: ${jsonEncode(body)}');

    try {
      // Create URI from endpoint
      final Uri uri = Uri.parse(endPoint);

      Map<String, String> headerWithToken = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };

      log("Header: $headerWithToken");

      // Make the POST request with a timeout of 30 seconds
      final apiResponse = await http
          .post(
            uri,
            headers: (token != null)
                ? headerWithToken
                : {'Content-Type': 'application/json'},
            body: jsonEncode(body),
          )
          .timeout(const Duration(seconds: 30));

      // Log response details
      log('Response Status Code: ${apiResponse.statusCode}');
      log('Response Body: ${apiResponse.body}');

      // Return status code and response body as a map
      return {
        "statusCode": apiResponse.statusCode,
        "responseBody": apiResponse.body,
      };
    } on TimeoutException catch (e, stackTrace) {
      log('Stacktrace: $stackTrace');
      // Handle timeout exception
      log('TimeoutException: $e');
      return {
        "statusCode": -1,
        "responseBody": {"error": "Request timed out."},
      };
    } on SocketException catch (e, stackTrace) {
      log('Stacktrace: $stackTrace');
      // Handle network-related exception
      log('SocketException: $e');
      return {
        "statusCode": -1,
        "responseBody": {
          "error": "Network error. Please check your internet connection."
        },
      };
    } on http.ClientException catch (e, stackTrace) {
      log('Stacktrace: $stackTrace');
      // Handle client-related exception
      log('ClientException: $e');
      return {
        "statusCode": -1,
        "responseBody": {"error": "An error occurred during the request."},
      };
    } catch (e, stackTrace) {
      log('Stacktrace: $stackTrace');
      // Handle other unexpected exceptions
      log('Error in postEndPoint: $e');
      return {
        "statusCode": -1,
        "responseBody": {"error": "An unexpected error occurred."},
      };
    }
  }

  /// Makes a GET request to the specified endpoint.
  ///
  /// The [endPoint] parameter is required and should be the API endpoint to communicate with.
  ///
  /// Returns a Future containing a map with the status code and response body.
  ///
  /// Throws ArgumentError if [endPoint] is null.
  ///
  /// Example:
  /// ```dart
  /// final response = await APIServices.getEndPoint(
  ///  endPoint: 'https://example.com/api',
  ///  );
  /// print('Status Code: ${response['statusCode']}');
  /// print('Response Body: ${response['responseBody']}');
  ///  ```
  static Future<Map<String, dynamic>> getEndPoint({
    required String endPoint,
    String? token,
  }) async {
    // Validate required parameters
    ArgumentError.checkNotNull(endPoint, 'endPoint');

    // Log communication details
    log('Communicating with endpoint: $endPoint');

    try {
      // Create URI from endpoint
      final Uri uri = Uri.parse(endPoint);

      // Make the GET request with a timeout of 30 seconds
      final apiResponse = await http
          .get(
            uri,
            headers: (token != null)
                ? {
                    'Content-Type': 'application/json',
                    'Authorization': 'Bearer $token'
                  }
                : {'Content-Type': 'application/json'},
          )
          .timeout(const Duration(seconds: 30));

      // Log response details
      log('Response Status Code: ${apiResponse.statusCode}');
      log('Response Body: ${apiResponse.body}');

      // Return status code and response body as a map
      return {
        "statusCode": apiResponse.statusCode,
        "responseBody": jsonDecode(apiResponse.body),
      };
    } on TimeoutException catch (e, stackTrace) {
      log('Stacktrace: $stackTrace');
      // Handle timeout exception
      log('TimeoutException: $e');
      return {
        "statusCode": -1,
        "responseBody": {"error": "Request timed out."},
      };
    } on SocketException catch (e, stackTrace) {
      log('Stacktrace: $stackTrace');
      // Handle network-related exception
      log('SocketException: $e');
      return {
        "statusCode": -1,
        "responseBody": {
          "error": "Network error. Please check your internet connection."
        },
      };
    } on http.ClientException catch (e, stackTrace) {
      log('Stacktrace: $stackTrace');
      // Handle client-related exception
      log('ClientException: $e');
      return {
        "statusCode": -1,
        "responseBody": {"error": "An error occurred during the request."},
      };
    } catch (e, stackTrace) {
      log('Stacktrace: $stackTrace');
      // Handle other unexpected exceptions
      log('Error in getEndPoint: $e');
      return {
        "statusCode": -1,
        "responseBody": {"error": "An unexpected error occurred."},
      };
    }
  }

  /// Makes a DELETE request to the specified endpoint.
  ///
  /// The [endPoint] parameter is required and should be the API endpoint to communicate with.
  ///
  /// Returns a Future containing a map with the status code and response body.
  ///
  /// Throws ArgumentError if [endPoint] is null.
  ///
  /// Example:
  /// ```dart
  /// final response = await APIServices.deleteEndPoint(
  ///   endPoint: 'https://example.com/api/resource',
  /// );
  /// print('Status Code: ${response['statusCode']}');
  /// print('Response Body: ${response['responseBody']}');
  /// ```
  static Future<Map<String, dynamic>> deleteEndPoint({
    required String endPoint,
    String? token,
  }) async {
    // Validate required parameters
    ArgumentError.checkNotNull(endPoint, 'endPoint');

    // Log communication details
    log('Communicating with endpoint: $endPoint');
    log(token != null
        ? "API Header: {'Content-Type': 'application/json','Authorization': 'Bearer $token'}"
        : "API Header: {'Content-Type': 'application/json'}");

    try {
      // Create URI from endpoint
      final Uri uri = Uri.parse(endPoint);

      // Make the DELETE request with a timeout of 30 seconds
      final apiResponse = await http
          .delete(
            uri,
            headers: (token != null)
                ? {
                    'Content-Type': 'application/json',
                    'Authorization': 'Bearer $token'
                  }
                : {'Content-Type': 'application/json'},
          )
          .timeout(const Duration(seconds: 30));

      // Log response details
      log('Response Status Code: ${apiResponse.statusCode}');
      log('Response Body: ${apiResponse.body}');

      // Return status code and response body as a map
      return {
        "statusCode": apiResponse.statusCode,
        "responseBody": jsonDecode(apiResponse.body),
      };
    } on TimeoutException catch (e, stackTrace) {
      log('Stacktrace: $stackTrace');
      // Handle timeout exception
      log('TimeoutException: $e');
      return {
        "statusCode": ResponseCodes.APIServices_EXCEPTION,
        "responseBody": {"error": "Request timed out."},
      };
    } on SocketException catch (e, stackTrace) {
      log('Stacktrace: $stackTrace');
      // Handle network-related exception
      log('SocketException: $e');
      return {
        "statusCode": ResponseCodes.APIServices_EXCEPTION,
        "responseBody": {
          "error": "Network error. Please check your internet connection."
        },
      };
    } on http.ClientException catch (e, stackTrace) {
      log('Stacktrace: $stackTrace');
      // Handle client-related exception
      log('ClientException: $e');
      return {
        "statusCode": ResponseCodes.APIServices_EXCEPTION,
        "responseBody": {"error": "An error occurred during the request."},
      };
    } catch (e, stackTrace) {
      log('Stacktrace: $stackTrace');
      // Handle other unexpected exceptions
      log('Error in deleteEndPoint: $e');
      return {
        "statusCode": ResponseCodes.APIServices_EXCEPTION,
        "responseBody": {"error": "An unexpected error occurred."},
      };
    }
  }

  static Future<Map<String, dynamic>> putEndPoint({
    required String endPoint,
    dynamic body,
    String? token,
  }) async {
    // Validate required parameters
    ArgumentError.checkNotNull(endPoint, 'endPoint');

    // Log communication details
    log('Communicating with endpoint: $endPoint');
    log('Request Body: ${jsonEncode(body)}');

    try {
      // Create URI from endpoint
      final Uri uri = Uri.parse(endPoint);

      Map<String, String> headerWithToken = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };

      log("Header: $headerWithToken");

      // Make the PUT request with a timeout of 30 seconds
      final apiResponse = await http
          .put(
            uri,
            headers: (token != null)
                ? headerWithToken
                : {'Content-Type': 'application/json'},
            body: jsonEncode(body),
          )
          .timeout(const Duration(seconds: 30));

      // Log response details
      log('Response Status Code: ${apiResponse.statusCode}');
      log('Response Body: ${apiResponse.body}');

      // Return status code and response body as a map
      return {
        "statusCode": apiResponse.statusCode,
        "responseBody": jsonDecode(apiResponse.body),
      };
    } on TimeoutException catch (e, stackTrace) {
      log('Stacktrace: $stackTrace');
      // Handle timeout exception
      log('TimeoutException: $e');
      return {
        "statusCode": -1,
        "responseBody": {"error": "Request timed out."},
      };
    } on SocketException catch (e, stackTrace) {
      log('Stacktrace: $stackTrace');
      // Handle network-related exception
      log('SocketException: $e');
      return {
        "statusCode": -1,
        "responseBody": {
          "error": "Network error. Please check your internet connection."
        },
      };
    } on http.ClientException catch (e, stackTrace) {
      log('Stacktrace: $stackTrace');
      // Handle client-related exception
      log('ClientException: $e');
      return {
        "statusCode": -1,
        "responseBody": {"error": "An error occurred during the request."},
      };
    } catch (e, stackTrace) {
      log('Stacktrace: $stackTrace');
      // Handle other unexpected exceptions
      log('Error in putEndPoint: $e');
      return {
        "statusCode": -1,
        "responseBody": {"error": "An unexpected error occurred."},
      };
    }
  }
}

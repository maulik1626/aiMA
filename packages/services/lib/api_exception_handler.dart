import 'package:services/api_services.dart';

class APIResponseHandler {
  static void handleResponse({
    required Map<String, dynamic> response,
    required Function onSuccess,
    required Function({required int statusCode, required String errorMessage})
        onFailure,
  }) {
    int statusCode = response['statusCode'];
    switch (statusCode) {
      case ResponseCodes.SUCCESS:
        onSuccess();
        break;
      case ResponseCodes.BAD_GATEWAY:
      case ResponseCodes.INTERNAL_SERVER_ERROR:
      case ResponseCodes.BAD_REQUEST:
      case ResponseCodes.NOT_FOUND:
      case ResponseCodes.FORBIDDEN:
      case ResponseCodes.UNAUTHORIZED:
      case ResponseCodes.TEMPORARY_REDIRECT:
      case ResponseCodes.TOO_MANY_REQUESTS:
      case ResponseCodes.APIServices_EXCEPTION:
        onFailure(
            statusCode: statusCode, errorMessage: response['responseBody']);
        break;
      default:
        onFailure(
            statusCode: statusCode, errorMessage: response['responseBody']);
        break;
    }
  }
}

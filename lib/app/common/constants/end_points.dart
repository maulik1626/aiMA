// ignore_for_file: constant_identifier_names

class EndPoints {

  // Google APIs Endpoints
  static String googlePlacesAutocompleteEndPoint({required String location}) => "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$location&key=AIzaSyDEJDGdIf5o8w7ugUCT67kdu3EI36Ld_QY";
  static String googlePlacesDetailsEndPoint({required String placeId}) => 'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&fields=geometry&key=AIzaSyDEJDGdIf5o8w7ugUCT67kdu3EI36Ld_QY';
  static String googleGetAddressFromLatLongEndPoint({required String latitude, required String longitude,}) => 'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=AIzaSyDEJDGdIf5o8w7ugUCT67kdu3EI36Ld_QY';

  // static const String _BASE_URL = 'http://192.168.29.131:5000/';
  static const String _BASE_URL = 'http://13.233.106.98/';
  static const String _API = '${_BASE_URL}api/';

  static const String sendOTP = '${_API}send_otp/';
  static const String verifyOTP = '${_API}login_register/';

  static const String updateUserProfile = '${_API}update_user_profile/';



  static const String logout = '${_API}log_out/';


// String checkUsernameAvailabilityEndPoint = '${_API}suggest_usernames/?user_name=';
// String updateUserEndPoint = '${_API}update_user/';
// String getUserEndPoint = '${_API}get_user_profile/';
// String logoutEndPoint = '${_API}log_out/';
}
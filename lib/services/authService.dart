import 'package:flutter/foundation.dart';
import 'package:flutter_feathersjs/flutter_feathersjs.dart';
import '../components/businesses/businessesService.dart';
import '../../global.dart';
import '../../main.dart';
import '../components/users/users.dart';
import '../../services/api.dart';
import '../../services/utils.dart';

class AuthAPI {
  Future<APIResponse<Users>> loginUser(String email, String password) async {
    Users? user;
    String? error;
    Map<String, dynamic>? response;

    try {
      response = await flutterFeathersJS.authenticate(
          userName: email, password: password, strategy: "local");

      if (response != null) {
        user = Users.fromMap(response);
        // If all thing is ok, save user in local storage
        Utils.removeAllFromLocalStorage();
        Utils.addItemsToLocalStorage('user', response);
        if (user.businessId != null) {
          BusinessesService businessesService = BusinessesService();
          var businessResponse = await businessesService.get(user.businessId!);

          if (businessResponse.errorMessage == null) {
            Utils.addItemsToLocalStorage(
                'business', businessResponse.response!);
          }
        }
      } else {
        if (kDebugMode) {
          print("response is null");
        }
      }
    } on FeatherJsError catch (e) {
      error = "Unexpected error occurred, please retry!";
      if (e.type == FeatherJsErrorType.IS_INVALID_CREDENTIALS_ERROR) {
        logger.e("IS_INVALID_CREDENTIALS_ERROR");
        error = "Please check your credentials";
      } else if (e.type == FeatherJsErrorType.IS_INVALID_STRATEGY_ERROR) {
        logger.e("IS_INVALID_STRATEGY_ERROR");
      } else if (e.type == FeatherJsErrorType.IS_AUTH_FAILED_ERROR) {
        logger.e("IS_AUTH_FAILED_ERROR");
        error = "Unexpected error occurred, please retry!";
      } else if (e.type == FeatherJsErrorType.IS_NOT_AUTHENTICATED_ERROR) {
        logger.e("IS_NOT_AUTHENTICATED_ERROR");
        error = "Not-authenticated error occurred, please retry!";
      } else {
        logger.e(
            "FeatherJsError error ::: Type => ${e.type} ::: Message => ${e.message}");
        error = "Invalid login, please retry!";
      }
    } catch (e) {
      logger.e("Unexpected error ::: ${e.toString()}");
      error = "Unexpected error occurred, please retry!";
    }
    return APIResponse(errorMessage: error, data: user);
  }

  Future<APIResponse<Users>> registerUser(
      String name, String email, String password) async {
    Users? user;
    String? error;
    try {
      Map<String, dynamic> response = await flutterFeathersJS.rest.create(
        serviceName: "users",
        data: {"name": name, "email": email, "password": password},
      );
      logger.i(response.toString());
      user = Users.fromMap(response);
      await loginUser(email, password);
    } on FeatherJsError catch (e) {
      if (e.type == FeatherJsErrorType.IS_INVALID_CREDENTIALS_ERROR) {
        logger.e("IS_INVALID_CREDENTIALS_ERROR");
        error = "Please check your credentials";
      } else if (e.type == FeatherJsErrorType.IS_INVALID_STRATEGY_ERROR) {
        logger.e("IS_INVALID_STRATEGY_ERROR");
      } else if (e.type == FeatherJsErrorType.IS_AUTH_FAILED_ERROR) {
        logger.e("IS_AUTH_FAILED_ERROR");
        error = "Unexpected error occurred, please retry!";
      } else {
        logger.e(
            "FeatherJsError error ::: Type => ${e.type} ::: Message => ${e.message}");
        error = "Unexpected FeatherJsError occurred, please retry!";
      }
    } catch (e) {
      logger.e("Unexpected error ::: ${e.toString()}");
      error = "Unexpected error occurred, please retry!";
    }
    return APIResponse(errorMessage: error, data: user);
  }
}

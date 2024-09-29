import 'dart:convert';
import 'package:flutter_feathersjs/flutter_feathersjs.dart';
import '../../main.dart';
import '../../global.dart';
import '../../services/api.dart';
import 'users.dart';

class UsersService {
  Future<APIResponse<List<Users>>> getAll() async {
    List<Users>? users;
    String? error;
    Map<String, dynamic>? response;
    try {
      response = await flutterFeathersJS.rest.find(
        serviceName: "userss",
        query: {},
      );
      logger.i(response!['data'].toString());
      users = List<Map<String, dynamic>>.from(response!['data'])
          .map((map) => Users.fromMap(map))
          .toList();
    } on FeatherJsError catch (e) {
      logger.e(
          "FeatherJsError error ::: Type => ${e.type} ::: Message => ${e.message}");
      error = "Unexpected FeatherJsError occurred, please retry!";
    } catch (e) {
      logger.e("Unexpected error ::: ${e.toString()}");
      error = "Unexpected error occurred, please retry!";
    }
    return APIResponse(errorMessage: error, data: users, response: response);
  }

  Future<APIResponse<Users>> get(String id) async {
    Users? users;
    String? error;
    Map<String, dynamic>? mapString;

    try {
      dynamic response = await flutterFeathersJS.rest.get(
        serviceName: "users",
        objectId: id,
      );
      users = Users.fromMap((jsonDecode(response.toString())));
      mapString = jsonDecode(response.toString());
    } on FeatherJsError catch (e) {
      logger.e(
          "FeatherJsError error ::: Type => ${e.type} ::: Message => ${e.message}");
      error =
          "Unexpected FeatherJsError occurred, please retry! ${e.toString()}";
    } catch (e) {
      logger.i("Unexpected error ::: ${e.toString()}");
      error = "Unexpected error occurred, please retry! ${e.toString()}";
    }
    return APIResponse(errorMessage: error, data: users, response: mapString);
  }

  Future<APIResponse<List<Users>>> find(query) async {
    List<Users>? users;
    String? error;
    try {
      Map<String, dynamic> response = await flutterFeathersJS.rest.find(
        serviceName: "userss",
        query: query,
      );
      logger.i(response!['data'].toString());
      users = List<Map<String, dynamic>>.from(response!['data'])
          .map((map) => Users.fromMap(map))
          .toList();
    } on FeatherJsError catch (e) {
      logger.e(
          "FeatherJsError error ::: Type => ${e.type} ::: Message => ${e.message}");
      error = "Unexpected FeatherJsError occurred, please retry!";
    } catch (e) {
      logger.e("Unexpected error ::: ${e.toString()}");
      error = "Unexpected error occurred, please retry!";
    }
    return APIResponse(errorMessage: error, data: users);
  }

  Future<APIResponse> create(data) async {
    String? error;
    Map<String, dynamic>? response;
    try {
      response = await flutterFeathersJS.rest
          .create(serviceName: "userss", data: data);
      logger.i(response.toString());
    } on FeatherJsError catch (e) {
      logger.e(
          "FeatherJsError error ::: Type => ${e.type} ::: Message => ${e.message}");
      error = "Unexpected FeatherJsError occurred, please retry!";
    } catch (e) {
      logger.e("Unexpected error ::: ${e.toString()}");
      error = "Unexpected error occurred, please retry!";
    }
    return APIResponse(errorMessage: error, data: response);
  }

  Future<APIResponse> update(id, data) async {
    String? error;
    Map<String, dynamic>? response;
    try {
      response = await flutterFeathersJS.rest
          .update(serviceName: "userss", objectId: id, data: data);
      logger.i(response.toString());
    } on FeatherJsError catch (e) {
      logger.e(
          "FeatherJsError error ::: Type => ${e.type} ::: Message => ${e.message}");
      error = "Unexpected FeatherJsError occurred, please retry!";
    } catch (e) {
      logger.e("Unexpected error ::: ${e.toString()}");
      error = "Unexpected error occurred, please retry!";
    }
    return APIResponse(errorMessage: error, data: response);
  }

  Future<APIResponse> patch(id, data) async {
    String? error;
    Map<String, dynamic>? response;
    try {
      Map<String, dynamic> response = await flutterFeathersJS.rest
          .patch(serviceName: "userss", objectId: id, data: data);
      logger.i(response.toString());
    } on FeatherJsError catch (e) {
      logger.e(
          "FeatherJsError error ::: Type => ${e.type} ::: Message => ${e.message}");
      error = "Unexpected FeatherJsError occurred, please retry!";
    } catch (e) {
      logger.e("Unexpected error ::: ${e.toString()}");
      error = "Unexpected error occurred, please retry!";
    }
    return APIResponse(errorMessage: error, data: response);
  }
}

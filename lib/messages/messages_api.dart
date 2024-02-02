import 'package:flutter_feathersjs/flutter_feathersjs.dart';
import '../components/users/users.dart';
import '../global.dart';
import '../main.dart';
import '../services/api.dart';
import '../services/utils.dart';
import 'group.dart';
import 'message.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class GroupsAPI {
  Future<APIResponse<List<Group>>> getGroups() async {
    List<Group>? groups;
    String? error;
    late Map<String, dynamic> response;
    late Users user;
    var thisUser = Utils.getItemFromLocalStorage("user");
    if (thisUser != null) {
      user = Users.fromMap(thisUser);
    }
    try {
      response = await flutterFeathersJS.rest.find(
        serviceName: "groups",
        query: {"createdBy": user.id},
      );
      logger.i(response.toString());
      groups = List<Map<String, dynamic>>.from(response["data"])
          .map((map) => Group.fromMap(map))
          .toList();
      logger.i(response.toString());
    } on FeatherJsError catch (e) {
      logger.e(
          "FeatherJsError error ::: Type => ${e.type} ::: Message => ${e.message}");
      error = "Unexpected FeatherJsError occurred, please retry!";
    } catch (e) {
      logger.e("Unexpected error ::: ${e.toString()}");
      error = "Unexpected error occurred, please retry!";
    }
    return APIResponse(errorMessage: error, data: groups, response: response);
  }

  Future<APIResponse<void>> createGroup(String name, String topic, String image) async {
    String? error;
    late final Map<String, dynamic> response;
    late Users user;
    var thisUser = Utils.getItemFromLocalStorage("user");
    if (thisUser != null) {
      user = Users.fromMap(thisUser);
    }

    try {
      response = await flutterFeathersJS.rest.create(
        serviceName: "groups",
        data: {
          "name": name,
          "image": image,
          "topic": topic,
          "encryption": false,
          "blocked": false,
          "deleted": false,
          "members" : [user.id],
          "admins" : [user.id],
          "createdDate": DateTime.now().toString(),
          "createdBy": user.id
        },
      );
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

class MessagesAPI {
  Future<APIResponse<List<Message>>> getMessages() async {
    List<Message>? messages;
    String? error;
    Map<String, dynamic>? response;
    late Users user;
    var thisUser = Utils.getItemFromLocalStorage("user");
    if (thisUser != null) {
      user = Users.fromMap(thisUser!);
    }
    try {
      response = await flutterFeathersJS.rest.find(
        serviceName: "messages",
        query: {"createdBy": user.id},
      );
      logger.i(response.toString());
      messages = List<Map<String, dynamic>>.from(response!["data"])
          .map((map) => Message.fromMap(map))
          .toList();
      logger.i(response.toString());
    } on FeatherJsError catch (e) {
      logger.e(
          "FeatherJsError error ::: Type => ${e.type} ::: Message => ${e.message}");
      error = "Unexpected FeatherJsError occurred, please retry!";
    } catch (e) {
      logger.e("Unexpected error ::: ${e.toString()}");
      error = "Unexpected error occurred, please retry!";
    }
    return APIResponse(errorMessage: error, data: messages, response: response);
  }

  Future<APIResponse<void>> createMessage(Message msg) async {
    String? error;
    late final Map<String, dynamic> response;
    late Users user;
    var thisUser = Utils.getItemFromLocalStorage("user");
    if (thisUser != null) {
      user = Users.fromMap(thisUser);
    }

    try {
      response = await flutterFeathersJS.rest.create(
        serviceName: "messages",
        data: {
          "groupId" : msg.groupId,
          "content": msg.content,
          "date": DateTime.now().toString(),
          "createdBy": user.id
        },
      );
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

class SocketClient {
  IO.Socket? socket;
  static SocketClient? _instance;

  SocketClient._internal() {
    socket =
        IO.io(API.baseUrl, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket!.connect();
  }

  static SocketClient get instance {
    _instance ??= SocketClient._internal();
    return _instance!;
  }
}

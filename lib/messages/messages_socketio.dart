import 'package:flutter_feathersjs/flutter_feathersjs.dart';

import '../global.dart';
import '../main.dart';
import '../services/api.dart';
import 'message.dart';

class MessagesAPI {
  Future<APIResponse<List<Message>>> getMessages() async {
    List<Message>? messages;
    String? error;
    try {
      Map<String, dynamic> response = await flutterFeathersJS.scketio.find(
        serviceName: "messages",
        query: {},
      );
      logger.i(response.toString());
      messages = List<Map<String, dynamic>>.from(response["data"])
          .map((map) => Message.fromMap(map))
          .toList();
      // If all thing is ok, save user in local storage
      /*  await utils.setLoggedUser(user);
       */
    } on FeatherJsError catch (e) {
      logger.e("FeatherJsError error ::: Type => ${e.type} ::: Message => ${e.message}");
      error = "Unexpected FeatherJsError occurred, please retry!";
    } catch (e) {
      logger.e("Unexpected error ::: ${e.toString()}");
      error = "Unexpected error occurred, please retry!";
    }
    return APIResponse(errorMessage: error, data: messages);
  }

  Future<APIResponse<void>> createMessage(Message msg) async {
    String? error;
    try {
      Map<String, dynamic> response = await flutterFeathersJS.scketio.create(
        serviceName: "message",
        data: {"message": msg.content},
        params: {},
      );
      logger.e(response.toString());
    } on FeatherJsError catch (e) {
      logger.e("FeatherJsError error ::: Type => ${e.type} ::: Message => ${e.message}");
      error = "Unexpected FeatherJsError occurred, please retry!";
    } catch (e) {
      logger.e("Unexpected error ::: ${e.toString()}");
      error = "Unexpected error occurred, please retry!";
    }
    return APIResponse(errorMessage: error, data: null);
  }
}

import 'dart:convert';

import 'package:bard_flutter/model/chat_model.dart';
import 'package:bard_flutter/utilities/utilities.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ChatController extends GetxController {
  RxList historyList = RxList<ChatModel>([
    ChatModel(
      system: "bard",
      message:
          "Simply click the button to grab the text you recently copied and display the answer.",
    ),
  ]);

  RxBool isLoading = false.obs;

  void sendPrompt(String prompt) async {
    isLoading.value = true;
    var newHistory = ChatModel(system: "user", message: prompt);
    historyList.add(newHistory);

    final body = {
      'prompt': {
        'text': prompt,
      },
    };

    final request = await http.post(
      Uri.parse(baseURL),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );

    final response = jsonDecode(request.body);
    final bardReplay = response["candidates"][0]["output"];
    var newHistory2 = ChatModel(system: "bard", message: bardReplay);
    historyList.add(newHistory2);
    print(bardReplay.toString());
    isLoading.value = false;
  }
}

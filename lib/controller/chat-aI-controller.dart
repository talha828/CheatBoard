import 'dart:convert';

import 'package:bard_flutter/model/chat_model.dart';
import 'package:bard_flutter/utilities/utilities.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ChatController extends GetxController {
  RxList historyList = RxList<ChatModel>([
    ChatModel(
      system: "user",
      message: "How does that help me?",
    ),
    ChatModel(
      system: "bard",
      message:
          "You get the key points quickly, even from lengthy or tricky documents. Ask away!"
          "Bonus: Add a fun line like Think of Bard as my secret brain boost for super summaries!"
          "This keeps it short, sweet, and highlights the user benefits of the Bard integration.",
    ),
    ChatModel(
      system: "user",
      message: "What does Bard do with PDFs",
    ),
    ChatModel(
      system: "bard",
      message:
          "Bard breaks them down into bite-sized summaries you can easily understand.",
    ),
    ChatModel(
      system: "bard",
      message: "Please feel free to ask any question that comes to your mind.",
    ),
  ]);

  RxBool isLoading = false.obs;
  RxString PDF = "".obs;

  void sendPrompt(String prompt) async {
    isLoading.value = true;
    var newHistory = ChatModel(system: "user", message: prompt);
    historyList.add(newHistory);

    final body = {
      'prompt': {
        'text': PDF.value == ""?  prompt : "$prompt Use this Information $PDF",
      },
    };

    PDF.value == "";

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

import 'package:bard_flutter/controller/chat-aI-controller.dart';
import 'package:bard_flutter/widgets/chat-titles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ChatController controller = Get.put(ChatController());
  String clipboardText = 'Press the button to get clipboard text';

  void _getClipboardText() async {
    final data = await Clipboard.getData(Clipboard.kTextPlain);
    clipboardText = data!.text!.isNotEmpty
        ? "Please answer the following question: ${data.text}"
        : 'Clipboard is empty';
    controller.sendPrompt(clipboardText);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Colors.blue,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "CheatBoard",
              style: TextStyle(color: Colors.white),
            ),
            ElevatedButton(
                onPressed: () => _getClipboardText(),
                child: const Text("Get Answer")),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: width * 0.02),
          ChatTiles(controller: controller, width: width),
        ],
      ),
    );
  }
}

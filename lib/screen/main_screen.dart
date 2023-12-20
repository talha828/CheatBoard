import 'package:bard_flutter/controller/chat-aI-controller.dart';
import 'package:bard_flutter/widgets/chat-titles.dart';
import 'package:bard_flutter/widgets/input-field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ChatController controller = Get.put(ChatController());
  TextEditingController textField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xfff0eefc),
      appBar: AppBar(
        leading: Container(),
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          "ByteBoard",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ChatTiles(controller: controller, width: width),
            const SizedBox(height: 10),
            InputField(
                width: width, textField: textField, controller: controller),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

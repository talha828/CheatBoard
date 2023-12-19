import 'package:bard_flutter/controller/chat-aI-controller.dart';
import 'package:bard_flutter/widgets/attachments-button.dart';
import 'package:bard_flutter/widgets/loading-indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.width,
    required this.textField,
    required this.controller,
  });

  final double width;
  final TextEditingController textField;
  final ChatController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          SizedBox(
            width: width * 0.015,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueAccent.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                controller: textField,
                onFieldSubmitted: (value) {
                  if (value != "") {
                    controller.sendPrompt(value);
                    textField.clear();
                  }
                },
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  hintText: "You can ask what you want",
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
          Obx(
                () => controller.isLoading.value
                ? const LoadingIndicator()
                : const AttachmentButton(),
          ),
          const SizedBox(width: 10)
        ],
      ),
    );
  }
}
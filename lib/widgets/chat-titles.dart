import 'package:bard_flutter/controller/chat-aI-controller.dart';
import 'package:bard_flutter/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatTiles extends StatelessWidget {
  const ChatTiles({
    super.key,
    required this.controller,
    required this.width,
  });

  final ChatController controller;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Obx(
                () => Column(
              children: controller.historyList
                  .map(
                    (e) => Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 10),
                  padding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        e.system != "user"
                            ? Assets.assetsRobotics
                            : Assets.assetsBot,
                        width: width * 0.05,
                        height: width * 0.05,
                      ),
                      SizedBox(width: width * 0.04),
                      Flexible(child: Text(e.message)),
                    ],
                  ),
                ),
              )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
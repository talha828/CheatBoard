import 'package:bard_flutter/controller/chat-aI-controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:read_pdf_text/read_pdf_text.dart';


String apiKey = "Insert Your API Here";

String baseURL = "https://generativelanguage.googleapis.com/v1beta2/models/text-bison-001:generateText?key=$apiKey";

class Utilities {
  static ChatController controller = Get.put(ChatController());

  static Future<void> pickAndSaveFilePath() async {
    try {
      controller.isLoading.value = true;

      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        String filePath = result.files.single.path ?? "";
        if (filePath != "") {
          String pdfText = await getPDFTextPaginated(filePath);
          if (pdfText != "") {
            controller.PDF.value = pdfText;
            controller.isLoading.value = false;
            Get.snackbar(
              "PDF scan successfully",
              "Now, ask questions related to PDF. Keep in mind that you only have one Question; after that, the data will be removed",
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              snackPosition: SnackPosition.TOP
            );
          } else {
            controller.isLoading.value = false;
            Get.snackbar(
              "PDF scan Failed",
              "Something went wrong. Please try another PDF",
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              snackPosition: SnackPosition.TOP
            );
          }
        }else{
          controller.isLoading.value = false;
          Get.snackbar(
              "File not found",
              "Something went wrong. Please try another PDF",
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              snackPosition: SnackPosition.TOP
          );
        }
      } else {
        print("File picking canceled");
        controller.isLoading.value = false;
      }
    } catch (e) {
      controller.isLoading.value = false;
      print("Error picking file: $e");
    }
  }

  static Future<String> getPDFTextPaginated(String path) async {
    String textList = "";
    try {
      textList = await ReadPdfText.getPDFtext(path);
    } catch (e) {
      print(e.toString());
    }
    return textList;
  }
}

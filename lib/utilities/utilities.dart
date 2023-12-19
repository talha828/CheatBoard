// TODO Insert Your APIKEY Here
import 'package:bard_flutter/controller/chat-aI-controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:read_pdf_text/read_pdf_text.dart';

String apiKey = "AIzaSyCbxUpGHl1KAgUC1NJpDM3Fqbz0mUrBnl4";
String baseURL = "https://generativelanguage.googleapis.com/v1beta2/models/text-bison-001:generateText?key=$apiKey";

class Utilities{

  static ChatController controller = Get.put(ChatController());

  static Future<void> pickAndSaveFilePath() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        String filePath = result.files.single.path ?? "";
        if (filePath != "") {
          String pdfText = await getPDFTextPaginated(filePath);
          controller.sendPrompt("$pdfText summaries the content");
        }
      } else {
        print("File picking canceled");
      }
    } catch (e) {
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
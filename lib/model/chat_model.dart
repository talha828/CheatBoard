class ChatModel {
  String? system;
  String? message;

  ChatModel({this.system, this.message});

  ChatModel.fromJson(Map<String, dynamic> json) {
    if(json["system"] is String) {
      system = json["system"];
    }
    if(json["message"] is String) {
      message = json["message"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["system"] = system;
    data["message"] = message;
    return data;
  }
}
class MessageModel {
  String? senderId;
  String? receiverId;
  String? dateTime;
  String? text;
  String? fileName;
  String? fileSize;
  String? fileType;
  String? fileUrl;
  String? image;

  MessageModel({
    this.senderId,
    this.receiverId,
    this.dateTime,
    this.fileUrl,
    this.text,
    this.fileName,
    this.fileSize,
    this.fileType,
    this.image,
  });
  MessageModel.fromJson(Map<String, dynamic> json) {
    senderId = json['senderId'];
    receiverId = json['receiverId'];
    dateTime = json['dateTime'];
    text = json['text'];
    fileName = json['Name'];
    fileType = json['Type'];
    fileUrl = json['Url'];
    fileSize = json['Size'];
    image = json['image'];
  }
  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'receiverId': receiverId,
      'dateTime': dateTime,
      'text': text ?? "",
      'Name': fileName ?? "",
      'Size': fileSize ?? "0.0",
      'Type': fileType ?? "",
      'Url': fileUrl ?? "",
      'image': image ?? "",
    };
  }
}

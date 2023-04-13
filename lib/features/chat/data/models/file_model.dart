class FileModel {
  String? senderId;
  String? receiverId;
  String? dateTime;
  String? fileName;
  String? fileSize;
  String? fileType;

  FileModel({
    this.senderId,
    this.receiverId,
    this.dateTime,
    this.fileName,
    this.fileSize,
    this.fileType,
  });
  FileModel.fromJson(Map<String, dynamic> json) {
    senderId = json['senderId'];
    receiverId = json['receiverId'];
    dateTime = json['dateTime'];
    fileName = json['Name'];
    fileType = json['Type'];
    fileSize = json['Size'];
  }
  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'receiverId': receiverId,
      'dateTime': dateTime,
      'Name': fileName,
      'Size': fileSize,
      'Type': fileType,
    };
  }
}

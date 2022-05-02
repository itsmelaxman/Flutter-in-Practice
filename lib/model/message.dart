class Message {
  final String subject;
  final String body;
  final String profileImage;

  Message(this.subject, this.body, this.profileImage);

  Message.fromJson(Map<String, dynamic> json)
      : subject = json["subject"] == "" ? "N/A" : json["subject"],
        body = json["body"] == "" ? "N/A" : json["body"],
        profileImage = json["profileImage"];
}

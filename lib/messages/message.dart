class Message {
  final String? id;
  final String groupId;
  final String content;
  final DateTime? date;
  final String? createdBy;

  Message(
      {this.id,
      required this.groupId,
      required this.content,
      this.date,
      this.createdBy});

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
        id: map['_id'] as String,
        groupId: map['groupId'] as String,
        content: map['content'] as String,
        date: DateTime.parse(map['date']),
        createdBy: map['createdBy'] as String);
  }

  @override
  String toString() =>
      'Message(id: $id, groupId: $groupId, content: $content, createBy: $createdBy, date: $date)';
}

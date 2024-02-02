class Group {
  final String? id;
  final List<String> members;
  final List<String> admins;
  final DateTime createdDate;
  final String? image;
  final String name;
  final String topic;
  final bool encryption = false;
  final bool blocked = false;
  final bool deleted = false;
  final String createdBy;

  Group(
      {this.id,
      required this.members,
      required this.admins,
      required this.createdDate,
      this.image,
      required this.name,
      required this.topic,
      required this.createdBy});

  factory Group.fromMap(Map<String, dynamic> map) {
    return Group(
        id: map['_id'] as String,
        name: map['name'] as String,
        topic: map['topic'] as String,
        image: map['image'] as String,
        createdDate: DateTime.parse(map['createdDate']),
        createdBy: map['createdBy'] as String,
        members: [],
        admins: []);
  }

  @override
  String toString() =>
      'Group(id: $id, name: $name topic: $topic, createBy: $createdBy,)';
}

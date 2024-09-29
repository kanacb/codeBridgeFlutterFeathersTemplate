class Users {
  late final String id;
  late final String name;
  late final String email;
  String? photo;
  String? mobile;
  String? createdBy;
  String? businessId;
  final String createdAt;
  final String updatedAt;

  Users(
      {required this.id,
      required this.name,
      required this.email,
      this.photo,
      this.mobile,
      this.createdBy,
      this.businessId,
      required this.createdAt,
      required this.updatedAt});

  factory Users.fromMap(Map<String, dynamic> map) {
    return Users(
        id: map['_id'] as String,
        name: map['name'] as String,
        email: map['email'] as String,
        photo: map['photo'] != null ? map['photo'] as String : "",
        mobile: map['mobile'] != null ? map['mobile'] as String : "",
        createdBy: map['createdBy'] != null ? map['businessId'] as String : "",
        businessId:
            map['businessId'] != null ? map['businessId'] as String : "",
        createdAt: map['createdAt'] as String,
        updatedAt: map['updatedAt'] as String);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['photo'] = photo;
    data['mobile'] = mobile;
    data['createdBy'] = createdBy;
    data['businessId'] = businessId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }

  @override
  String toString() =>
      'Users(id: $id, name : $name, email : $email, photo : $photo, mobile : $mobile, createdBy : $createdBy, businessId : $businessId)';
}

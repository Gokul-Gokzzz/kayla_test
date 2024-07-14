class DoctorModel {
  String? id;
  String? name;
  String? districtCategory;
  String? email;
  String? phoneNumber;
  String? genderCategory;
  String? imageUrl;

  DoctorModel({
    this.id,
    this.name,
    this.districtCategory,
    this.email,
    this.phoneNumber,
    this.genderCategory,
    this.imageUrl,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id'],
      name: json['name'],
      districtCategory: json['districtCategory'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      genderCategory: json['genderCategory'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'districtCategory': districtCategory,
      'email': email,
      'phoneNumber': phoneNumber,
      'genderCategory': genderCategory,
      'imageUrl': imageUrl,
    };
  }
}

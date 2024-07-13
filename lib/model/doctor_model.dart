class DoctorModel {
  String? name;

  String? districtCategory;
  String? email;
  String? phoneNumber;
  String? genderCategory;
  final String? imageUrl;

  DoctorModel(
      {this.name,
      this.districtCategory,
      this.email,
      this.phoneNumber,
      this.genderCategory,
      this.imageUrl});

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      name: json['name'],
      districtCategory: json['districtCategory'],
      email: json['email'],
      phoneNumber: json['PhoneNumber'],
      genderCategory: json['genderCategory'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'districtCategory': districtCategory,
      'email': email,
      'PhoneNumber': phoneNumber,
      'genderCategory': genderCategory,
      'imageUrl': imageUrl,
    };
  }
}

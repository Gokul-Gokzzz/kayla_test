import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:developer';

import 'package:doctor_booking/service/doctor_service.dart';
import 'package:doctor_booking/model/doctor_model.dart';

class AddProvider extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final DoctorService doctorService = DoctorService();
  final formKey = GlobalKey<FormState>();
  String? districtCategory;
  String? genderCategory;
  File? image;
  final ImagePicker picker = ImagePicker();
  List<DoctorModel> allDoctor = [];

  void setImage(File pickedImage) {
    image = pickedImage;
    notifyListeners();
  }

  List<DropdownMenuItem<String>> genderItems = [
    const DropdownMenuItem(value: 'Male', child: Text('Male')),
    const DropdownMenuItem(value: 'Female', child: Text('Female')),
  ];

  List<DropdownMenuItem<String>> districtItems = [
    const DropdownMenuItem(value: 'Alappuzha', child: Text('Alappuzha')),
    const DropdownMenuItem(value: 'Ernakulam', child: Text('Ernakulam')),
    const DropdownMenuItem(value: 'Idukki', child: Text('Idukki')),
    const DropdownMenuItem(value: 'Kannur', child: Text('Kannur')),
    const DropdownMenuItem(value: 'Kasaragod', child: Text('Kasaragod')),
    const DropdownMenuItem(value: 'Kollam', child: Text('Kollam')),
    const DropdownMenuItem(value: 'Kottayam', child: Text('Kottayam')),
    const DropdownMenuItem(value: 'Kozhikode', child: Text('Kozhikode')),
    const DropdownMenuItem(value: 'Malappuram', child: Text('Malappuram')),
    const DropdownMenuItem(value: 'Palakkad', child: Text('Palakkad')),
    const DropdownMenuItem(
        value: 'Pathanamthitta', child: Text('Pathanamthitta')),
    const DropdownMenuItem(
        value: 'Thiruvananthapuram', child: Text('Thiruvananthapuram')),
    const DropdownMenuItem(value: 'Thrissur', child: Text('Thrissur')),
    const DropdownMenuItem(value: 'Wayanad', child: Text('Wayanad')),
  ];

  Future<void> addDoctor({
    required String name,
    required String districtCategory,
    required String email,
    required String phoneNumber,
    required String genderCategory,
    File? image,
  }) async {
    try {
      String imageUrl = '';
      if (image != null) {
        imageUrl = await doctorService.uploadImage(image);
      }
      final doctor = DoctorModel(
        name: name,
        districtCategory: districtCategory,
        email: email,
        phoneNumber: phoneNumber,
        genderCategory: genderCategory,
        imageUrl: imageUrl,
      );
      await doctorService.addDoctor(doctor);
      getDoctor();
      notifyListeners();
    } catch (error) {
      log('add controller error:$error');
    }
  }

  Future<void> getDoctor() async {
    allDoctor = await doctorService.getAllDoctors();
    notifyListeners();
  }

  Future<void> clear() async {
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    image = null;
    districtCategory = null;
    genderCategory = null;
    notifyListeners();
  }

  editDoctor(doctorid, DoctorModel data) async {
    try {
      await doctorService.editDoctor(doctorid, data);
      notifyListeners();
    } catch (e) {
      log("error in edit :: $e");
    }
  }

  deleteDoctor(String id) async {
    try {
      await doctorService.delete(id);

      getDoctor();
    } catch (e) {
      rethrow;
    }
  }
}

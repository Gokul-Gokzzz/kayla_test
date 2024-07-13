import 'dart:developer';
import 'dart:io';

import 'package:doctor_booking/model/doctor_model.dart';
import 'package:doctor_booking/service/doctor_service.dart';
import 'package:flutter/material.dart';

class AddProvider extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final DoctorService doctorService = DoctorService();
  final formKey = GlobalKey<FormState>();
  String? districtCategory;
  String? genderCategory;
  File? image;
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
        value: 'Thiruvananthapuram',
        child: Text(
          'Trivandrum',
        )),
    const DropdownMenuItem(value: 'Thrissur', child: Text('Thrissur')),
    const DropdownMenuItem(value: 'Wayanad', child: Text('Wayanad')),
  ];

  Future<void> addDoctor(
      {required String name,
      required String districtCategory,
      required String email,
      required String phoneNumber,
      required String genderCategory,
      File? image}) async {
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
      notifyListeners();
    } catch (error) {
      log('add controller error:$error');
    }
  }
}

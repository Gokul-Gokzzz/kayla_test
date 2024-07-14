import 'package:flutter/material.dart';
import 'package:doctor_booking/service/doctor_service.dart';
import 'package:doctor_booking/model/doctor_model.dart';

class HomeProvider extends ChangeNotifier {
  final DoctorService doctorService = DoctorService();
  List<DoctorModel> allDoctors = [];
  List<DoctorModel> filteredDoctors = [];
  String? selectedGender;
  String? selectedDistrict;

  HomeProvider() {
    getDoctor();
  }

  Future<void> getDoctor() async {
    allDoctors = await doctorService.getAllDoctors();
    filteredDoctors = allDoctors;
    notifyListeners();
  }

  void filterDoctors() {
    if (selectedGender == null && selectedDistrict == null) {
      filteredDoctors = allDoctors;
    } else {
      filteredDoctors = allDoctors.where((doctor) {
        bool matchesGender =
            selectedGender == null || doctor.genderCategory == selectedGender;
        bool matchesDistrict = selectedDistrict == null ||
            doctor.districtCategory == selectedDistrict;
        return matchesGender && matchesDistrict;
      }).toList();
    }
    notifyListeners();
  }

  void setSelectedGender(String? gender) {
    selectedGender = gender;
    filterDoctors();
  }

  void setSelectedDistrict(String? district) {
    selectedDistrict = district;
    filterDoctors();
  }
}

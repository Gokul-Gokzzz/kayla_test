import 'dart:developer';

import 'package:doctor_booking/views/appoinment_page.dart';
import 'package:doctor_booking/views/home_screen.dart';
import 'package:doctor_booking/views/prescription_page.dart';
import 'package:doctor_booking/views/profile_page.dart';
import 'package:flutter/material.dart';

class BottomProvider extends ChangeNotifier {
  int userCurrentIndex = 0;

  void onTap(int index) {
    userCurrentIndex = index;
    notifyListeners();
    log('$userCurrentIndex');
  }

  List userScreens = [
    const HomeScreen(),
    const AppoinmentPage(),
    const PrescriptionPage(),
    const ProfilePage()
  ];
}

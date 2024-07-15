// ignore_for_file: avoid_unnecessary_containers

import 'package:doctor_booking/controller/bottom_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<BottomProvider>(
          builder: (context, value, child) =>
              value.userScreens[value.userCurrentIndex]),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
        child: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Consumer<BottomProvider>(
              builder: (context, value, child) => BottomNavigationBar(
                unselectedFontSize: 11,
                selectedFontSize: 12,
                type: BottomNavigationBarType.fixed,
                onTap: value.onTap,
                backgroundColor: const Color(0xFFFFFFFF),
                currentIndex: value.userCurrentIndex,
                // ignore: prefer_const_constructors
                selectedItemColor: Color.fromARGB(255, 10, 156, 66),
                unselectedItemColor: const Color(0xFF98A3B3),
                showUnselectedLabels: true,
                items: [
                  BottomNavigationBarItem(
                    icon: value.userCurrentIndex == 0
                        ? const Icon(Icons.home_filled)
                        : const Icon(
                            Icons.home,
                          ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: value.userCurrentIndex == 1
                        ? const Icon(Icons.calendar_month)
                        : const Icon(Icons.calendar_month_outlined),
                    label: 'Appointment',
                  ),
                  BottomNavigationBarItem(
                    icon: value.userCurrentIndex == 2
                        ? const Icon(Icons.note_alt)
                        : const Icon(Icons.note_alt_outlined),
                    label: 'Prescription',
                  ),
                  BottomNavigationBarItem(
                    icon: value.userCurrentIndex == 3
                        ? const Icon(Icons.person)
                        : const Icon(Icons.person_2_outlined),
                    label: 'Profile',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

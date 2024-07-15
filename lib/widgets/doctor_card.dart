import 'package:doctor_booking/model/doctor_model.dart';
import 'package:doctor_booking/widgets/edit_screen.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final DoctorModel doctor;

  const DoctorCard({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          height: 50,
          width: 50,
          child: Image.network(doctor.imageUrl!),
        ),
        title: Text(
          "Dr ${doctor.name!}",
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              doctor.email!,
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
            ),
            Text(
              doctor.districtCategory!,
              style: const TextStyle(
                fontSize: 10,
              ),
            ),
          ],
        ),
        trailing: SizedBox(
          height: 30,
          width: 100,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(Colors.green),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditDoctorScreen(doctor: doctor),
                ),
              );
            },
            child: const Text(
              'Edit Profile',
              style: TextStyle(
                color: Color.fromARGB(255, 147, 106, 106),
                fontSize: 10,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

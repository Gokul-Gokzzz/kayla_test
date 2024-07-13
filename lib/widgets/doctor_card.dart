import 'package:doctor_booking/widgets/edit_screen.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final String name;
  final String email;
  final String district;

  DoctorCard({required this.name, required this.email, required this.district});

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
          child: Image.asset('assets/doto.jpg'),
        ),
        title: Text(
          name,
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              email,
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
            ),
            Text(
              district,
              style: TextStyle(
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
                  builder: (context) => EditDoctorScreen(),
                ),
              );
            },
            child: Text(
              'Edit Profile',
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          ),
        ),
      ),
    );
  }
}

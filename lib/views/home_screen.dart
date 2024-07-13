import 'package:doctor_booking/controller/home_controller.dart';
import 'package:doctor_booking/widgets/add_screen.dart';
import 'package:doctor_booking/widgets/doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final pro = Provider.of<HomeProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctors'),
        actions: [
          SizedBox(
            width: size.width * 0.3,
            child: DropdownButton<String>(
              underline: const SizedBox(
                height: 0,
              ),
              hint: const Text('Gender'),
              isExpanded: true,
              items: pro.genderItems,
              onChanged: (value) {},
            ),
          ),
          SizedBox(
            width: size.width * 0.3,
            child: DropdownButton<String>(
              underline: const SizedBox(
                height: 0,
              ),
              hint: const Text('District'),
              isExpanded: true,
              items: pro.districtItems,
              onChanged: (value) {},
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          vertical: size.height * 0.02,
          horizontal: size.width * 0.02,
        ),
        children: [
          DoctorCard(
            name: 'Dr.Neeraj Madhav',
            email: 'neeraj@gmail.com',
            district: 'Ernakulam',
          ),
          DoctorCard(
              name: 'Dr.Rashma R Mohan',
              email: 'rashma@gmail.com',
              district: 'Ernakulam'),
          DoctorCard(
              name: 'Dr.Ravi', email: 'ravi@gmail.com', district: 'Ernakulam'),
          DoctorCard(
              name: 'Dr.Ravi', email: 'ravi@gmail.com', district: 'Ernakulam'),
          DoctorCard(
              name: 'Dr.Ravi', email: 'ravi@gmail.com', district: 'Ernakulam'),
          DoctorCard(
              name: 'Dr.Ravi', email: 'ravi@gmail.com', district: 'Ernakulam'),
          DoctorCard(
              name: 'Dr.Ravi', email: 'ravi@gmail.com', district: 'Ernakulam'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddDoctors(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

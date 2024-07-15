import 'package:doctor_booking/controller/add_controller.dart';
import 'package:doctor_booking/widgets/add_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:doctor_booking/controller/home_controller.dart';
import 'package:doctor_booking/widgets/doctor_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<HomeProvider>(context, listen: false).getDoctor();
  }

  Future<void> refreshDoctors() async {
    await Provider.of<HomeProvider>(context, listen: false).getDoctor();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final homeProvider = Provider.of<HomeProvider>(context);
    final pro = Provider.of<AddProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctors'),
        actions: [
          SizedBox(
            width: size.width * 0.3,
            child: DropdownButton<String>(
              underline: const SizedBox(height: 0),
              hint: const Text('Gender'),
              isExpanded: true,
              value: homeProvider.selectedGender,
              items: pro.genderItems,
              onChanged: (value) {
                homeProvider.setSelectedGender(value);
              },
            ),
          ),
          SizedBox(
            width: size.width * 0.3,
            child: DropdownButton<String>(
              underline: const SizedBox(height: 0),
              hint: const Text('District'),
              isExpanded: true,
              value: homeProvider.selectedDistrict,
              items: pro.districtItems,
              onChanged: (value) {
                homeProvider.setSelectedDistrict(value);
              },
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: refreshDoctors,
        child: Consumer<HomeProvider>(
          builder: (context, provider, child) {
            if (provider.filteredDoctors.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemCount: provider.filteredDoctors.length,
                itemBuilder: (context, index) {
                  final doctor = provider.filteredDoctors[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.02,
                      horizontal: size.width * 0.02,
                    ),
                    child: DoctorCard(doctor: doctor),
                  );
                },
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        shape: const CircleBorder(),
        onPressed: () {
          pro.clear();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddDoctors(),
            ),
          ).then((_) => refreshDoctors());
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

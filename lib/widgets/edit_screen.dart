import 'dart:developer';
import 'dart:io';

import 'package:doctor_booking/controller/add_controller.dart';
import 'package:doctor_booking/model/doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditDoctorScreen extends StatefulWidget {
  final DoctorModel doctor;

  const EditDoctorScreen({Key? key, required this.doctor}) : super(key: key);

  @override
  State<EditDoctorScreen> createState() => _EditDoctorScreenState();
}

class _EditDoctorScreenState extends State<EditDoctorScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final editProvider = Provider.of<AddProvider>(context, listen: false);

      editProvider.nameController.text = widget.doctor.name ?? '';
      editProvider.emailController.text = widget.doctor.email ?? '';
      editProvider.phoneController.text = widget.doctor.phoneNumber ?? '';
      editProvider.districtCategory =
          widget.doctor.districtCategory ?? 'Default District';
      editProvider.genderCategory =
          widget.doctor.genderCategory ?? 'Default Gender';
      log("number :${widget.doctor.phoneNumber.toString()}");
    });
  }

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<AddProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Edit Doctor'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: () async {
              await pro.deleteDoctor(widget.doctor.id!);
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.doctor.imageUrl!),
                child: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () async {
                    final pickedFile =
                        await pro.picker.pickImage(source: ImageSource.gallery);
                    if (pickedFile != null) {
                      pro.setImage(File(pickedFile.path));
                    }
                  },
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: pro.nameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.withOpacity(.2),
                  labelText: 'Full Name',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 15),
              DropdownButtonFormField<String>(
                value: pro.districtCategory,
                items: pro.districtItems,
                onChanged: (value) {
                  pro.districtCategory = value;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.withOpacity(.2),
                  labelText: 'District',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: pro.emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.withOpacity(.2),
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: pro.phoneController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.withOpacity(.2),
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 15),
              DropdownButtonFormField<String>(
                value: pro.genderCategory,
                items: pro.genderItems,
                onChanged: (value) {
                  pro.genderCategory = value;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.withOpacity(.2),
                  labelText: 'Gender',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 66, 131, 68),
                  ),
                  onPressed: () async {
                    update(widget.doctor);
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  update(DoctorModel doctor) async {
    final pro = Provider.of<AddProvider>(context, listen: false);
    doctor.email = pro.emailController.text;
    doctor.name = pro.nameController.text;
    doctor.phoneNumber = pro.phoneController.text;
    doctor.districtCategory = pro.districtCategory.toString();
    doctor.genderCategory = pro.genderCategory.toString();
    await pro.updateDoctor(doctor.id!, doctor);
    Navigator.pop(context);
  }
}

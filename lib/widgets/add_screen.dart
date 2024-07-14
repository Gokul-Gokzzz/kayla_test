import 'dart:io';

import 'package:doctor_booking/controller/add_controller.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddDoctors extends StatefulWidget {
  const AddDoctors({super.key});

  @override
  State<AddDoctors> createState() => _AddDoctorsState();
}

class _AddDoctorsState extends State<AddDoctors> {
  Future<void> pickImage() async {
    final provider = Provider.of<AddProvider>(context, listen: false);
    final pickFile =
        await provider.picker.pickImage(source: ImageSource.gallery);
    if (pickFile != null) {
      provider.setImage(File(pickFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Doctor'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: provider.formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: pickImage,
                  child: Consumer<AddProvider>(
                    builder: (context, productProvider, child) {
                      return productProvider.image == null
                          ? Container(
                              height: 100,
                              width: 100,
                              color: Colors.grey[200],
                              child: const Icon(Icons.camera_alt),
                            )
                          : Image.file(productProvider.image!,
                              height: 100, width: 100, fit: BoxFit.cover);
                    },
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: provider.nameController,
                  decoration: InputDecoration(
                      labelText: 'Full Name',
                      filled: true,
                      fillColor: Colors.grey.withOpacity(.2),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Full Name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                DropdownButtonFormField(
                  items: provider.districtItems,
                  onChanged: (value) {
                    provider.districtCategory = value.toString();
                  },
                  decoration: InputDecoration(
                      labelText: 'District',
                      filled: true,
                      fillColor: Colors.grey.withOpacity(.2),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter correct District';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: provider.emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      filled: true,
                      fillColor: Colors.grey.withOpacity(.2),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Email';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: provider.phoneController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Phone Number',
                      filled: true,
                      fillColor: Colors.grey.withOpacity(.2),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Phone Number';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                DropdownButtonFormField<String>(
                  items: provider.genderItems,
                  onChanged: (value) {
                    provider.genderCategory = value.toString();
                  },
                  decoration: InputDecoration(
                      labelText: 'Gender',
                      filled: true,
                      fillColor: Colors.grey.withOpacity(.2),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter correct Gender';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 66, 131, 68)),
                    onPressed: () async {
                      if (provider.formKey.currentState!.validate()) {
                        await provider.addDoctor(
                          name: provider.nameController.text,
                          districtCategory:
                              provider.districtCategory.toString(),
                          email: provider.emailController.text,
                          phoneNumber: provider.phoneController.text,
                          genderCategory: provider.genderCategory.toString(),
                          image: provider.image,
                        );
                        provider.clear();
                      }
                    },
                    child: Text(
                      'Add',
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

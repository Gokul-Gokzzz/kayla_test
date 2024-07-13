import 'package:doctor_booking/controller/add_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddDoctors extends StatelessWidget {
  const AddDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddProvider>(context, listen: false);
    // final TextEditingController nameController = TextEditingController();
    // final TextEditingController emailController = TextEditingController();
    // final TextEditingController phoneController = TextEditingController();
    // List<String> districts = [
    //   'Alappuzha',
    //   'Ernakulam',
    //   'Idukki',
    //   'Kannur',
    //   'Kasaragod',
    //   'Kollam',
    //   'Kottayam',
    //   'Kozhikode',
    //   'Malappuram',
    //   'Palakkad',
    //   'Pathanamthitta',
    //   'Thiruvananthapuram',
    //   'Thrissur',
    //   'Wayanad'
    // ];

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
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/doto.jpg'),
                  child: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {},
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
                ElevatedButton(
                  onPressed: () async {
                    if (provider.formKey.currentState!.validate()) {
                      await provider.addDoctor(
                        name: provider.nameController.text,
                        districtCategory: provider.districtCategory.toString(),
                        email: provider.emailController.text,
                        phoneNumber: provider.phoneController.text,
                        genderCategory: provider.genderCategory.toString(),
                        image: provider.image,
                      );
                    }
                  },
                  child: Text('Add'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  List<DropdownMenuItem<String>> genderItems = [
    const DropdownMenuItem(value: 'Male', child: Text('Male')),
    const DropdownMenuItem(value: 'Female', child: Text('Female')),
  ];

  List<DropdownMenuItem<String>> districtItems = [
    const DropdownMenuItem(value: 'Alappuzha', child: Text('Alappuzha')),
    const DropdownMenuItem(value: 'Ernakulam', child: Text('Ernakulam')),
    const DropdownMenuItem(value: 'Idukki', child: Text('Idukki')),
    const DropdownMenuItem(value: 'Kannur', child: Text('Kannur')),
    const DropdownMenuItem(value: 'Kasaragod', child: Text('Kasaragod')),
    const DropdownMenuItem(value: 'Kollam', child: Text('Kollam')),
    const DropdownMenuItem(value: 'Kottayam', child: Text('Kottayam')),
    const DropdownMenuItem(value: 'Kozhikode', child: Text('Kozhikode')),
    const DropdownMenuItem(value: 'Malappuram', child: Text('Malappuram')),
    const DropdownMenuItem(value: 'Palakkad', child: Text('Palakkad')),
    const DropdownMenuItem(
        value: 'Pathanamthitta', child: Text('Pathanamthitta')),
    const DropdownMenuItem(
        value: 'Thiruvananthapuram',
        child: Text(
          'Trivandrum',
        )),
    const DropdownMenuItem(value: 'Thrissur', child: Text('Thrissur')),
    const DropdownMenuItem(value: 'Wayanad', child: Text('Wayanad')),
  ];
}

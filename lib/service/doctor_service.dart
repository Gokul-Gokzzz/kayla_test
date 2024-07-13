import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_booking/model/doctor_model.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DoctorService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;
  String collection = 'doctor';

  Future<void> addDoctor(DoctorModel doctor) async {
    try {
      await firestore.collection(collection).doc().set(doctor.toJson());
    } catch (error) {
      log('service error:$error');
    }
  }

  Future<String> uploadImage(File image) async {
    final storageRef = storage
        .ref()
        .child('doctor_image/${DateTime.now().microsecondsSinceEpoch}');
    final uploadTask = await storageRef.putFile(image);
    return await uploadTask.ref.getDownloadURL();
  }
}

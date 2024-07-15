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
      DocumentReference docRef = firestore.collection(collection).doc();
      String id = docRef.id;

      doctor.id = id;

      await docRef.set(doctor.toJson());
    } catch (error) {
      rethrow;
    }
  }

  Future<String> uploadImage(File image) async {
    final storageRef = storage
        .ref()
        .child('doctor_image/${DateTime.now().microsecondsSinceEpoch}');
    final uploadTask = await storageRef.putFile(image);
    return await uploadTask.ref.getDownloadURL();
  }

  Future<List<DoctorModel>> getAllDoctors() async {
    try {
      final snapshot = await firestore.collection(collection).get();
      List<DoctorModel> data = snapshot.docs
          .map(
            (doc) => DoctorModel.fromJson(doc.data()),
          )
          .toList();
      return data;
    } catch (e) {
      rethrow;
    }
  }

  editDoctor(doctorid, DoctorModel data) async {
    try {
      await firestore
          .collection(collection)
          .doc(doctorid)
          .update(data.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> delete(String id) async {
    try {
      await firestore.collection(collection).doc(id).delete();
    } catch (e) {
      rethrow;
    }
  }
}

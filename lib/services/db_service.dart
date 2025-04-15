import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
class DBService {
  static CollectionReference users = FirebaseFirestore.instance.collection('Users');
  static CollectionReference course_years = FirebaseFirestore.instance.collection('Course_Years');





  static FirebaseStorage storage = FirebaseStorage.instance;


  static Reference getStorageRef(String path)
  {
    return storage.ref(path);
  }
}
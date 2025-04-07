import 'package:cloud_firestore/cloud_firestore.dart';

class DBService {
  static CollectionReference users = FirebaseFirestore.instance.collection('Users');
}
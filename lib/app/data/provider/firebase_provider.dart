import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseProvider {
  final String? _user = FirebaseAuth.instance.currentUser?.uid;
// Suggested code may be subject to a license. Learn more: ~LicenseLog:73160156.
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  void insert(data){

  }
}

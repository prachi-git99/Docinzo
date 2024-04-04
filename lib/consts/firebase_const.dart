import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

FirebaseAuth auth = FirebaseAuth.instance;

FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseStorage firebaseStorage = FirebaseStorage.instance;

User? currentUser = auth
    .currentUser; //jo bhi user login hoga uska sara data is var k help se get kr sakte h

// collections
const usersCollection = "users";
const doctorsCollection = "doctors";
const reportCollection = "my_reports";
const appointmentCollection = "my_appointments";
const notificationCollection = "notification";

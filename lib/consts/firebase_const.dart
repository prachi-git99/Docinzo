import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseStorage firebaseStorage = FirebaseStorage.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
User? currentUser = auth.currentUser;
// collections
const usersCollection = "users";
const doctorsCollection = "doctors";
const reportCollection = "my_reports";
const healthHistoryCollection = "my_health_history";
const appointmentCollection = "my_appointments";
const notificationCollection = "notification";

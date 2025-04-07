import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cse_connect/locator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cse_connect/model/user_model.dart';
import 'package:cse_connect/services/db_service.dart';

class UserService {
  static User? currentUser = FirebaseAuth.instance.currentUser;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool get loggedIn => _auth.currentUser != null;
  User? get getUser => _auth.currentUser;

  UserService() {
    _auth.authStateChanges().listen((onData) {
      print(onData);
    });
  }


  Future<User?> googleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication authDetails = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: authDetails.accessToken,
        idToken: authDetails.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(credential);

      return userCredential.user;
    } catch (e) {
      print('Error during Google Sign-In: $e');
      navigationService.showSnackBar(e.toString());
      return null;
    }
  }

  Future<UserModel> fetchUserDoc() async {
    try {
      // Get the current user's UID
      final String uid = FirebaseAuth.instance.currentUser?.uid ?? '';

      if (uid.isEmpty) {
        throw Exception("User not logged in.");
      }

      // Reference to the Firestore `users` collection
      final DocumentSnapshot<Map<String, dynamic>> docSnapshot =
      await FirebaseFirestore.instance.collection('users').doc(uid).get();

      if (!docSnapshot.exists) {
        throw Exception("User document does not exist.");
      }

      final UserModel fetchedUser = UserModel.fromJson(docSnapshot.data()!);
      print(fetchedUser.toString());
      // Map the fetched document data to the `UserModel`
      return fetchedUser;
    } catch (e) {
      throw Exception("Failed to fetch user document: $e");
    }
  }
  Future<void> logOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  Future<void> createNewUser(UserModel user) async {
    try{
    await DBService.users.doc(user.uid).set(user.toJson());
    }
    catch(error)
    {
      navigationService.showSnackBar(error as String);
    }
    return;
  }

}
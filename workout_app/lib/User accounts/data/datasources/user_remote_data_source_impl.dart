import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';
import '../../domain/entities/user_entity.dart';
import 'user_remote_data_source.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  UserRemoteDataSourceImpl({
    required this.firebaseAuth,
    required this.firestore,
  });

  @override
  Future<UserModel> signUp({
    required String email,
    required String password,
    required UserRole role,
  }) async {
    final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = userCredential.user!;
    final userModel = UserModel(
      id: user.uid,
      email: user.email!,
      role: role,
    );

    await firestore.collection('users').doc(user.uid).set(userModel.toMap());
    return userModel;
  }

  @override
  Future<UserModel> logIn({
    required String email,
    required String password,
  }) async {
    final userCredential = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = userCredential.user!;
    final doc = await firestore.collection('users').doc(user.uid).get();

    return UserModel.fromFirebaseUser(user.uid, user.email!, doc);
  }

  @override
  Future<void> logOut() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<UserModel> getCurrentUser() async {
    final user = firebaseAuth.currentUser;
    if (user == null) throw Exception('No user logged in');
    final doc = await firestore.collection('users').doc(user.uid).get();
    return UserModel.fromFirebaseUser(user.uid, user.email!, doc);
  }

  @override
  Future<UserModel> updateProfile(UserModel user) async {
    await firestore.collection('users').doc(user.id).update(user.toMap());
    final doc = await firestore.collection('users').doc(user.id).get();
    return UserModel.fromFirebaseUser(user.id, user.email, doc);
  }
}

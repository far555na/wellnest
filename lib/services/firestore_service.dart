import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addUserProfile({
    required String userId,
    required String name,
    required String gender,
    required int age,
    required double height,
    required double weight,
  }) async {
    await _db.collection('users').doc(userId).set({
      'name': name,
      'gender': gender,
      'age': age,
      'height': height,
      'weight': weight,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserProfile(
    String userId,
  ) async {
    return _db.collection('users').doc(userId).get();
  }

  Future<void> updateWeight({
    required String userId,
    required double weight,
  }) async {
    await _db.collection('users').doc(userId).update({
      'weight': weight,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }
}


import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/foundation.dart';

import 'package:image_picker/image_picker.dart';



class FirestoreDatabase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Initialize Firebase in your constructor
  FirestoreDatabase() {
    Firebase.initializeApp();
  }

  // Read data from Firestore
  Future<DocumentSnapshot?> readData(
      String collectionName, String documentId) async {
    try {
      DocumentSnapshot documentSnapshot =
          await _firestore.collection(collectionName).doc(documentId).get();
      return documentSnapshot;
    } catch (e) {
      print("Error reading data: $e");
      return null;
    }
  }

  Future<QuerySnapshot?> readDataFromCollection(
    String collectionName) async {
  try {
    QuerySnapshot querySnapshot  =
        await _firestore.collection(collectionName).get();
    return querySnapshot;
  } catch (e) {
    print("Error reading data: $e");
    return null;
  }
}

Future<QuerySnapshot?> readDataFromCollectionWithFilterEqual(
  String collectionName, String fieldName,  String filterName) async {
try {
  QuerySnapshot querySnapshot  =
      await _firestore.collection(collectionName).where(fieldName, isEqualTo: filterName)
      .get();
  return querySnapshot;
} catch (e) {
  print("Error reading data: $e");
  return null;
}
}



  // Write data to Firestore
  Future<void> writeData(
      String collectionName, Map<String, dynamic> data) async {
    try {
      await _firestore.collection(collectionName).doc().set(data);
    } catch (e) {
      print("Error writing data: $e");
    }
  }

  Future<void> writeDataWithDocName(
    String collectionName, Map<String, dynamic> data, String document) async {
  try {
    await _firestore.collection(collectionName).doc(document).collection('Products').doc().set(data);
  } catch (e) {
    print("Error writing data: $e");
  }
}
  Future<String> uploadFile(XFile? file) async {
    try {
      late UploadTask uploadTask;
  
      // Create a Reference to the file
      Reference ref = FirebaseStorage.instance
          .ref()
          .child('category-images')
          .child('/${file?.path.split('/').last}');
  
      final metadata = SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {'picked-file-path': file!.path.split('/').last},
      );
  
      if (kIsWeb) {
        uploadTask = ref.putData(await file.readAsBytes(), metadata);
      } else {
        uploadTask = ref.putFile(File(file.path), metadata);
      }
  
      await uploadTask.whenComplete(() {});
      
      // Upload completed successfully
      final downloadUrl = await ref.getDownloadURL();
     
      return downloadUrl;
    } catch (e) {
      print("Error uploading file: $e");
      return ""; // or handle the error in a different way
    }
   
  }
}

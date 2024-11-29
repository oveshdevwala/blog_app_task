import 'dart:io';

import 'package:blog_app_task/core/common/common.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BlogRepository {
  final FirebaseFirestore firebaseFirestore;

  BlogRepository(this.firebaseFirestore);

  Future<List<BlogModel>> getAllBlogs() async {
    List<BlogModel> blogs = [];
    try {
      final res = await firebaseFirestore
          .collection('blogs')
          .orderBy('id', descending: false)
          .get();

      for (var each in res.docs) {
        blogs.add(BlogModel.fromJson(each.data()));
      }
      return blogs;
    } on FirebaseException catch (e) {
      debugPrint(' FirebaseException Error :${e.message}\nCode: ${e.message}');
    } on SocketException catch (e) {
      debugPrint('SocketException Error :${e.message}\nCode: ${e.message}');
    } catch (e) {
      debugPrint('Error :${e.toString()}\n');
    }
    return blogs;
  }

  Future<BlogModel> getBlogById(int id) async {
    BlogModel? blogs;
    try {
      final res = await firebaseFirestore
          .collection('blogs')
          .where('id', isEqualTo: id)
          .get();
      blogs = BlogModel.fromJson(res.docs.first.data());
    } on FirebaseException catch (e) {
      debugPrint(' FirebaseException Error :${e.message}\nCode: ${e.message}');
    } on SocketException catch (e) {
      debugPrint('SocketException Error :${e.message}\nCode: ${e.message}');
    } catch (e) {
      debugPrint('Error :${e.toString()}\n');
    }
    return blogs!;
  }
}

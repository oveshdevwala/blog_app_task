import 'package:blog_app_task/core/common/common.dart';
import 'package:blog_app_task/features/blog_upload/repository/dummy_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BlogRepo {
  static final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  static uploadBlog() async {
    List<BlogModel> blogs = [];
    for (var each in dummyBlogData) {
      blogs.add(BlogModel.fromJson(each));
    }
    for (var each in blogs) {
      await firebaseFirestore.collection('blogs').add(each.toJson());
    }
  }
}

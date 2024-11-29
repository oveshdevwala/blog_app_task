import 'package:blog_app_task/features/blog_upload/screens/blog_upload_view.dart';
import 'package:flutter/material.dart';

class BlogUploadPage extends StatelessWidget {
  const BlogUploadPage({super.key});
  static Route<void> route() =>
      MaterialPageRoute(builder: (context) => const BlogUploadPage());
  @override
  Widget build(BuildContext context) {
    return const BlogUploadView();
  }
}

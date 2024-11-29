import 'package:blog_app_task/features/blog_upload/blog_upload.dart';
import 'package:flutter/material.dart';

class BlogUploadView extends StatelessWidget {
  const BlogUploadView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Blog'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () async {

              await BlogRepo.uploadBlog();
            },
            child: const Text('Upload All Data')),
      ),
    );
  }
}

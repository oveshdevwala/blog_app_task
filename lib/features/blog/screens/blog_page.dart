import 'package:blog_app_task/features/blog/screens/blog_view.dart';
import 'package:flutter/material.dart';
class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  static Route<void> route() =>
      MaterialPageRoute(builder: (context) => const BlogPage());
  @override
  Widget build(BuildContext context) {
    return const BlogView();
  }
}

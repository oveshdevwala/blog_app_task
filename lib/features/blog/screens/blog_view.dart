import 'package:blog_app_task/features/blog/blog.dart';
import 'package:blog_app_task/features/blog_upload/screens/blog_upload_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlogView extends StatelessWidget {
  const BlogView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: const _UploadButton(),
      appBar: AppBar(
        title: const Text('Blog App'),
        actions: [
          IconButton(
              onPressed: () {
                context.read<BlogBloc>().add(BlogFetchEvents());
              },
              icon: const Icon(Icons.refresh_rounded))
        ],
      ),
      body: BlocBuilder<BlogBloc, BlogState>(
        builder: (context, state) {
          if (state.status == BlogStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.status == BlogStatus.failure) {
            return Center(
                child: Text(state.error ?? 'Unknown Error',
                    style: TextTheme.of(context).titleLarge));
          }

          if (state.status == BlogStatus.success) {
            if (state.blogs == null || state.blogs!.isEmpty) {
              return Center(
                  child: Text(
                'No Blogs Avaliable',
                style: TextTheme.of(context).titleLarge,
              ));
            }

            return ListView.builder(
                itemCount: state.blogs!.length,
                itemBuilder: (context, index) {
                  final blog = state.blogs![index];
                  return BlogListTile(blog: blog);
                });
          }
          return const Center(child: Text('No Blogs Avaliable'));
        },
      ),
    );
  }
}

// ignore: unused_element
class _UploadButton extends StatelessWidget {
  const _UploadButton();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(context, BlogUploadPage.route());
      },
      child: const Icon(Icons.add),
    );
  }
}

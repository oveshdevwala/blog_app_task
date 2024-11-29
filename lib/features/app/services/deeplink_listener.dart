import 'dart:async';
import 'package:app_links/app_links.dart';
import 'package:blog_app_task/features/blog/blog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeepLinkListener extends StatefulWidget {
  const DeepLinkListener({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  State<DeepLinkListener> createState() => _DeepLinkListenerState();
}

class _DeepLinkListenerState extends State<DeepLinkListener> {
  StreamSubscription? _uriSubscription;

  @override
  void initState() {
    super.initState();

    final appLinks = AppLinks();

    // Listen for incoming deep links
    _uriSubscription = appLinks.uriLinkStream.listen((uri) {
      debugPrint('Deep Link Received: ${uri.toString()}');

      if (uri.pathSegments.isNotEmpty && uri.pathSegments.first == 'blog') {
        final id = uri.pathSegments.last;
        final blogId = int.parse(id);
        debugPrint('blogId: $blogId');
        if(mounted) context.read<BlogBloc>().add(BlogFetchByIdEvents(blogId));
      }
    });
  }

  @override
  void dispose() {
    _uriSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BlogBloc, BlogState>(
      listener: (context, state) {
        if (state.status == BlogStatus.success &&
            state.deepLinkblog != null &&
            state.isDeepLink) {
          Navigator.of(context).push(
            BlogDetailsView.route(state.deepLinkblog!),
          );
          if (state.deepLinkblog == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Failed to load blog')),
            );
          }
        } else if (state.status == BlogStatus.failure) {
          context.read<BlogBloc>().add(BlogFetchEvents());
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to load blog')),
          );
        }
      },
      child: widget.child,
    );
  }
}

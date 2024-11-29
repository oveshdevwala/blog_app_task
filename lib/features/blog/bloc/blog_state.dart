// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'blog_bloc.dart';

enum BlogStatus { initial, loading, success, failure }

class BlogState extends Equatable {
  const BlogState({
    required this.status,
    this.error,
    this.blogs,
    this.deepLinkblog,
    this.isDeepLink=false,
  });

  final BlogStatus status;
  final String? error;
  final List<BlogModel>? blogs;
  final BlogModel? deepLinkblog;
  final bool isDeepLink;
  @override
  List<Object?> get props => [status, error, blogs, deepLinkblog,isDeepLink];

  BlogState copyWith({
    BlogStatus? status,
    String? error,
    List<BlogModel>? blogs,
    BlogModel? deepLinkblog,
    bool? isDeepLink,
  }) {
    return BlogState(
      status: status ?? this.status,
      error: error ?? this.error,
      blogs: blogs ?? this.blogs,
      deepLinkblog: deepLinkblog ?? this.deepLinkblog,
      isDeepLink: isDeepLink ?? this.isDeepLink,
    );
  }
}

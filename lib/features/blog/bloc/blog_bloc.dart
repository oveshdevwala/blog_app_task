import 'dart:async';
import 'dart:io';

import 'package:blog_app_task/core/common/common.dart';
import 'package:blog_app_task/features/blog/blog.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'blog_events.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final BlogRepository _blogRepository;
  BlogBloc(BlogRepository blogRepository)
      : _blogRepository = blogRepository,
        super(const BlogState(
          status: BlogStatus.initial,
        )) {
    on<BlogFetchEvents>(_fetchBlogs);
    on<BlogFetchByIdEvents>(_fetchBlogsById);
  }

  FutureOr<void> _fetchBlogs(
      BlogFetchEvents event, Emitter<BlogState> emit) async {
    emit(state.copyWith(status: BlogStatus.loading));
    try {
      final blog = await _blogRepository.getAllBlogs();
      emit(state.copyWith(status: BlogStatus.success, blogs: blog,isDeepLink: false));
    } on FirebaseException catch (e) {
      emit(state.copyWith(status: BlogStatus.failure, error: e.message));
    } on SocketException catch (e) {
      emit(state.copyWith(status: BlogStatus.failure, error: e.message));
    } on Exception catch (e) {
      emit(state.copyWith(status: BlogStatus.failure, error: e.toString()));
    } catch (e) {
      emit(state.copyWith(status: BlogStatus.failure, error: e.toString()));
    }
  }

  FutureOr<void> _fetchBlogsById(
      BlogFetchByIdEvents event, Emitter<BlogState> emit) async {
    // emit(state.copyWith(status: BlogStatus.loading));
    try {
      print('Bloc is Fetching To Blog with Id');
      final blog = await _blogRepository.getBlogById(event.id);
      emit(state.copyWith(status: BlogStatus.success, deepLinkblog: blog,isDeepLink: true));
    } on FirebaseException catch (e) {
      emit(state.copyWith(status: BlogStatus.failure, error: e.message));
    } on SocketException catch (e) {
      emit(state.copyWith(status: BlogStatus.failure, error: e.message));
    } on Exception catch (e) {
      emit(state.copyWith(status: BlogStatus.failure, error: e.toString()));
    } catch (e) {
      emit(state.copyWith(status: BlogStatus.failure, error: e.toString()));
    }
  }
}

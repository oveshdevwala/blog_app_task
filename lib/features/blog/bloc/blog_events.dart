// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'blog_bloc.dart';

abstract class BlogEvent extends Equatable {
  const BlogEvent();

  @override
  List<Object> get props => [];
}

class BlogFetchEvents extends BlogEvent {}

class BlogFetchByIdEvents extends BlogEvent {
  final int id;

  const BlogFetchByIdEvents(
    this.id,
  );
}

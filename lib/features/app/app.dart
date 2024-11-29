import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blog_app_task/core/core.dart';
import 'package:blog_app_task/features/blog/blog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<BlogBloc>(
              create: (context) =>
                  BlogBloc(BlogRepository(FirebaseFirestore.instance))
                    ..add(BlogFetchEvents()),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Blog App',
            home: const DeepLinkListener(child: BlogPage()),
            theme: lightTheme(),
          ),
        );
      },
    );
  }
}

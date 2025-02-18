// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:blog_app_task/core/common/common.dart';
import 'package:blog_app_task/core/theme/theme.dart';

class BlogDetailsView extends StatelessWidget {
  const BlogDetailsView({
    super.key,
    required this.blog,
  });
  final BlogModel blog;
  static Route<void> route(BlogModel blog) =>
      MaterialPageRoute(builder: (context) => BlogDetailsView(blog: blog));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: IconButton.styleFrom(backgroundColor: AppColors.grey100),
                icon: const Icon(Icons.arrow_back_ios_new_rounded)),
            expandedHeight: 250.h,
            bottom: PreferredSize(
              preferredSize: Size(1.sw, 120.h),
              child: DecoratedBox(
                decoration: BoxDecoration(color: AppColors.black.withAlpha(50)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(blog.title ?? 'No Title',
                      style: TextTheme.of(context)
                          .titleLarge!
                          .copyWith(fontSize: 18.sp, color: AppColors.white)),
                ),
              ),
            ),
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: blog.id!,
                child: CachedNetworkImage(
                  imageUrl: blog.image ?? placeHolderImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // SliverList for the blog content
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'By ${blog.author ?? 'Unknown Author'} • ${blog.datePublished ?? 'Unknown Date'}',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey[600],
                    ),
                  ),
                  10.verticalSpace,
                  Text(blog.content ?? 'No Content',
                      style: TextTheme.of(context).displayLarge!.copyWith(
                          fontSize: 17.sp,
                          color: AppColors.grey,
                          fontWeight: FontWeight.bold)),
                  15.verticalSpace,
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: _CopyURl(
        url: blog.deeplink!,
      ),
    );
  }
}

class _CopyURl extends StatelessWidget {
  const _CopyURl({
    required this.url,
  });
  final String url;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        Clipboard.setData(ClipboardData(text: url.toString()));
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('URL copied to clipboard')),
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Share Post',
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.blue,
            ),
          ),
          10.horizontalSpace,
          Icon(Icons.copy, color: Colors.grey[600]),
        ],
      ),
    );
  }
}

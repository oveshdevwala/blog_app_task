import 'package:blog_app_task/core/core.dart';
import 'package:blog_app_task/features/blog/blog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlogListTile extends StatelessWidget {
  const BlogListTile({
    super.key,
    required this.blog,
  });

  final BlogModel blog;

  @override
  Widget build(BuildContext context) {
    final blogDecorationBox = BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12).r,
        boxShadow: [
          BoxShadow(
              color: AppColors.black.withAlpha(100),
              spreadRadius: 0.1,
              blurRadius: 0.5)
        ]);
    return Padding(
      padding: const EdgeInsets.all(8.0).h,
      child: Stack(
        children: [
          DecoratedBox(
              decoration: blogDecorationBox,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Thumbnail(blog: blog),
                  _TitleAndSummary(blog: blog)
                ],
              )),
          _ReadMoreButton(blog: blog)
        ],
      ),
    );
  }
}

class _Thumbnail extends StatelessWidget {
  const _Thumbnail({
    required this.blog,
  });

  final BlogModel blog;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: blog.id!,
      child: SizedBox(
        width: 120.w,
        height: 100.h,
        child: ClipRRect(
          borderRadius:
              const BorderRadius.horizontal(left: Radius.circular(12)).r,
          child: CachedNetworkImage(
            imageUrl: blog.image ?? placeHolderImage,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class _TitleAndSummary extends StatelessWidget {
  const _TitleAndSummary({
    required this.blog,
  });

  final BlogModel blog;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0).h,
        child: Column(
          children: [
            Text(
              blog.title ?? 'No Title',
              style: TextTheme.of(context).titleSmall,
              maxLines: 2,
            ),
            Text(
              blog.summary ?? 'No Title',
              style: TextTheme.of(context)
                  .labelSmall!
                  .copyWith(fontSize: 8.sp, overflow: TextOverflow.ellipsis),
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}

class _ReadMoreButton extends StatelessWidget {
  const _ReadMoreButton({
    required this.blog,
  });

  final BlogModel blog;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0.w,
        right: 0.h,
        child: SizedBox(
          width: 70.w,
          height: 30.h,
          child: FilledButton(
              onPressed: () => Navigator.push(context, BlogDetailsView.route(blog)),
              child: const FittedBox(child: Text('Read More'))),
        ));
  }
}

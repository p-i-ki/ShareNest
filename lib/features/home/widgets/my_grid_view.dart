import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_nest/core/routes/names.dart';
import 'package:share_nest/features/home/widgets/product_grid.dart';

class MyGridView extends StatelessWidget {
  // final List<CourseItem> courses;
  const MyGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns
        crossAxisSpacing: 6.w, // Spacing between columns
        mainAxisSpacing: 6.w, // Spacing between rows
        childAspectRatio: 1.1, // Aspect ratio of each grid item
      ),
      // itemCount: courses.length, // Number of items to display
      itemCount: 6,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.PRODUCT_DETAIL);
            },
            child: productGrid());
      },
    );
  }
}

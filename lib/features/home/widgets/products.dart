import 'package:flutter/material.dart';
import 'package:share_nest/core/app_constants/app_const.dart';
import 'package:share_nest/features/home/widgets/my_grid_view.dart';

class ProductSections extends StatelessWidget {
  const ProductSections({
    super.key,
    required this.tabController,
    //required this.courses,
  });

  final TabController tabController;
  //final List<CourseItem> courses;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppConst.dHeight * 0.6,
      width: AppConst.dWidth,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(AppConst.dRadius)),
        child: TabBarView(
          controller: tabController,
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(4),
              height: AppConst.dHeight * 0.3,
              child: MyGridView(),
            ),
            Container(
              color: Colors.red,
              padding: const EdgeInsets.all(4),
              height: AppConst.dHeight * 0.3,
              child: MyGridView(),
            ),
            Container(
              color: Colors.blue,
              padding: const EdgeInsets.all(4),
              height: AppConst.dHeight * 0.3,
              child: MyGridView(),
            ),
            Container(
              color: Colors.blueGrey,
              padding: const EdgeInsets.all(4),
              height: AppConst.dHeight * 0.3,
              child: MyGridView(),
            ),
            Container(
              color: Colors.green,
              padding: const EdgeInsets.all(4),
              height: AppConst.dHeight * 0.3,
              child: MyGridView(),
            ),
          ],
        ),
      ),
    );
  }
}

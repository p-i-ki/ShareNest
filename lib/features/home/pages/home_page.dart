import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_nest/core/app_constants/app_const.dart';
import 'package:share_nest/core/common/widgets/app_style.dart';
import 'package:share_nest/core/common/widgets/reusable_text.dart';
import 'package:share_nest/core/routes/names.dart';
import 'package:share_nest/core/utils/user_profile_photo.dart';
import 'package:share_nest/features/home/widgets/custom_tabs.dart';
import 'package:share_nest/features/home/widgets/products.dart';
import 'package:share_nest/features/home/widgets/user_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController tabController =
      TabController(length: 5, vsync: this);

  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        excludeHeaderSemantics: true,
        actions: [
          Builder(
            builder: (context) => GestureDetector(
              onTap: () {
                Scaffold.of(context).openEndDrawer();
              },
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                // decoration: const BoxDecoration(color: Colors.amber),
                child: UserProfilePhoto(image: "assets/images/person.jpeg"),
              ),
            ),
          )
        ],
        title: Text(
          "ShareNest",
          style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 25.sp),
        ),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: CustomSearchBar(
              searchController: searchController,
            )),
      ),
      endDrawer: UserDrawer(),
      body: Padding(
        padding: EdgeInsets.all(14.h),
        child: Column(
          spacing: 5,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReusableText(
              text: "Categories",
              style: appStyle(
                size: 20,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            CustomTabs(
              tabController: tabController,
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.space,
              children: [
                ReusableText(
                  text: "Listings Near You",
                  style: appStyle(
                    size: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 30.w,
                ),
                Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppConst.dRadius + 10),
                        border: Border.all(color: AppConst.dDarkB)),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.ADD_PRODUCT);
                          },
                          child: ReusableText(
                            text: "Add yours",
                            style: appStyle(
                              size: 16.sp,
                              color: AppConst.dDarkB,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.add,
                          color: AppConst.dDarkB,
                        )
                      ],
                    ))
              ],
            ),
            SizedBox(height: 12.h),
            ProductSections(tabController: tabController)
          ],
        ),
      ),
    );
  }
}

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.w),
      padding: EdgeInsets.all(8),
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppConst.dRadius + 7),
        border: Border.all(width: 2, color: Colors.white),
        boxShadow: [
          BoxShadow(color: Colors.black, blurRadius: 2, offset: Offset(0, 0)),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.add,
            color: AppConst.dDarkB,
            size: 30,
          ),
          Expanded(child: Container()),
          Row(
            children: [
              Icon(
                Icons.qr_code_scanner_outlined,
                size: 30,
                color: AppConst.dDarkB,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.search,
                color: AppConst.dgrey,
                size: 30,
              )
            ],
          )
        ],
      ),
    );
  }
}

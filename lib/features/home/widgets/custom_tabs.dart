import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:share_nest/core/app_constants/app_const.dart';
import 'package:share_nest/core/common/widgets/app_style.dart';
import 'package:share_nest/core/common/widgets/reusable_text.dart';

class CustomTabs extends StatelessWidget {
  const CustomTabs({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: const EdgeInsets.all(5),
      child: TabBar(
        controller: tabController,
        // padding: EdgeInsets.symmetric(horizontal: 5),
        indicatorColor: Colors.transparent,
        indicator: BoxDecoration(
          color: AppConst.dDarkB,
          borderRadius: BorderRadius.circular(AppConst.dRadius + 10),
        ),
        indicatorSize: TabBarIndicatorSize.label,

        labelPadding: EdgeInsets.zero,
        isScrollable: true,
        dividerColor: Colors.transparent,
        labelStyle: appStyle(
          size: 20,
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelColor: Colors.white,
        // tabs:
        //     _tabs.map((tabTitle) => _buildTab(tabTitle)).toList(),
        tabs: [
          // Use a fixed width for each tab
          CTab(width: AppConst.dWidth * 0.2, text: "All"),
          SizedBox(
            width: 5,
          ),
          CTab(width: AppConst.dWidth * 0.2, text: "Furniture"),
          SizedBox(
            width: 5,
          ),
          CTab(width: AppConst.dWidth * 0.2, text: "Bikes"),
          SizedBox(
            width: 5,
          ),

          CTab(width: AppConst.dWidth * 0.2, text: "Cars"),
          SizedBox(
            width: 5,
          ),
          CTab(width: AppConst.dWidth * 0.2, text: "Books"),
        ],
      ),
    );
  }
}

class CTab extends StatelessWidget {
  const CTab({
    super.key,
    required this.width,
    required this.text,
  });

  final double width;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppConst.dRadius + 10),
            border: Border.all(color: HexColor('848484'), width: 2)),

        width: width, // Adjust width for all tabs
        child: Center(
          child: ReusableText(
            text: text,
            style: appStyle(
              size: 14,
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}

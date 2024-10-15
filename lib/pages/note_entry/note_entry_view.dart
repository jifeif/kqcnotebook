import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kqcnotebook/common/colors/colors.dart';
import 'package:kqcnotebook/constants/assets.dart';
import 'note_entry_controller.dart';

class NoteEntryPage extends StatelessWidget {
  NoteEntryPage({Key? key}) : super(key: key);
  final controller = Get.put(NoteEntryController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: controller.list[controller.currentIndex.value],
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  Assets.assetsImagesHomeSection,
                  width: 24,
                  height: 24,
                ),
                activeIcon: Image.asset(
                  Assets.assetsImagesHomeSectionSelect,
                  width: 24,
                  height: 24,
                ),
                label: "首页",
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  Assets.assetsImagesMySection,
                  width: 24,
                  height: 24,
                ),
                activeIcon: Image.asset(
                  Assets.assetsImagesMySectionSelect,
                  width: 24,
                  height: 24,
                ),
                label: "我的",
              )
            ],
            onTap: (value) => controller.currentIndex.value = value,
            currentIndex: controller.currentIndex.value,
            selectedItemColor: AppColors.primaryColorA56D5F,
            selectedLabelStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColorA56D5F,
            ),
            unselectedItemColor: AppColors.primaryTextColor,
            unselectedLabelStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.primaryTextColor,
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
// import 'package:kqcnotebook/global.dart';
import 'package:kqcnotebook/pages/Index/Index_controller.dart';
// import 'package:kqcnotebook/pages/home/home_view.dart';
// import 'package:kqcnotebook/pages/login/login_view.dart';
import 'package:kqcnotebook/pages/note_entry/note_entry_view.dart';
import 'package:kqcnotebook/pages/splash/spalsh_view.dart';
import 'package:get/get.dart';

class IndexPage extends GetView<IndexController> {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Obx(() => Scaffold(
    //       body: controller.isloadWelcomePage.isTrue
    //           ? SplashPage()
    //           : Global.isOfflineLogin
    //               ? HomePage()
    //               : LoginPage(),
    //     ));

        return Obx(() => Scaffold(
          body: controller.isloadWelcomePage.isTrue
              ? SplashPage()
              : NoteEntryPage(),
        ));

  }
}

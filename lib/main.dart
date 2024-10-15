import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:kqcnotebook/common/langs/translation_service.dart';
import 'package:kqcnotebook/global.dart';
import 'package:kqcnotebook/pages/Index/Index_view.dart';
import 'package:kqcnotebook/pages/Index/index_binding.dart';
import 'package:kqcnotebook/router/app_pages.dart';
import 'package:get/get.dart';

void main() => Global.init().then((e) => runApp(MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'KQC notebook',
      home: IndexPage(),
      initialBinding: IndexBinding(),
      debugShowCheckedModeBanner: false,
      enableLog: true,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      unknownRoute: AppPages.unknownRoute,
      builder: EasyLoading.init(),
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
    );
  }
}

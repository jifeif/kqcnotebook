import 'package:flutter/material.dart';
import 'package:kqcnotebook/components/components.dart';
import 'package:kqcnotebook/pages/home/home_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: MyAppBar(
        centerTitle: true,
        title: MyTitle('首页'),
        leadingType: AppBarBackType.None,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Center(child: Text(controller.count.toString()))),
            TextButton(onPressed: () => controller.increment(), child: Text('count++')),
            GetBuilder<HomeController>(builder: (_) {
              return Text(controller.userName);
            }),
            TextButton(onPressed: () => controller.changeUserName(), child: Text('changeName')),
          ],
        ),
      ),
    );
  }
}

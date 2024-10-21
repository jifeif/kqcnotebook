import 'dart:io';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kqcnotebook/components/border_text.dart';
import 'package:kqcnotebook/components/components.dart';
import 'package:kqcnotebook/components/select_image_video.dart';
import 'package:kqcnotebook/constants/assets.dart';
import 'package:kqcnotebook/utils/utils.dart';

class ChangeNickInfoController extends GetxController {
  final currentDate = DateTime.now().obs;
  final nickNode = FocusNode();
  var nickName = "";
  final image = Image.asset(
    Assets.assetsImagesMyPortrait,
    width: 40,
    height: 40,
  ).obs;
  BuildContext? con;

  @override
  void onInit() async {
    super.onInit();
    Image? ima = await LoacalStorage().getImage();
    if (ima != null) {
      image.value = ima;
    }
    ;
  }

  selectImage() async {
    var file = await SelectImageVideo().selectSingleImage();
    await LoacalStorage().setImage(await file!.readAsBytes());
    ImageProvider imag = await Image.file(
      File(file.path),
      width: 40,
      height: 40,
    ).image;
    image.value = Image(
      image: imag,
      width: 40,
      height: 40,
    );
  }

  clickSureBtn() {
    KqcEventbus.fire(
        AccountInfoModel(nickName, currentDate.value.yearMonthDay(), false));
    Get.back();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}
}

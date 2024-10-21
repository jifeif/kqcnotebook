import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SelectImageVideo {

  static SelectImageVideo _instance = new SelectImageVideo._internal();
  factory SelectImageVideo() => _instance;
  late ImagePicker picker;

  SelectImageVideo._internal(){
    picker = ImagePicker();
  }

  Future<PickedFile?> selectSingleImage({
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
  }) async {
    var file = await picker.getImage(
      source: ImageSource.gallery,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      imageQuality: imageQuality,
    );
    return file;
  }

  Future<Image?> onlySelectSingleImage ({
      double? maxWidth,
      double? maxHeight,
    int? imageQuality,
  }) async {
    var file = await selectSingleImage(maxWidth: maxWidth, maxHeight: maxHeight, imageQuality: imageQuality);
    if (file == null) {
      return null;
    } else {
       return Image.file(File(file.path));
    }
  }

  Future<ImageProvider?> onlySelectSingleImageProvider({
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
  }) async {
    var file = await selectSingleImage(
        maxWidth: maxWidth, maxHeight: maxHeight, imageQuality: imageQuality);
    if (file == null) {
      return null;
    } else {
      return Image.file(File(file.path)).image;
    }
  }
}

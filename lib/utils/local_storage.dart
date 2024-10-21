import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 本地存储-单例模式
class LoacalStorage {
  static LoacalStorage _instance = new LoacalStorage._();
  factory LoacalStorage() => _instance;
  static late SharedPreferences _prefs;

  LoacalStorage._();

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool> setJSON(String key, dynamic jsonVal) {
    String jsonString = jsonEncode(jsonVal);
    return _prefs.setString(key, jsonString);
  }

  dynamic getJSON(String key) {
    String? jsonString = _prefs.getString(key);
    return jsonString == null ? null : jsonDecode(jsonString);
  }

  Future<bool> setBool(String key, bool val) {
    return _prefs.setBool(key, val);
  }

  bool getBool(String key) {
    bool? val = _prefs.getBool(key);
    return val == null ? false : val;
  }

  Future<bool> remove(String key) {
    return _prefs.remove(key);
  }

  Future<bool> setImage(
    Uint8List imag, {
    String name = "protrait.png",
    bool isShowLoading = true,
  }) async {
    var direc = await getApplicationCacheDirectory();
    String path = direc.path + "/" + name;
    File _ = await File(path).writeAsBytes(imag);
    return true;
  }

  Future<Image?> getImage({
    String name = "protrait.png",
    double? width = 40,
    double? height = 40,
  }) async {
    ImageCache().clear();
    var direc = await getApplicationCacheDirectory();
    String path = direc.path + "/" + name;
    
    File file = File(path);
    if (await file.exists()) {
      return Image.file(
        File(path),
        width: width,
        height: height,
      );
    } else {
      return null;
    }
  }
}

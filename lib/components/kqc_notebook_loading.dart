
import 'package:flutter_easyloading/flutter_easyloading.dart';

ShowToast(String info) => KqcNotebookLoading.showToast(info);
ShowLoading({String info = "loading..."}) => KqcNotebookLoading.showLoading(info: info);
HiddenLoading() => KqcNotebookLoading.hidden();
class KqcNotebookLoading {

  static KqcNotebookLoading _instace = new KqcNotebookLoading._();
  factory KqcNotebookLoading() => _instace;

  KqcNotebookLoading._(){}

  static showLoading({String info = "loading..."}) {
    EasyLoading.show(status: info);
  }

  static hidden({bool animation = true}) {
    EasyLoading.dismiss(animation: animation);
  }

  static showToast(String info, {int seconds = 2}) {
    if (info.isEmpty) {
      return;
    }
    if (EasyLoading.isShow) {
      EasyLoading.dismiss(animation: false);
    } else {
      EasyLoading.showToast(info, duration: Duration(seconds: seconds));
    }
  }
}
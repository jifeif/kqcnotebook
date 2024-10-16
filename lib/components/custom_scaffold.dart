import 'package:flutter/material.dart';
import 'package:kqcnotebook/common/colors/colors.dart';
import 'custom_appbar.dart';

// typedef WillPopCallback = Future<bool> Function();

class BaseScaffold extends Scaffold {
  BaseScaffold(
      {String? title,
      PreferredSizeWidget? appBar,
      required Widget body,
      List<Widget>? actions,
      AppBarBackType? leadType,
      Future<bool> Function()? onWillPop,
      Brightness brightness = Brightness.light,
      Widget? floatingActionButton,
      Color appBarBackgroundColor = Colors.white,
      Color? titleColor,
      bool centerTitle = true,
      FloatingActionButtonLocation? floatingActionButtonLocation})
      : super(
          appBar: appBar ??
              MyAppBar(
                brightness: Brightness.light,
                leadingType: leadType ?? AppBarBackType.Back,
                onWillPop: onWillPop,
                actions: actions ?? [],
                centerTitle: centerTitle,
                title: MyTitle(title ?? '', color: titleColor ?? AppColors.primaryTextColor),
                backgroundColor: appBarBackgroundColor,
              ),
          backgroundColor: Colors.white,
          body: body,
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: floatingActionButtonLocation,
        );
}

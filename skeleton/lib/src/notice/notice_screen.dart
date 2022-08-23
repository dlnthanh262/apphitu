import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:skeleton/src/notice/viewmodel/notice_viewmodel.dart';
import 'package:skeleton/src/themes/app_icons.dart';
import 'package:skeleton/src/themes/colors.dart';
import 'package:skeleton/src/themes/my_app_theme.dart';
import 'package:skeleton/src/themes/screen_utils.dart';

import '../common/input_text /mg_input_text.dart';

class NoticeScreen extends StatefulWidget {
  const NoticeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NoticeState();
}

class _NoticeState extends State<NoticeScreen> {
  late NoticeViewModel _noticeViewModel;

  @override
  void initState() {
    _noticeViewModel = NoticeViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_sharp,
              color: MGColors.black,
            )),
        title: Text(
          "Soạn thông báo",
          style: Theme.of(context)
              .textTheme
              .textStyle14
              .copyWith(color: MGColors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {
                _noticeViewModel.attachImage();
              },
              icon: SvgPicture.asset(
                AppIcons.getIconPath("ic_attach_image.svg"),
                height: 20,
                width: 20,
                color: MGColors.black,
              )),
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.send,
                size: 20,
                color: MGColors.kMainColor,
              ))
        ],
      ),
      body: ChangeNotifierProvider.value(
        value: _noticeViewModel,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.symmetric(
                      horizontal:
                          BorderSide(color: MGColors.grey, width: 0.5))),
              child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: const MGInputText(
                    title: "Tới : ",
                  )),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: MGColors.grey, width: 0.5))),
              child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: const MGInputText(
                    hint: "Chủ đề ",
                  )),
            ),
            Flexible(
                child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextField(
                      style: Theme.of(context)
                          .textTheme
                          .textStyle14
                          .copyWith(color: MGColors.black),
                      maxLines: 50,
                      minLines: 1,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Soạn thông báo ",
                          hintStyle: Theme.of(context)
                              .textTheme
                              .textStyle14
                              .copyWith(color: MGColors.grey)),
                    ),
                    Selector<NoticeViewModel, String>(
                      selector: (_, viewModel) => viewModel.imagePath,
                      builder: (_, image, __) {
                        return Visibility(
                          visible: image.isNotEmpty,
                          child: SizedBox(
                              width: ScreenUtils.getWidth(context),
                              child: Image.file(
                                File(image),
                                fit: BoxFit.fitWidth,
                              )),
                        );
                      },
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

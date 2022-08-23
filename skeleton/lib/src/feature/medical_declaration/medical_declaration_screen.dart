import 'package:flutter/material.dart';
import 'package:skeleton/src/themes/dashed_line.dart';
import 'package:skeleton/src/themes/my_app_theme.dart';
import 'package:skeleton/src/themes/screen_utils.dart';
import '../../themes/colors.dart';

class MedicalDeclarationScreen extends StatefulWidget {
  const MedicalDeclarationScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MedicalDeclarationState();
}

class _MedicalDeclarationState extends State<MedicalDeclarationScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: MGColors.kMainColor),
                onPressed: () => Navigator.of(context).pop(),
              ),
              title: Text(
                "Khai báo y tế bắt buộc",
                style: Theme.of(context).textTheme.textStyle18,
              ),
              centerTitle: true,
              backgroundColor: Theme.of(context).canvasColor,
              bottom: TabBar(indicatorSize: TabBarIndicatorSize.label, tabs: [
                Tab(
                    icon: Text(
                  "Thông tin cá nhân",
                  style: Theme.of(context)
                      .textTheme
                      .textStyle14
                      .copyWith(color: MGColors.kMainColor),
                )),
                Tab(
                    icon: Text(
                  "Thông tin dịch tễ",
                  style: Theme.of(context)
                      .textTheme
                      .textStyle14
                      .copyWith(color: MGColors.kMainColor),
                )),
              ])),
          body: TabBarView(
            children: [
              buildPersonalInfo(),
              buildMedicalInfo(),
            ],
          ),
        ));
  }

  Widget buildPersonalInfo() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: ScreenUtils.fullWidth(context) / 8, top: 30),
            child: Row(
              children: [
                Container(
                    width: ScreenUtils.fullWidth(context) / 2,
                    child: Text("Họ và tên",
                        style: Theme.of(context).textTheme.textStyle14)),
                Text("Chưa cập nhật",
                    style: Theme.of(context).textTheme.textStyle14Grey.copyWith(fontStyle: FontStyle.italic)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: ScreenUtils.fullWidth(context) / 8, top: 20),
            child: Row(
              children: [
                Container(
                    width: ScreenUtils.fullWidth(context) / 2,
                    child: Text("MSSV",
                        style: Theme.of(context).textTheme.textStyle14)),
                Text("Chưa cập nhật",
                    style: Theme.of(context).textTheme.textStyle14Grey.copyWith(fontStyle: FontStyle.italic)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: ScreenUtils.fullWidth(context) / 8, top: 20),
            child: Row(
              children: [
                Container(
                    width: ScreenUtils.fullWidth(context) / 2,
                    child: Text("Lớp",
                        style: Theme.of(context).textTheme.textStyle14)),
                Text("Chưa cập nhật",
                    style: Theme.of(context).textTheme.textStyle14Grey.copyWith(fontStyle: FontStyle.italic)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: ScreenUtils.fullWidth(context) / 8, top: 20),
            child: Row(
              children: [
                Container(
                    width: ScreenUtils.fullWidth(context) / 2,
                    child: Text("Khoa / Viện",
                        style: Theme.of(context).textTheme.textStyle14)),
                Text("Chưa cập nhật",
                    style: Theme.of(context).textTheme.textStyle14Grey.copyWith(fontStyle: FontStyle.italic)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: DashedLine(),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 20, right: 20),
            child: TextField(
              obscureText: false,
              decoration: InputDecoration(
                hintText: "Chưa cập nhật",
                labelText: 'Bảo hiểm Y tế',
                labelStyle: Theme.of(context).textTheme.textStyle15.copyWith(fontWeight: FontWeight.w500))
              ),
            ),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 20, right: 20),
            child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                    hintText: "Chưa cập nhật",
                    labelText: 'Số điện thoại',
                    labelStyle: Theme.of(context).textTheme.textStyle15.copyWith(fontWeight: FontWeight.w500))
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 20, right: 20),
            child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                    hintText: "Chưa cập nhật",
                    labelText: 'Địa chỉ liên hệ',
                    labelStyle: Theme.of(context).textTheme.textStyle15.copyWith(fontWeight: FontWeight.w500))
            ),
          ),
          Container(
            width: ScreenUtils.getWidth(context),
            color: MGColors.kMainColor,
            margin: const EdgeInsets.only(top: 30.0, left: 20, right: 20),
            child: TextButton(
                onPressed: () {},
                child: Text('TIẾP TỤC',
                    style: TextStyle(color: MGColors.white))),
          )
        ],
      ),
    );
  }

  Widget buildMedicalInfo() {
    return Column(
      children: [],
    );
  }
}

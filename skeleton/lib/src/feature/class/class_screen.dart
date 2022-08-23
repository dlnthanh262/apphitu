import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeleton/src/themes/my_app_theme.dart';

import '../class/viewmodel/class_viewmodel.dart';
import '../../themes/app_icons.dart';
import '../../themes/colors.dart';

class ClassScreen extends StatefulWidget {
  const ClassScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ClassState();
}

class _ClassState extends State<ClassScreen> {
  late ClassViewModel _classViewModel;
  List<String> studyYearList = [
    'Năm học 2022-2023',
    'Năm học 2021-2022',
    'Năm học 2020-2021',
    'Năm học 2019-2020',
    'Năm học 2018-2019',
  ];
  String dropdownValue = '';
  bool showLoading = false;

  @override
  void initState() {
    super.initState();
    _classViewModel = ClassViewModel();
    _classViewModel.fetchData();
    dropdownValue = studyYearList.first;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _classViewModel,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: MGColors.kMainColor),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Align(
            alignment: Alignment.bottomRight,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: dropdownValue,
                icon: Icon(Icons.arrow_drop_down, color: MGColors.grey),
                elevation: 16,
                style: Theme.of(context).textTheme.textStyle16,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items:
                    studyYearList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: value == dropdownValue
                          ? Theme.of(context).textTheme.textStyle16SemiBold
                          : Theme.of(context).textTheme.textStyle16,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          centerTitle: false,
          backgroundColor: Theme.of(context).canvasColor,
        ),
        body: showLoading
            ? Center(
                child: CircularProgressIndicator(
                color: MGColors.kMainColor,
              ))
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(top: 120, bottom: 20),
                        width: 120,
                        child: Image.asset(
                          AppIcons.getImagePath("no_result.png"),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Center(
                        child: Text(
                      "CHƯA CÓ DỮ LIỆU!",
                      style: Theme.of(context).textTheme.textStyle16SemiBold,
                    )),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                        child: Text(
                      "Lớp học chưa được cập nhật. Vui lòng quay lại sau",
                      style: Theme.of(context).textTheme.textStyle14Grey,
                    )),
                    Center(
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              showLoading = true;
                            });
                            Future.delayed(Duration(seconds: 1)).then((_) {
                              setState(() {
                                showLoading = false;
                              });
                            });
                          },
                          child: Text(
                            "Tải lại",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: MGColors.kMainColor,
                            ),
                          )),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}

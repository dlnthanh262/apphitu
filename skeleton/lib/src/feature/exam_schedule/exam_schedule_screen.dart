import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeleton/src/feature/exam_schedule/viewmodel/exam_schedule_viewmodel.dart';
import 'package:skeleton/src/themes/my_app_theme.dart';
import 'package:skeleton/src/themes/screen_utils.dart';

import '../../themes/colors.dart';

class ExamScheduleScreen extends StatefulWidget {
  const ExamScheduleScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ExamScheduleState();
}

class _ExamScheduleState extends State<ExamScheduleScreen> {
  late ExamScheduleViewModel _examScheduleViewModel;

  @override
  void initState() {
    _examScheduleViewModel = ExamScheduleViewModel();
    _examScheduleViewModel.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _examScheduleViewModel,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: MGColors.kMainColor),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            "Lịch thi",
            style: Theme.of(context).textTheme.textStyle18,
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).canvasColor,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _examScheduleViewModel.examSchedule!
                  .map((e) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Học kỳ ${e.semester} - Năm học ${e.year}",
                            style: Theme.of(context)
                                .textTheme
                                .textStyle16SemiBold,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${e.exam_day}, ${e.exam_date} - ${e.start_time} - Phòng (${e.room_name}:${e.room_code})",
                            style: Theme.of(context)
                                .textTheme
                                .textStyle15RedSemiBold,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${e.subject_name}",
                            style: Theme.of(context).textTheme.textStyle15,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Hình thức: ${e.method}",
                            style: Theme.of(context).textTheme.textStyle15,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                width: ScreenUtils.fullWidth(context) / 2,
                                child: Text(
                                  "Mã môn học: ${e.subject_code}",
                                  style:
                                      Theme.of(context).textTheme.textStyle15,
                                ),
                              ),
                              Text(
                                "Thời gian thi: ${e.time}",
                                style: Theme.of(context).textTheme.textStyle15,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Nhóm thi: ${e.exam_group}",
                            style: Theme.of(context).textTheme.textStyle15,
                          ),
                        ],
                      ))
                  .toList()),
        ),
      ),
    );
  }
}

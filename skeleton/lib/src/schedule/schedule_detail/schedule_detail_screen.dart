import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:skeleton/src/feature/profile/viewmodel/profile_viewmodel.dart';
import 'package:skeleton/src/model/schedule.dart';
import 'package:skeleton/src/themes/my_app_theme.dart';

import '../../themes/colors.dart';
import '../../themes/screen_utils.dart';

class ScheduleDetailScreen extends StatefulWidget {
  const ScheduleDetailScreen({Key? key, required this.schedule})
      : super(key: key);
  final Schedule schedule;

  @override
  State<StatefulWidget> createState() => _ScheduleDetailState(this.schedule);
}

class _ScheduleDetailState extends State<ScheduleDetailScreen> {
  late ProfileViewModel _profileViewModel;
  final Schedule schedule;

  _ScheduleDetailState(this.schedule);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: MGColors.kMainColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Chi tiết thời khoá biểu",
          style: Theme.of(context).textTheme.textStyle18,
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).canvasColor,
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tên môn: ${schedule.subject_name}',
                style: Theme.of(context).textTheme.textStyle16SemiBold,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Mã môn học: ${schedule.subject_code}',
                style: Theme.of(context).textTheme.textStyle16SemiBold,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Tiết bắt đầu: ${schedule.from_lession}',
                style: Theme.of(context).textTheme.textStyle16SemiBold,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Tiết: ${schedule.from_lession}-${schedule.from_lession + schedule.lession_number}',
                style: Theme.of(context).textTheme.textStyle16SemiBold,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Thứ: ${schedule.day.split(" ").last}',
                style: Theme.of(context).textTheme.textStyle16SemiBold,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Mã phòng: ${schedule.room_code}',
                style: Theme.of(context).textTheme.textStyle16SemiBold,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Tên phòng: ${schedule.room_name}',
                style: Theme.of(context).textTheme.textStyle16,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Ngày học: ${DateFormat('dd/MM/yyyy').format(DateTime.now())}',
                style: Theme.of(context).textTheme.textStyle16SemiBold,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Lớp: ${schedule.class_code}',
                style: Theme.of(context).textTheme.textStyle16,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Năm học: ${schedule.year}',
                style: Theme.of(context).textTheme.textStyle16,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Học kì: ${schedule.semester}',
                style: Theme.of(context).textTheme.textStyle16,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Số tín chỉ: ${schedule.credit_number}',
                style: Theme.of(context).textTheme.textStyle16,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Mã giảng viên: ${schedule.teacher_code}',
                style: Theme.of(context).textTheme.textStyle16,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Tên giảng viên: ${schedule.teacher_name}',
                style: Theme.of(context).textTheme.textStyle16,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Nhóm học: ${schedule.study_group}',
                style: Theme.of(context).textTheme.textStyle16,
              )
            ],
          ),
        ),
      ),
    );
  }
}

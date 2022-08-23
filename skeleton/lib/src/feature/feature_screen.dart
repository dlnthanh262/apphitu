import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeleton/src/feature/profile/profile_screen.dart';
import 'package:skeleton/src/feature/schedule/schedule_screen.dart';
import 'package:skeleton/src/themes/my_app_theme.dart';
import '../themes/app_icons.dart';
import '../themes/colors.dart';
import '../themes/dashed_line.dart';
import 'academy_transcript/academy_transcript_screen.dart';
import 'class/class_screen.dart';

class FeatureScreen extends StatefulWidget {
  const FeatureScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FeatureState();
}

class _FeatureState extends State<FeatureScreen> {
  @override
  void initState() {
    super.initState();
  }

  Map<String, Map<String, List<String>>> blockContent = {
    'HỌC TẬP': {
      'titles': ['Thời khoá biểu', 'Lớp học', 'Xem điểm', 'Lịch thi'],
      'iconPaths': [
        'ic_schedule.svg',
        'ic_classroom.svg',
        'ic_result.svg',
        'ic_plan.svg'
      ],
    },
    'TÍNH NĂNG': {
      'titles': [
        'Thông báo',
        'Khai báo y tế',
        'Tư vấn hỏi đáp',
        'Việc làm thực tập'
      ],
      'iconPaths': [
        'ic_noti.svg',
        'ic_doctor.svg',
        'ic_question.svg',
        'ic_job.svg'
      ],
    },
    'KHÁC': {
      'titles': ['Cài đặt thông báo', 'Thông tin về HITU'],
      'iconPaths': ['ic_settings.svg', 'ic_info.svg'],
    },
  };
  Map<String, List<Widget>> blockWidget = {
    'HỌC TẬP': [Container(), Container(), Container(), Container()],
    'TÍNH NĂNG': [Container(), Container(), Container(), Container()],
    'KHÁC': [Container(), Container()]
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                dense: true,
                visualDensity: VisualDensity(horizontal: 0, vertical: 0),
                contentPadding: EdgeInsets.only(top: 10.0),
                minLeadingWidth: 50,
                leading: Container(
                  width: 70,
                  decoration: BoxDecoration(
                      color: MGColors.kMainColor, shape: BoxShape.circle),
                ),
                title: Text(
                  'Phan Hồng Duy (21182100670)',
                  style: Theme.of(context).textTheme.textStyle15,
                ),
                subtitle: Text('phanhongduy1@gmail.com',
                    style: Theme.of(context).textTheme.textStyle14Grey),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: MGColors.grey,
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => ProfileScreen()));
                },
              ),
              Divider(
                color: MGColors.grey,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "HỌC TẬP",
                style: Theme.of(context).textTheme.textStyle16SemiBold,
              ),
              SizedBox(
                height: 5,
              ),
              ListTile(
                contentPadding: EdgeInsets.all(0),
                minLeadingWidth: 50,
                leading: SvgPicture.asset(
                  AppIcons.getIconPath("ic_schedule.svg"),
                  height: 40,
                  width: 40,
                  color: MGColors.kMainColor,
                ),
                title: Text('Thời khoá biểu',
                    style: Theme.of(context).textTheme.textStyle15),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: MGColors.grey,
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => ScheduleScreen()));
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.all(0),
                minLeadingWidth: 50,
                leading: SvgPicture.asset(
                  AppIcons.getIconPath("ic_classroom.svg"),
                  height: 40,
                  width: 40,
                  color: MGColors.kMainColor,
                ),
                title: Text('Lớp học',
                    style: Theme.of(context).textTheme.textStyle15),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: MGColors.grey,
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => ClassScreen()));
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.all(0),
                minLeadingWidth: 50,
                leading: SvgPicture.asset(
                  AppIcons.getIconPath("ic_result.svg"),
                  height: 40,
                  width: 40,
                  color: MGColors.kMainColor,
                ),
                title: Text('Xem điểm',
                    style: Theme.of(context).textTheme.textStyle15),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: MGColors.grey,
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => AcademyTranscriptScreen()));
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.all(0),
                minLeadingWidth: 50,
                leading: SvgPicture.asset(
                  AppIcons.getIconPath("ic_plan.svg"),
                  height: 40,
                  width: 40,
                  color: MGColors.kMainColor,
                ),
                title: Text('Lịch thi',
                    style: Theme.of(context).textTheme.textStyle15),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: MGColors.grey,
                ),
                onTap: () {},
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "TÍNH NĂNG",
                style: Theme.of(context).textTheme.textStyle16SemiBold,
              ),
              SizedBox(
                height: 5,
              ),
              ListTile(
                contentPadding: EdgeInsets.all(0),
                minLeadingWidth: 50,
                leading: SvgPicture.asset(
                  AppIcons.getIconPath("ic_noti.svg"),
                  height: 40,
                  width: 40,
                  color: MGColors.kMainColor,
                ),
                title: Text('Thông báo',
                    style: Theme.of(context).textTheme.textStyle15),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: MGColors.grey,
                ),
                onTap: () {},
              ),
              ListTile(
                contentPadding: EdgeInsets.all(0),
                minLeadingWidth: 50,
                leading: SvgPicture.asset(
                  AppIcons.getIconPath("ic_doctor.svg"),
                  height: 40,
                  width: 40,
                  color: MGColors.kMainColor,
                ),
                title: Text('Khai báo y tế',
                    style: Theme.of(context).textTheme.textStyle15),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: MGColors.grey,
                ),
                onTap: () {},
              ),
              ListTile(
                contentPadding: EdgeInsets.all(0),
                minLeadingWidth: 50,
                leading: SvgPicture.asset(
                  AppIcons.getIconPath("ic_question.svg"),
                  height: 40,
                  width: 40,
                  color: MGColors.kMainColor,
                ),
                title: Text('Tư vấn hỏi đáp',
                    style: Theme.of(context).textTheme.textStyle15),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: MGColors.grey,
                ),
                onTap: () {},
              ),
              ListTile(
                contentPadding: EdgeInsets.all(0),
                minLeadingWidth: 50,
                leading: SvgPicture.asset(
                  AppIcons.getIconPath("ic_job.svg"),
                  height: 40,
                  width: 40,
                  color: MGColors.kMainColor,
                ),
                title: Text('Việc làm thực tập',
                    style: Theme.of(context).textTheme.textStyle15),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: MGColors.grey,
                ),
                onTap: () {},
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "KHÁC",
                style: Theme.of(context).textTheme.textStyle16SemiBold,
              ),
              SizedBox(
                height: 5,
              ),
              ListTile(
                contentPadding: EdgeInsets.all(0),
                minLeadingWidth: 50,
                leading: SvgPicture.asset(
                  AppIcons.getIconPath("ic_settings.svg"),
                  height: 40,
                  width: 40,
                  color: MGColors.kMainColor,
                ),
                title: Text('Cài đặt thông báo',
                    style: Theme.of(context).textTheme.textStyle15),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: MGColors.grey,
                ),
                onTap: () {},
              ),
              ListTile(
                contentPadding: EdgeInsets.all(0),
                minLeadingWidth: 50,
                leading: SvgPicture.asset(
                  AppIcons.getIconPath("ic_info.svg"),
                  height: 40,
                  width: 40,
                  color: MGColors.kMainColor,
                ),
                title: Text('Thông tin về HITU',
                    style: Theme.of(context).textTheme.textStyle15),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: MGColors.grey,
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buildBlock() {
    List<Widget> results = [];
    blockContent.keys.toList().forEach((key) {
      results.add(Text(
        key,
        style: Theme.of(context).textTheme.textStyle16SemiBold,
      ));
      results.add(SizedBox(
        height: 5,
      ));
      results.add(ListView.separated(
          itemCount: blockContent[key]!['iconPaths']!.length,
          separatorBuilder: (BuildContext context, int index) => DashedLine(
                color: Color(0xFFAAAAAA),
              ),
          itemBuilder: (BuildContext context, int index) {
            var title = blockContent[key]!['titles']![index];
            var iconPath = blockContent[key]!['iconPaths']![index];
            return ListTile(
              contentPadding: EdgeInsets.all(0),
              minLeadingWidth: 50,
              leading: SvgPicture.asset(
                AppIcons.getIconPath(iconPath),
                height: 40,
                width: 40,
                color: MGColors.kMainColor,
              ),
              title:
                  Text(title, style: Theme.of(context).textTheme.textStyle15),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: MGColors.grey,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => blockWidget[key]![index]));
              },
            );
          }));
    });
    return results;
  }
}

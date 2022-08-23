import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeleton/src/feature/academy_transcript/viewmodel/academy_transcript_viewmodel.dart';
import 'package:skeleton/src/themes/my_app_theme.dart';
import 'package:skeleton/src/themes/screen_utils.dart';

import '../../themes/colors.dart';
import 'academy_transcript_detail/academy_transcript_detail_screen.dart';

class AcademyTranscriptScreen extends StatefulWidget {
  const AcademyTranscriptScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AcademyTranscriptState();
}

class _AcademyTranscriptState extends State<AcademyTranscriptScreen> {
  late AcademyTranscriptViewModel _academyTranscriptViewModel;

  @override
  void initState() {
    _academyTranscriptViewModel = AcademyTranscriptViewModel();
    _academyTranscriptViewModel.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _academyTranscriptViewModel,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: MGColors.kMainColor),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            "Điểm",
            style: Theme.of(context).textTheme.textStyle18,
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).canvasColor,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: _academyTranscriptViewModel.academyTranscripts!
                .map((element) => ListTile(
                      onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => AcademyTranscriptDetailScreen(
                                    academyTranscript: element)))
                      },
                      title: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: ScreenUtils.fullWidth(context) / 1.45,
                                height: 10,
                              ),
                              Text(
                                'Học kì ${element.semester} - Năm học ${element.year}',
                                style:
                                    Theme.of(context).textTheme.textStyle16Grey,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Điểm trung bình học kì hệ 4',
                                style: Theme.of(context).textTheme.textStyle14,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Điểm trung bình tích luỹ (hệ 4)',
                                style: Theme.of(context).textTheme.textStyle14,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Số tín chỉ đạt',
                                style:
                                    Theme.of(context).textTheme.textStyle14Grey,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Số tín chỉ tích luỹ',
                                style:
                                    Theme.of(context).textTheme.textStyle14Grey,
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Học kì',
                                style: TextStyle(
                                    color: Colors.transparent, fontSize: 16),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '${element.average}',
                                style: Theme.of(context).textTheme.textStyle14,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '${element.total_average}',
                                style: Theme.of(context).textTheme.textStyle14,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '${element.credit_number}',
                                style:
                                    Theme.of(context).textTheme.textStyle14Grey,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '${element.total_credit_number}',
                                style:
                                    Theme.of(context).textTheme.textStyle14Grey,
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        ],
                      ),
                      trailing: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: MGColors.grey,
                          ),
                        ],
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

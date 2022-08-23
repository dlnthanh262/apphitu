import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeleton/src/feature/academy_transcript/academy_transcript_detail/viewmodel/academy_transcript_detail_viewmodel.dart';
import 'package:skeleton/src/themes/my_app_theme.dart';
import 'package:skeleton/src/themes/screen_utils.dart';

import '../../../model/academy_transcript.dart';
import '../../../themes/colors.dart';

class AcademyTranscriptDetailScreen extends StatefulWidget {
  const AcademyTranscriptDetailScreen(
      {Key? key, required this.academyTranscript})
      : super(key: key);
  final AcademyTranscript academyTranscript;

  @override
  State<StatefulWidget> createState() =>
      _AcademyTranscriptDetailState(academyTranscript);
}

class _AcademyTranscriptDetailState
    extends State<AcademyTranscriptDetailScreen> {
  late AcademyTranscriptDetailViewModel _academyTranscriptViewModel;
  final AcademyTranscript academyTranscript;

  _AcademyTranscriptDetailState(this.academyTranscript);

  @override
  void initState() {
    _academyTranscriptViewModel = AcademyTranscriptDetailViewModel();
    _academyTranscriptViewModel.fetchData(academyTranscript.id);
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
            "HK ${academyTranscript.semester},${academyTranscript.year}",
            style: Theme.of(context).textTheme.textStyle18,
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).canvasColor,
        ),
        body: Container(
          width: ScreenUtils.fullWidth(context),
          height: ScreenUtils.fullHeight(context),
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: 50,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: ["TC", "Điểm KT", "Thi", "TK(4)"]
                        .map(
                          (label) => Container(
                            width: ScreenUtils.fullWidth(context) / 4,
                            alignment: Alignment.center,
                            child: Text(
                              label,
                              style:
                                  Theme.of(context).textTheme.textStyle14Grey,
                            ),
                          ),
                        )
                        .toList()),
              ),
              ..._academyTranscriptViewModel.subjectResults!
                  .map((result) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: ScreenUtils.fullWidth(context) / 8,
                                top: 10,
                                bottom: 10),
                            child: Text(
                              "${result.subject_code} - ${result.subject_name}",
                              style: Theme.of(context).textTheme.textStyle14,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  "${result.credit_number}",
                                  "${result.test_2}",
                                  "${result.exam}",
                                  "${result.final_result}"
                                ]
                                    .map(
                                      (label) => Container(
                                        decoration: BoxDecoration(
                                            border: Border(
                                                // bottom: BorderSide(
                                                //     color: MGColors.lightGrey),
                                                right: BorderSide(
                                                    color:
                                                        MGColors.lightGrey))),
                                        width:
                                            ScreenUtils.fullWidth(context) / 4,
                                        alignment: Alignment.center,
                                        child: Text(
                                          label,
                                          style: Theme.of(context)
                                              .textTheme
                                              .textStyle14,
                                        ),
                                      ),
                                    )
                                    .toList()),
                          )
                        ],
                      ))
                  .toList(),
              ...[15.0, 15.0]
                  .map((e) => SizedBox(
                        height: e,
                      ))
                  .toList(),
              ...[
                ["Điểm trung bình học kì hệ 4", "${academyTranscript.average}"],
                [
                  "Điểm trung bình tích luỹ (hệ 4)",
                  "${academyTranscript.total_average}"
                ],
                ["Số tín chỉ đạt", "${academyTranscript.credit_number}"],
                [
                  "Số tín chỉ tích luỹ",
                  "${academyTranscript.total_credit_number}"
                ]
              ]
                  .map((labelList) => Padding(
                        padding: EdgeInsets.only(
                            left: ScreenUtils.fullWidth(context) / 8,
                            bottom: 5),
                        child: Row(
                          children: [
                            Container(
                              width: ScreenUtils.fullWidth(context) / 1.5,
                              child: Text(
                                labelList.first,
                                style: Theme.of(context).textTheme.textStyle14,
                              ),
                            ),
                            Text(
                              labelList.last,
                              style: Theme.of(context).textTheme.textStyle14,
                            )
                          ],
                        ),
                      ))
                  .toList(),
              ...[15.0, 15.0]
                  .map((e) => SizedBox(
                        height: e,
                      ))
                  .toList(),
            ]),
          ),
        ),
      ),
    );
  }
}

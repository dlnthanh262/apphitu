import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeleton/src/home/home_screen.dart';
import 'package:skeleton/src/home/new/viewmodel/news_viewmodel.dart';
import 'package:skeleton/src/model/new.dart';
import 'package:skeleton/src/themes/colors.dart';
import 'package:skeleton/src/themes/my_app_theme.dart';

import '../../home/new/screens/new_detail.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NotificationState();
}

class _NotificationState extends State<NotificationScreen> {
  late NewsViewModel _newsViewModel;

  @override
  void initState() {
    _newsViewModel = new NewsViewModel();
    _newsViewModel.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: MGColors.kMainColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Theme.of(context).canvasColor,
        title: Text(
          "Thông báo",
          style: Theme.of(context).textTheme.textStyle18,
        ),
      ),
      body: ChangeNotifierProvider.value(
        value: _newsViewModel,
        child: Selector<NewsViewModel, List<News>>(
          selector: (_, viewModel) => viewModel.news,
          builder: (_, data, __) {
            return ListView(
              children: data
                  .map((e) => NotificationsHorizontalItem(data: e))
                  .toList(),
            );
          },
        ),
      ),
    );
  }
}

class NotificationsHorizontalItem extends StatelessWidget {
  final News data;

  const NotificationsHorizontalItem({Key? key, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NewDetail.show(context);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            SizedBox(
                width: 50,
                height: 50,
                child: Icon(
                  Icons.email,
                  color: Color(0xFFBBDDFF),
                )),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.textStyle16,
                  ),
                  Text(
                    "3 tiếng trước",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .textStyle12
                        .copyWith(color: MGColors.grey),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

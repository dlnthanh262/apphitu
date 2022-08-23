import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:skeleton/src/home/home_screen.dart';
import 'package:skeleton/src/home/new/viewmodel/news_viewmodel.dart';
import 'package:skeleton/src/model/new.dart';
import 'package:skeleton/src/themes/colors.dart';
import 'package:skeleton/src/themes/my_app_theme.dart';

class NewListScreen extends StatefulWidget {
  final String title;

  const NewListScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewsState();
}

class _NewsState extends State<NewListScreen> {
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
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.title,
          style: Theme.of(context)
              .textTheme
              .textStyle14
              .copyWith(fontWeight: FontWeight.bold, color: MGColors.white),
        ),
      ),
      body: ChangeNotifierProvider.value(
        value: _newsViewModel,
        child: Selector<NewsViewModel, List<News>>(
          selector: (_, viewModel) => viewModel.news,
          builder: (_, data, __) {
            return ListView(
              children: data.map((e) => NewsHorizontalItem(data: e)).toList(),
            );
          },
        ),
      ),
    );
  }
}

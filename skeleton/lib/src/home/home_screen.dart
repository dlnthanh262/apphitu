import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeleton/src/home/new/screens/new_detail.dart';
import 'package:skeleton/src/home/viewmodel/home_viewmodel.dart';
import 'package:skeleton/src/themes/my_app_theme.dart';

import '../model/new.dart';
import '../notice/notice_screen.dart';
import '../themes/app_icons.dart';
import '../themes/colors.dart';
import '../themes/screen_utils.dart';
import 'new/screens/news_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  late HomeViewModel _homeViewModel;

  @override
  void initState() {
    _homeViewModel = HomeViewModel();
    _homeViewModel.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _homeViewModel,
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            _homeViewModel.fetchData();
          },
          child: Container(
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: ScreenUtils.getWidth(context) * 0.6,
                        child: Image.asset(
                          AppIcons.getImagePath("image_background.jpg"),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Icon(
                        Icons.notifications,
                        color: MGColors.kMainColor,
                        size: 30,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Selector<HomeViewModel, News?>(
                    selector: (_, viewModel) => viewModel.hotNew,
                    builder: (_, data, __) {
                      return data == null
                          ? const SizedBox.shrink()
                          : InkWell(
                              onTap: () {
                                NewDetail.show(context);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data.title,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .textStyle14
                                        .copyWith(
                                            color: MGColors.black,
                                            fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    height: 200,
                                    child: CachedNetworkImage(
                                      imageUrl: data.urlThumbnail,
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      placeholder: (context, url) =>
                                          const Center(
                                              child:
                                                  CircularProgressIndicator()),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                  )
                                ],
                              ),
                            );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Selector<HomeViewModel, List<News>>(
                    selector: (_, viewModel) => viewModel.newsSchool,
                    builder: (_, data, __) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Tin HITU",
                                style: Theme.of(context)
                                    .textTheme
                                    .textStyle14
                                    .copyWith(
                                        color: MGColors.black,
                                        fontWeight: FontWeight.bold),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => NewListScreen(
                                                title: 'Tin HITU',
                                              )));
                                },
                                child: Text(
                                  "Xem thêm",
                                  style: Theme.of(context)
                                      .textTheme
                                      .textStyle14
                                      .copyWith(
                                          color: MGColors.kMainColor,
                                          fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                          ...data
                              .map((e) => NewsHorizontalItem(data: e))
                              .toList()
                        ],
                      );
                    },
                  ),
                  Selector<HomeViewModel, List<News>>(
                    selector: (_, viewModel) => viewModel.newsStudent,
                    builder: (_, data, __) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Tin tức Sinh Viên",
                                style: Theme.of(context)
                                    .textTheme
                                    .textStyle14
                                    .copyWith(
                                        color: MGColors.black,
                                        fontWeight: FontWeight.bold),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => NewListScreen(
                                                title: 'Tin tức Sinh Viên',
                                              )));
                                },
                                child: Text(
                                  "Xem thêm",
                                  style: Theme.of(context)
                                      .textTheme
                                      .textStyle14
                                      .copyWith(
                                          color: MGColors.kMainColor,
                                          fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                          ...data
                              .map((e) => NewsHorizontalItem(data: e))
                              .toList()
                        ],
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => NoticeScreen()));
          },
          child: const Icon(
            Icons.my_library_add,
          ),
        ),
      ),
    );
  }
}

class NewsHorizontalItem extends StatelessWidget {
  final News data;

  const NewsHorizontalItem({Key? key, required this.data}) : super(key: key);

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
              width: 100,
              height: 50,
              child: CachedNetworkImage(
                imageUrl: data.urlThumbnail,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
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
                    style: Theme.of(context).textTheme.textStyle12.copyWith(
                        color: MGColors.black, fontWeight: FontWeight.bold),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

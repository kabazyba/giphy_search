import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giphy_search/app_config.dart';
import 'package:giphy_search/network/response.dart';
import 'package:giphy_search/popup/popup.dart';
import 'package:giphy_search/providers/search_provider.dart';
import 'package:giphy_search/utils.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  FocusNode searchNode = FocusNode();
  TextEditingController searchKeyWordController = TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var searchProvider = Provider.of<SearchProvider>(context, listen: false);
      scrollController.addListener(() async {
        if (scrollController.offset >= scrollController.position.maxScrollExtent &&
            !scrollController.position.outOfRange &&
            searchProvider.giphyList.length < searchProvider.totalCount) {
          if (searchProvider.giphyListResponse.status != Status.loading) {
            await searchProvider.fetchGifList();
          }
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    searchNode.dispose();
    searchKeyWordController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var searchProvider = Provider.of<SearchProvider>(context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Utils.responseListener(
          response: searchProvider.giphyListResponse,
          onLoading: () {
            if (searchProvider.offset == 0) {
              PopUp.showPopUp(context);
            }
          },
          onCompleted: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
          onError: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          });
    });
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppConfig.of(context).appName),
              searchProvider.giphyList.isNotEmpty ? buildInfoWidget(searchProvider) : Container()
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: buildSearchTextField(),
                  ),
                  searchKeyWordController.text.isNotEmpty ? buildClearButton() : Container(),
                ],
              ),
            ),
            Divider(height: 2, color: Colors.grey),
            searchProvider.giphyList.isNotEmpty
                ? Expanded(
                    child: Scrollbar(
                      controller: scrollController,
                      isAlwaysShown: true,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        child: buildGifView(searchProvider),
                      ),
                    ),
                  )
                : Expanded(
                    child: Center(
                      child: Text('try to find something'),
                    ),
                  )
          ],
        ));
  }

  ///Build search field
  Widget buildSearchTextField() {
    return TextField(
      onChanged: (value) {
        setState(() {});
      },
      controller: searchKeyWordController,
      textInputAction: TextInputAction.go,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'search',
        hintStyle: TextStyle(),
      ),
      onEditingComplete: search,
    );
  }

  ///A button that clears all data
  Widget buildClearButton() {
    return IconButton(
      padding: EdgeInsets.all(0),
      alignment: Alignment.centerRight,
      icon: Icon(
        Icons.clear,
      ),
      onPressed: () {
        searchKeyWordController.clear();
        Provider.of<SearchProvider>(context, listen: false).clearData();
      },
    );
  }

  ///This widget displays all downloaded images
  Widget buildGifView(SearchProvider searchProvider) {
    return GridView.builder(
      controller: scrollController,
      physics: ScrollPhysics(),
      itemCount: searchProvider.giphyList.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: searchProvider.giphyList[index].images.original.webp ??
              searchProvider.giphyList[index].images.original.url,
          placeholder: (context, url) {
            return Padding(
              padding: EdgeInsets.all(2),
              child: Shimmer.fromColors(
                  enabled: true,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.white,
                  ),
                  baseColor: shimmerDarkColor,
                  highlightColor: shimmerLightColor),
            );
          },
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    );
  }

  ///This widget displays current gif information
  Widget buildInfoWidget(SearchProvider searchProvider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'total count: ${searchProvider.totalCount}',
          style: TextStyle(fontSize: 9, color: Colors.black),
        ),
        Text('displayed: ${searchProvider.giphyList.length}', style: TextStyle(fontSize: 9, color: Colors.black)),
      ],
    );
  }

  Future<void> search() async {
    FocusScope.of(context).requestFocus(new FocusNode());
    if (searchKeyWordController.text.isNotEmpty) {
      Provider.of<SearchProvider>(context, listen: false).fetchGifList(question: searchKeyWordController.text);
    }
  }
}

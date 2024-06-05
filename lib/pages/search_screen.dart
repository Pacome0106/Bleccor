// ignore_for_file: unused_local_variable, deprecated_member_use, unnecessary_import

import 'package:blecor/pages/exercises_detail.dart';
import 'package:blecor/pages/home_page.dart';
import 'package:blecor/pages/widgets/bold_text.dart';
import 'package:blecor/pages/widgets/get_code.dart';
import 'package:blecor/pages/widgets/lign.dart';
import 'package:blecor/pages/widgets/smol_text.dart';
import 'package:blecor/pages/widgets/variables.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../generated/assets.dart';
import '../models/preferences_manager/shared_preferences.dart';

class SearchPage extends StatefulWidget {
  final List historyItems;

  const SearchPage(this.historyItems, {Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  TextEditingController textSearch = TextEditingController();
  String searchQuery = '';
  List searchResults = [];
  bool isSearch = true;

  searchHistory(String query) {
    setState(() {
      searchQuery = query;
      if (query.isEmpty) {
        searchResults.clear(); // Efface les résultats de recherche précédents
      } else {
        searchResults = widget.historyItems
            .where((history) =>
                history['title'].toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
      isSearch = false;
    });
  }

  List getHistoryByLetter(String letter) {
    return widget.historyItems
        .where((history) => history['title'].toLowerCase().contains(letter))
        .toList();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
    )..repeat(reverse: true);

    _opacityAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool hasSearchResults = searchResults.isNotEmpty;
    List filteredVideos = getHistoryByLetter(searchQuery.toLowerCase());
    String code = MyPreferences.getCode();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
        title: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: CupertinoSearchTextField(
            placeholder: "Rechercher...",
            controller: textSearch,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSecondary,
              fontFamily: 'Montserrat',
            ),
            placeholderStyle: TextStyle(
              color: Theme.of(context).colorScheme.tertiary,
              fontSize: 14,
              fontFamily: 'Montserrat',
              decoration: TextDecoration.none,
              letterSpacing: 0,
            ),
            onSuffixTap: () => setState(() {
              textSearch.text = '';
              searchResults = [];
            }),
            onChanged: (String value) {
              if (value != '') {
                searchHistory(value);
              } else {
                setState(() {
                  textSearch.text = '';
                  searchResults = [];
                });
              }
            },
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
            (route) => false,
          ),
          icon: Icon(
            FluentIcons.ios_arrow_24_regular,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          sizedBox,
          sizedBox,
          isSearch
              ? Container(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedBuilder(
                        animation: _opacityAnimation,
                        builder: (context, child) {
                          return Opacity(
                            opacity: _opacityAnimation.value,
                            child: const Icon(
                              FluentIcons.search_48_regular,
                              size: 150,
                            ),
                          );
                        },
                      ),
                      SmolText(
                        text: "Rechercher...",
                      ),
                    ],
                  ),
                )
              : (hasSearchResults)
                  ? Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: GridView.builder(
                          itemCount: filteredVideos.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 0.8),
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              if (code == codeAccess) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ExercisesDetail(
                                      title: filteredVideos[index]['title'],
                                      subtitle: simulators[index]['subtitle'],
                                      exercise: filteredVideos[index]
                                          ['question'],
                                      enter: filteredVideos[index]['enter'],
                                      image: filteredVideos[index]['image'],
                                      index: index + 1,
                                    ),
                                  ),
                                );
                              } else {
                                showDialogConfirm(
                                    context, filteredVideos[index], index);
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: borderRadius,
                                color: Theme.of(context).colorScheme.background,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 5,
                                    blurRadius: 15,
                                    offset: const Offset(0, 9),
                                  )
                                ],
                              ),
                              child: Column(
                                children: [
                                  BoldText(
                                      text: filteredVideos[index]['title'],
                                      size: 14),
                                  sizedBox,
                                  SmolText(
                                      text: filteredVideos[index]['subtitle']),
                                  sizedBox,
                                  Hero(
                                    tag: filteredVideos[index]['subtitle'] +
                                        (index + 1).toString(),
                                    child: Container(
                                      height: 80,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              filteredVideos[index]['image']),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: Image.asset(
                        Assets.assetsNoData,
                        height: 230,
                        width: double.maxFinite,
                      ),
                    ),
        ],
      ),
    );
  }
}

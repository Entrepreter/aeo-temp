import 'package:aeo_logic/utils/app_data.dart';
import 'package:aeo_logic/utils/colors_helper.dart';
import 'package:flutter/material.dart';
import '../utils/extensions.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: Drawer(),
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.airplay_outlined), onPressed: () {})
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            //body
            buildBody(),
            //bottom navigation bar
            buildBottomNav(context)
          ],
        ),
      ),
    );
  }

  PageView buildBody() {
    return PageView.builder(
      onPageChanged: (i) {
        setState(() {
          _currentPage = i;
        });
      },
      itemBuilder: (_, i) {
        return AppData.navigationList[i].page;
      },
      itemCount: AppData.navigationList.length,
      controller: _pageController,
    );
  }

  Positioned buildBottomNav(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        height: 56,
        // 16*2 for left and right 16 margin
        width: MediaQuery.of(context).size.width - 16 * 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: kPrimaryColor,
        ),
        child: FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: AppData.navigationList.map((e) {
              int index = AppData.navigationList.indexOf(e);
              bool isSelected = index == _currentPage;
              return AnimatedSwitcher(
                duration: Duration(milliseconds: 200),
                child: FlatButton.icon(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  color: isSelected ? Colors.white : Colors.transparent,
                  icon: Icon(
                    e.icon,
                  ),
                  textColor: isSelected ? kPrimaryColor : Colors.white,
                  label: isSelected
                      ? FittedBox(child: Text("${e.title}"))
                      : Container(
                          width: 0,
                        ),
                  onPressed: () {
                    _pageController.jumpToPage(index);
                    setState(() {
                      _currentPage = index;
                    });
                  },
                ),
              );
            }).toList(),
          ).paddingHorizontal(16),
        ),
      ),
    );
  }
}

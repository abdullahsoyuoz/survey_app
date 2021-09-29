import 'package:anketapp/Pages/DiscoverPage.dart';
import 'package:anketapp/Pages/HomePage.dart';
import 'package:anketapp/Pages/NotifyPage.dart';
import 'package:anketapp/Pages/ProfilePage.dart';
import 'package:anketapp/Pages/SurveyPages/SurveyCreatePage.dart';
import 'package:anketapp/Utility/AssetsPath.dart';
import 'package:anketapp/Utility/Colors.dart';
import 'package:anketapp/Utility/FakeData.dart';
import 'package:anketapp/Utility/Util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:anketapp/Config/config.dart' as config;

class MainPageViewBuilder extends StatefulWidget {
  @override
  MainPageViewBuilderState createState() => MainPageViewBuilderState();
}

class MainPageViewBuilderState extends State<MainPageViewBuilder> {
  PageController pageController;
  int currentPageIndex = 0;
  FakeCategory fakeCategory;

  @override
  void initState() {
    super.initState();
    fakeCategory = FakeData.fakeCategories[0];
    pageController = PageController(initialPage: currentPageIndex);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    config.pageViewState.value = this;

    final pages = [
      HomePage(this),
      DiscoverPage(fakeCategory),
      SurveyCreatePage(),
      NotifyPage(),
      ProfilePage(),
    ];
    var scaffold = Scaffold(
      body: PageView.builder(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => pages[currentPageIndex],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: EdgeInsets.only(
          top: 0,
          bottom: MediaQuery.of(context).padding.bottom + 5,
          left: 20,
          right: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Image.asset(
                AppAssetsPath.navHome,
                width: 20,
                color: currentPageIndex == 0
                    ? AppColors.appColorDarkGreen
                    : AppColors.appColorGrey,
              ),
              onPressed: () {
                setState(() {
                  currentPageIndex = 0;
                });
              },
            ),
            IconButton(
              icon: Image.asset(
                AppAssetsPath.navDiscover,
                width: 20,
                color: currentPageIndex == 1
                    ? AppColors.appColorDarkGreen
                    : AppColors.appColorGrey,
              ),
              onPressed: () {
                setState(() {
                  currentPageIndex = 1;
                });
              },
            ),
            FloatingActionButton(
              mini: true,
              backgroundColor: AppColors.appColorDarkGreen,
              elevation: 0,
              child: Icon(Icons.add, size: 25,),
              onPressed: () {
                setState(() {
                  showDialog(
                    context: context,
                    barrierColor: Colors.black.withOpacity(0.8),
                    barrierDismissible: true,
                    builder: (context) {
                      return surveyCreateDialog();
                    },
                  );
                });
              },
            ),
            IconButton(
              icon: Image.asset(
                AppAssetsPath.navBell,
                width: 20,
                color: currentPageIndex == 3
                    ? AppColors.appColorDarkGreen
                    : AppColors.appColorGrey,
              ),
              onPressed: () {
                setState(() {
                  currentPageIndex = 3;
                });
              },
            ),
            IconButton(
              icon: Image.asset(
                AppAssetsPath.navUser,
                width: 20,
                color: currentPageIndex == 4
                    ? AppColors.appColorDarkGreen
                    : AppColors.appColorGrey,
              ),
              onPressed: () {
                setState(() {
                  currentPageIndex = 4;
                });
              },
            ),
          ],
        ),
      ),
    );
    return scaffold;
  }

  Widget surveyCreateDialog() {
    return Dialog(
      elevation: 10,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: FittedBox(
        fit: BoxFit.fitHeight,
        child: Container(
          width: getSize(context) * 0.8,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                width: getSize(context) * 0.4,
                child: Image.asset(
                  AppAssetsPath.surveyDialogIllustrator,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'Anket yap veya bir soru sor!',
                  style: GoogleFonts.poppins(
                      color: AppColors.appColorBlueDark,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Text(
                '🤔',
                style: TextStyle(fontSize: 30),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlineButton(
                      onPressed: () {},
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        'Soru Sor',
                        style: GoogleFonts.poppins(
                            color: Colors.grey.shade600,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    FlatButton(
                        onPressed: () {
                          setState(() {
                            currentPageIndex = 2;
                          });
                          Navigator.pop(context);
                        },
                        color: AppColors.appColorOrange,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text('Anket Yap',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600)))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

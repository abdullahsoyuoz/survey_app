import 'dart:math' as math;
import 'package:anketapp/Pages/SurveyPages/SurvayDetailPage.dart';
import 'package:anketapp/Pages/mainPageViewBuilder.dart';
import 'package:anketapp/Utility/Colors.dart';
import 'package:anketapp/Utility/FakeData.dart';
import 'package:anketapp/Utility/Util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:anketapp/Config/config.dart' as config;

class HomePage extends StatefulWidget {
  MainPageViewBuilderState state;
  HomePage(this.state);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: Container(
        width: getSize(context),
        height: MediaQuery.of(context).size.height,
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(
            top: 18,
            bottom: 24,
          ),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'Kendine yakın kategoriyi seç!',
                style: GoogleFonts.poppins(
                    color: AppColors.appColorBlueDark,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              childAspectRatio: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: 15,
                right: 15,
              ),
              children: FakeData.fakeCategories.map((item) {
                return buildCategoryItem(item);
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Son Eklenen Anketler',
                      style: GoogleFonts.poppins(
                          color: AppColors.appColorBlueDark,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Tümünü Gör',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 3.0),
                        child: CircleAvatar(
                          backgroundColor: AppColors.appColorOrange,
                          radius: 8,
                          child: Icon(
                            Icons.keyboard_arrow_right_rounded,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                height: 130,
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(
                    left: 40,
                    top: 10,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: FakeData.fakeSurveyList.length,
                  itemBuilder: (context, index) {
                    var item = FakeData.fakeSurveyList[index];
                    return surveyItem(item);
                  },
                ),
              ),
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.network(
                    'https://assets1.lottiefiles.com/private_files/lf30_ltuqrtmn.json',
                    width: getSize(context) * 0.7,
                    fit: BoxFit.fitWidth,
                  ),
                  Text(
                    'Hemen bir anket yap\nveya bir anket oluştur',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: SizedBox(),
      toolbarHeight: 80,
      backgroundColor: Colors.white,
      centerTitle: false,
      elevation: 0,
      leadingWidth: 0,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.only(left: 0.0),
        child: RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
              text: 'Hoş Geldin,',
              style: GoogleFonts.poppins(
                  color: Colors.grey.shade600,
                  fontSize: 22,
                  fontWeight: FontWeight.w700),
              children: [
                TextSpan(
                  text: ' Ali',
                  style: GoogleFonts.poppins(
                      color: AppColors.appColorBlueDark,
                      fontSize: 22,
                      fontWeight: FontWeight.w700),
                ),
                TextSpan(text: ' 👋')
              ]),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: IconButton(
            onPressed: () {},
            splashColor: Colors.transparent,
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }

  Widget buildCategoryItem(FakeCategory item) {
    return InkWell(
      onTap: () {
        config.pageViewState.value.setState(() {
          config.pageViewState.value.fakeCategory = item;
          config.pageViewState.value.currentPageIndex = 1;
        });
      },
      borderRadius: BorderRadius.circular(10),
      splashColor: AppColors.appColorOrange,
      highlightColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 3),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                width: getSize(context) * 0.4,
                decoration: BoxDecoration(
                    color: item.backgroundColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Icon(
                  item.iconData,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  item.title,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  maxLines: 1,
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget surveyItem(FakeSurvey item) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => SurvayDetailPage(item),
            ));
      },
      child: Container(
        width: getSize(context) * 0.7,
        margin: EdgeInsets.only(right: 30),
        decoration: BoxDecoration(
          gradient:
              RadialGradient(center: Alignment.center, radius: 1, colors: [
            item.category.backgroundColor.withOpacity(0.7),
            item.category.backgroundColor,
          ]),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              left: 0,
              bottom: 0,
              child: Transform.rotate(
                angle: -math.pi / 6,
                child: Icon(
                  item.category.iconData,
                  color: Colors.white.withOpacity(0.3),
                  size: getSize(context) * 0.15,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      item.category.iconData,
                      color: Colors.white,
                      size: 30,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.category.title,
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                )),
                            Text(
                              item.title,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              maxLines: 2,
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Icon(FontAwesomeIcons.chevronCircleRight,
                        color: Colors.white)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

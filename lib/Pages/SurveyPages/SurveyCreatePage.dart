import 'package:anketapp/Pages/mainPageViewBuilder.dart';
import 'package:anketapp/Utility/Colors.dart';
import 'package:anketapp/Utility/FakeData.dart';
import 'package:anketapp/Utility/Util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SurveyCreatePage extends StatefulWidget {
  @override
  _SurveyCreatePageState createState() => _SurveyCreatePageState();
}

class _SurveyCreatePageState extends State<SurveyCreatePage> {
  int currentPageIndex = 0;
  PageController pageController;

  int selectedCategoryIndex = -1;
  TextEditingController _survayTitleController = new TextEditingController();
  TextEditingController _survayDescriptionController =
      new TextEditingController();
  TextEditingController _firstOptionController = new TextEditingController();
  TextEditingController _secondOptionController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentPageIndex);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      surveySetTitle(),
      surveySetDescription(),
      survayFirstOption(),
      survaySecondOption(),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              physics: NeverScrollableScrollPhysics(),
              itemCount: pages.length,
              itemBuilder: (context, index) => pages[currentPageIndex],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 5,
              right: 20,
              left: 20,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    currentPageIndex > 0
                        ? FlatButton(
                            onPressed: () {
                              if (currentPageIndex > 0) {
                                currentPageIndex--;
                                pageController.animateToPage(currentPageIndex,
                                    duration: Duration(milliseconds: 150),
                                    curve: Curves.fastOutSlowIn);
                              }
                              setState(() {});
                            },
                            color: AppColors.appColorOrangeLighter,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Text('Geriye dönün',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                )),
                          )
                        : SizedBox(),
                    FlatButton(
                      onPressed: () {
                        if (currentPageIndex < 3) {
                          currentPageIndex++;
                          pageController
                              .animateToPage(currentPageIndex,
                                  duration: Duration(milliseconds: 150),
                                  curve: Curves.fastOutSlowIn)
                              .then((value) => {});
                        } else {
                          Navigator.pushAndRemoveUntil(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => MainPageViewBuilder(),
                              ),
                              (route) => false);
                        }
                        setState(() {});
                      },
                      color: AppColors.appColorOrange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(currentPageIndex == 3 ? 'Yayınla' : 'İleri',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                  ],
                ),
                SmoothPageIndicator(
                  controller: pageController,
                  count: pages.length,
                  effect: ExpandingDotsEffect(
                      activeDotColor: AppColors.appColorOrange,
                      dotColor: AppColors.appColorOrangeLighter),
                  axisDirection: Axis.horizontal,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      toolbarHeight: 80,
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Text(
        'Soru Sor',
        style: GoogleFonts.poppins(
            color: AppColors.appColorBlueDark, fontWeight: FontWeight.w700),
      ),
      leading: InkWell(
        onTap: () {
          Navigator.pushReplacement(
              context,
              CupertinoPageRoute(
                builder: (context) => MainPageViewBuilder(),
              ));
        },
        child: Icon(
          FontAwesomeIcons.chevronLeft,
          color: AppColors.appColorBlueDark,
        ),
      ),
    );
  }

  Widget surveySetTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        shrinkWrap: true,
        children: [
          Text(
            'Anket Kategorisi',
            style: GoogleFonts.poppins(
                color: AppColors.appColorBlueDark,
                fontSize: 22,
                fontWeight: FontWeight.w700),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3.0),
            child: Text(
              selectedCategoryIndex != -1
                  ? FakeData.fakeCategories[selectedCategoryIndex].title
                  : '',
              style: GoogleFonts.poppins(
                  color: AppColors.appColorBlueDark,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 50,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: FakeData.fakeCategories.length,
              itemBuilder: (context, index) {
                var item = FakeData.fakeCategories[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedCategoryIndex = index;
                        });
                      },
                      borderRadius: BorderRadius.circular(100),
                      child: CircleAvatar(
                        radius: 25,
                        child: Icon(
                          item.iconData,
                          color: selectedCategoryIndex == index
                              ? Colors.white
                              : Colors.black.withOpacity(0.3),
                          size: 18,
                        ),
                        backgroundColor: selectedCategoryIndex == index
                            ? item.backgroundColor
                            : Colors.transparent,
                      )),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              'Anket Başlığı',
              style: GoogleFonts.poppins(
                  color: AppColors.appColorBlueDark,
                  fontSize: 22,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Container(
              width: getSize(context),
              padding: EdgeInsets.symmetric(vertical: 0),
              decoration: BoxDecoration(
                  color: AppColors.appColorDarkGreen,
                  borderRadius: BorderRadius.circular(20)),
              child: TextField(
                controller: _survayTitleController,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  border: InputBorder.none,
                  hintText: '...',
                  hintStyle: GoogleFonts.poppins(color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Lottie.network(
              'https://assets1.lottiefiles.com/packages/lf20_zf6raviy.json',
              width: getSize(context) * 0.35,
              height: getSize(context) * 0.35,
              repeat: false,
              onLoaded: (_) => CircularProgressIndicator(),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text('Lütfen anketinize bir başlık giriniz.',
                style: GoogleFonts.poppins(
                    color: Colors.grey.shade600, fontSize: 16)),
          ),
        ],
      ),
    );
  }

  Widget surveySetDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        shrinkWrap: true,
        children: [
          Text(
            'Anket Açıklaması',
            style: GoogleFonts.poppins(
                color: AppColors.appColorBlueDark,
                fontSize: 22,
                fontWeight: FontWeight.w700),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Container(
              width: getSize(context),
              padding: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                  color: AppColors.appColorDarkGreen,
                  borderRadius: BorderRadius.circular(20)),
              child: TextField(
                controller: _survayDescriptionController,
                maxLines: 4,
                minLines: 4,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  border: InputBorder.none,
                  hintText: '...',
                  hintStyle: GoogleFonts.poppins(color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Lottie.network(
              'https://assets1.lottiefiles.com/packages/lf20_zf6raviy.json',
              width: getSize(context) * 0.35,
              height: getSize(context) * 0.35,
              repeat: false,
              onLoaded: (_) => CircularProgressIndicator(),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text('Lütfen anketinizin açıklamasını giriniz.',
                style: GoogleFonts.poppins(
                    color: Colors.grey.shade600, fontSize: 16)),
          ),
        ],
      ),
    );
  }

  Widget survayFirstOption() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        shrinkWrap: true,
        children: [
          Text(
            '1. Seçenek Başlığı',
            style: GoogleFonts.poppins(
                color: AppColors.appColorBlueDark,
                fontSize: 22,
                fontWeight: FontWeight.w700),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Container(
              width: getSize(context),
              decoration: BoxDecoration(
                  color: AppColors.appColorDarkGreen,
                  borderRadius: BorderRadius.circular(20)),
              child: TextField(
                controller: _firstOptionController,
                maxLines: 1,
                minLines: 1,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  border: InputBorder.none,
                  hintText: '...',
                  hintStyle: GoogleFonts.poppins(color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Text(
              '1. Seçenek Fotoğrafı',
              style: GoogleFonts.poppins(
                  color: AppColors.appColorBlueDark,
                  fontSize: 22,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 48.0),
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(50),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Lottie.network(
                      'https://assets8.lottiefiles.com/private_files/lf30_a4dfntxx.json',
                      width: getSize(context) * 0.35,
                      height: getSize(context) * 0.35,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text('Fotoğrafı seçmek için tıklayın',
                          style: GoogleFonts.poppins(
                              color: Colors.grey.shade600, fontSize: 16)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget survaySecondOption() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        shrinkWrap: true,
        children: [
          Text(
            '2. Seçenek Başlığı',
            style: GoogleFonts.poppins(
                color: AppColors.appColorBlueDark,
                fontSize: 22,
                fontWeight: FontWeight.w700),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Container(
              width: getSize(context),
              decoration: BoxDecoration(
                  color: AppColors.appColorDarkGreen,
                  borderRadius: BorderRadius.circular(20)),
              child: TextField(
                controller: _secondOptionController,
                maxLines: 1,
                minLines: 1,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  border: InputBorder.none,
                  hintText: '...',
                  hintStyle: GoogleFonts.poppins(color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Text(
              '2. Seçenek Fotoğrafı',
              style: GoogleFonts.poppins(
                  color: AppColors.appColorBlueDark,
                  fontSize: 22,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 48.0),
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(50),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Lottie.network(
                      'https://assets8.lottiefiles.com/private_files/lf30_a4dfntxx.json',
                      width: getSize(context) * 0.35,
                      height: getSize(context) * 0.35,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text('Fotoğrafı seçmek için tıklayın',
                          style: GoogleFonts.poppins(
                              color: Colors.grey.shade600, fontSize: 16)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

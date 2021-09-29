import 'package:anketapp/Pages/SurveyPages/SurvayDetailPage.dart';
import 'package:anketapp/Utility/Colors.dart';
import 'package:anketapp/Utility/FakeData.dart';
import 'package:anketapp/Utility/Util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class DiscoverPage extends StatefulWidget {
  FakeCategory fakeCategory;
  DiscoverPage(this.fakeCategory);

  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  FakeCategory fakeCategory;

  @override
  void initState() {
    super.initState();
    fakeCategory = widget.fakeCategory == null
        ? FakeData.fakeCategories[0]
        : widget.fakeCategory;
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
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(top: 10),
            children: [
              buildSearchBar(),
              ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(
                  top: 30,
                  left: 30,
                  right: 30,
                ),
                itemCount: FakeData.fakeSurveyList.length,
                itemBuilder: (context, index) {
                  if (widget.fakeCategory.id ==
                      FakeData.fakeSurveyList[index].category.id) {
                    FakeSurvey item = FakeData.fakeSurveyList[index];
                    return buildResultItem(item);
                  }
                  return SizedBox();
                },
              )
            ],
          ),
        ));
  }

  Widget buildResultItem(FakeSurvey item) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => SurvayDetailPage(item),
            ));
      },
      borderRadius: BorderRadius.circular(10),
      splashColor: item.category.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    item.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: GoogleFonts.poppins(
                      color: AppColors.appColorBlueDark,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Icon(
                  FontAwesomeIcons.chevronCircleRight,
                  color: widget.fakeCategory.backgroundColor,
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: 150),
              child: Divider(
                thickness: 1,
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildSearchBar() {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 30),
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade200,
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 5))
          ]),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Anket Ara...'),
            ),
            flex: 5,
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                  color: widget.fakeCategory.backgroundColor,
                  borderRadius:
                      BorderRadius.horizontal(right: Radius.circular(10))),
              child: Center(
                child: Icon(Icons.search, color: Colors.white),
              ),
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
      automaticallyImplyLeading: true,
      title: Text(
        '${fakeCategory.title}',
        style: GoogleFonts.poppins(
            color: AppColors.appColorBlueDark, fontWeight: FontWeight.w700),
      ),
    );
  }
}

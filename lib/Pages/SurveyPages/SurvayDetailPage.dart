import 'package:anketapp/Utility/Colors.dart';
import 'package:anketapp/Utility/FakeData.dart';
import 'package:anketapp/Utility/Util.dart';
import 'package:anketapp/Utility/Widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snapping_sheet/snapping_sheet.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class SurvayDetailPage extends StatefulWidget {
  FakeSurvey survey;
  SurvayDetailPage(this.survey);
  @override
  _SurvayDetailPageState createState() => _SurvayDetailPageState();
}

class _SurvayDetailPageState extends State<SurvayDetailPage> {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  TextEditingController _commentController = new TextEditingController();
  SnappingSheetController _snappingSheetController =
      new SnappingSheetController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: SnappingSheet(
        child: Container(
          width: getSize(context),
          height: MediaQuery.of(context).size.height,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(
              top: 10,
              left: 20,
              right: 20,
              bottom: 90,
            ),
            children: [
              Text(
                '${widget.survey.title}',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                softWrap: true,
                style: GoogleFonts.poppins(
                    color: AppColors.appColorBlueDark,
                    fontSize: 22,
                    fontWeight: FontWeight.w800),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  '${widget.survey.description}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                  softWrap: true,
                  style: GoogleFonts.poppins(
                      color: Colors.grey.shade400,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 30,
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        buildSurveyImage(widget.survey.firstImageUrl),
                        Text(
                          '${widget.survey.firstVoteTitle}',
                          style: GoogleFonts.poppins(
                              color: AppColors.appColorBlueDark,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    )),
                    Expanded(
                        child: Column(
                      children: [
                        buildSurveyImage(widget.survey.secondImageUrl),
                        Text(
                          '${widget.survey.secondVoteTitle}',
                          style: GoogleFonts.poppins(
                              color: AppColors.appColorBlueDark,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Column(
                  children: [
                    buildVoteBar(widget.survey, true),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: buildVoteBar(widget.survey, false),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        snappingSheetController: _snappingSheetController,
        lockOverflowDrag: true,
        grabbing: GrabbingWidget(),
        grabbingHeight: 70,
        sheetBelow: commentsSheet(widget.survey),
      ),
    );
  }

  Widget buildVoteBar(FakeSurvey item, bool isFirst) {
    int firstValue = item.firstVoteValue;
    int secondValue = item.secondVoteValue;
    int totalValue = firstValue + secondValue;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Stack(
                  children: [
                    StepProgressIndicator(
                      totalSteps: totalValue,
                      currentStep: isFirst ? firstValue : secondValue,
                      padding: 0,
                      selectedColor: AppColors.appColorDarkGreen,
                      unselectedColor: AppColors.appColorDarkGreenLighter,
                      size: 40,
                      roundedEdges: Radius.circular(10),
                      progressDirection: TextDirection.ltr,
                      fallbackLength: 10,
                    ),
                    Container(
                      height: 40,
                      width: getSize(context),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            isFirst
                                ? '${item.firstVoteTitle}'
                                : '${item.secondVoteTitle}',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            isFirst
                                ? '%${((firstValue * 100) / totalValue).toInt()}'
                                : '%${((secondValue * 100) / totalValue).toInt()}',
                            style: GoogleFonts.poppins(
                                color: AppColors.appColorDarkGreen,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      FontAwesomeIcons.solidUser,
                      color: AppColors.appColorDarkGreen,
                      size: 23,
                    ),
                  ),
                  Expanded(
                    child: FittedBox(
                      child: Text(
                        isFirst
                            ? item.firstVoteValue.toString()
                            : item.secondVoteValue.toString(),
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildSurveyImage(String imgUrl) {
    return AspectRatio(
      aspectRatio: 1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: AppColors.appColorDarkGreenLighter,
              border: Border.all(color: AppColors.appColorDarkGreen, width: 3),
              borderRadius: BorderRadius.circular(20)),
          child: widget.survey.firstImageUrl != null
              ? Image.network(
                  imgUrl,
                  fit: BoxFit.fitWidth,
                )
              : emptyWidget('Resim bulunamadı...'),
        ),
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
        'Anket',
        style: GoogleFonts.poppins(
            color: AppColors.appColorBlueDark, fontWeight: FontWeight.w700),
      ),
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          FontAwesomeIcons.chevronLeft,
          color: AppColors.appColorBlueDark,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.search,
              color: AppColors.appColorBlueDark,
            ),
          ),
        )
      ],
    );
  }

  commentsSheet(FakeSurvey survey) {
    return SnappingSheetContent(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Divider(),
                  );
                },
                itemCount: FakeData.fakeCommentList.length,
                itemBuilder: (context, index) {
                  var item = survey.commentList[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.name,
                                  style: GoogleFonts.poppins(
                                      color: AppColors.appColorBlueDark,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w800),
                                ),
                                Text(
                                  item.comment,
                                  maxLines: 5,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                      color: AppColors.appColorBlueDark,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Icon(
                                  FontAwesomeIcons.solidThumbsUp,
                                  color: AppColors.appColorOrange,
                                  size: 17,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 3.0),
                                child: Text(item.approvers.toString()),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: InkWell(
                                  onTap: () {},
                                  child: Icon(
                                    FontAwesomeIcons.solidThumbsDown,
                                    color: Colors.grey.shade300,
                                    size: 17,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 3.0),
                                child: Text(item.disapprovals.toString()),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  bottom: MediaQuery.of(context).padding.bottom),
              child: Container(
                height: 50,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        FontAwesomeIcons.chevronCircleLeft,
                        color: Colors.grey.shade300,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Icon(
                          FontAwesomeIcons.solidLaugh,
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextField(
                        controller: _commentController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Yorum ekle...',
                            hintStyle: GoogleFonts.poppins(
                              color: Colors.grey.shade400,
                            )),
                      ),
                    )),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Icon(
                          FontAwesomeIcons.solidPaperPlane,
                          color: AppColors.appColorOrange,
                        ),
                      ),
                    ),
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

class GrabbingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.appColorOrange,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(blurRadius: 25, color: Colors.black.withOpacity(0.2)),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.4),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          SizedBox(
              height: 35,
              child: Center(
                  child: Text('Yorumlar',
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontWeight: FontWeight.w500)))),
        ],
      ),
    );
  }
}

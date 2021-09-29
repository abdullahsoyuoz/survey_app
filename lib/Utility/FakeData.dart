import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FakeData {
  static List<FakeComment> fakeCommentList = [
    FakeComment('Ali Ceylan', 'Bence kesinlikle fifa almalısın', 13, 8),
    FakeComment('Ali Ceylan', 'Bence kesinlikle mercedes', 13, 8),
    FakeComment('Ali Ceylan', 'Bence kesinlikle bitcoin', 13, 8),
    FakeComment('Ali Ceylan', 'Bence almalısın', 13, 8),
    FakeComment('Ali Ceylan', faker.lorem.sentence()+faker.lorem.sentence()+faker.lorem.sentence()+faker.lorem.sentence()+faker.lorem.sentence(), 13, 8),
    FakeComment('Ali Ceylan', 'Bence kesinlikle fifa almalısın', 13, 8),
    FakeComment('Ali Ceylan', 'Bence kesinlikle fifa almalısın', 13, 8),
    FakeComment('Ali Ceylan', 'Bence kesinlikle fifa almalısın', 13, 8),
    FakeComment('Ali Ceylan', 'Bence kesinlikle fifa almalısın', 13, 8),
    FakeComment('Ali Ceylan', 'Bence kesinlikle fifa almalısın', 13, 8),
    FakeComment('Ali Ceylan', 'Bence kesinlikle fifa almalısın', 13, 8),
    FakeComment('Ali Ceylan', 'Bence kesinlikle fifa almalısın', 13, 8),
    FakeComment('Ali Ceylan', 'Bence kesinlikle fifa almalısın', 13, 8),
    FakeComment('Ali Ceylan', 'Bence kesinlikle fifa almalısın', 13, 8),
    FakeComment('Ali Ceylan', 'Bence kesinlikle fifa almalısın', 13, 8),
  ];

  static List<FakeCategory> fakeCategories = [
    FakeCategory(0, 'Vasıta', FontAwesomeIcons.carSide,
        Color.fromARGB(255, 255, 116, 139)),
    FakeCategory(1, 'Ürün ve Aksesuar', FontAwesomeIcons.shoppingBag,
        Color.fromARGB(255, 161, 240, 137)),
    FakeCategory(2, 'Tatil ve Gezi', FontAwesomeIcons.umbrellaBeach,
        Color.fromARGB(255, 178, 230, 253)),
    FakeCategory(3, 'Güncel Konular', FontAwesomeIcons.bullhorn,
        Color.fromARGB(255, 255, 158, 82)),
    FakeCategory(4, 'Teknoloji ve Eğlence', FontAwesomeIcons.lightbulb,
        Color.fromARGB(255, 252, 243, 0)),
    FakeCategory(5, 'Film, Dizi ve Kitap', FontAwesomeIcons.video,
        Color.fromARGB(255, 255, 139, 212)),
    FakeCategory(6, 'Finans ve Ticaret', FontAwesomeIcons.chartLine,
        Color.fromARGB(255, 0, 252, 235)),
    FakeCategory(7, 'Spor ve Sağlık', FontAwesomeIcons.dumbbell,
        Color.fromARGB(255, 212, 93, 255)),
  ];

  static List<FakeSurvey> fakeSurveyList = [
    FakeSurvey(
      category: fakeCategories[3],
      title: 'Korona Aşısı Sizce Etkili mi?',
      description: faker.lorem.sentence() +
          faker.lorem.sentence() +
          faker.lorem.sentence() +
          faker.lorem.sentence(),
      centerImageUrl: null,
      firstImageUrl: null,
      secondImageUrl: null,
      firstVoteTitle: 'Evet, etkili',
      secondVoteTitle: 'Etkisiz!',
      firstVoteValue: 120,
      secondVoteValue: 130,
      commentList: fakeCommentList,
    ),
    FakeSurvey(
      category: fakeCategories[0],
      title: 'Sizce Hangi Aracı Almalıyım?',
      description: faker.lorem.sentence() +
          faker.lorem.sentence() +
          faker.lorem.sentence() +
          faker.lorem.sentence(),
      centerImageUrl: null,
      firstImageUrl:
          'https://www.ssmotors.com.tr/B2ELResim/AracResim2El/10861/f552faa142ea4e3da03201eae7477ef61208201610360058695_0.jpg',
      secondImageUrl:
          'https://staticb.yolcu360.com/blog/wp-content/uploads/2020/04/20121934/a43.jpg',
      firstVoteTitle: 'Mercedes E 350 CDI',
      secondVoteTitle: 'Audi A4',
      firstVoteValue: 439,
      secondVoteValue: 270,
      commentList: fakeCommentList,
    ),
    FakeSurvey(
      category: fakeCategories[3],
      title: 'Korona bitti mi?',
      description: faker.lorem.sentence() +
          faker.lorem.sentence() +
          faker.lorem.sentence() +
          faker.lorem.sentence(),
      centerImageUrl: null,
      firstImageUrl: null,
      secondImageUrl: null,
      firstVoteTitle: 'Evet',
      secondVoteTitle: 'Bitmedi!',
      firstVoteValue: 80,
      secondVoteValue: 1130,
      commentList: fakeCommentList,
    ),
    FakeSurvey(
      category: fakeCategories[6],
      title: 'Bitcoin mi Ethereum mu?',
      description: faker.lorem.sentence() +
          faker.lorem.sentence() +
          faker.lorem.sentence() +
          faker.lorem.sentence(),
      centerImageUrl: null,
      firstImageUrl:
          'https://i.sozcu.com.tr/wp-content/uploads/2021/06/07/iecrop/bitcoin-400-1_16_9_1623075369.jpg',
      secondImageUrl:
          'https://geoim.bloomberght.com/2021/05/10/ver1620622530/2280045_360x203.jpg',
      firstVoteTitle: 'Bitcoin',
      secondVoteTitle: 'Ethereum',
      firstVoteValue: 1398,
      secondVoteValue: 1423,
      commentList: fakeCommentList,
    ),
    FakeSurvey(
      category: fakeCategories[5],
      title: 'Yüzüklerin Efendisi serisi zaman kaybı mı?',
      description: faker.lorem.sentence() +
          faker.lorem.sentence() +
          faker.lorem.sentence() +
          faker.lorem.sentence(),
      centerImageUrl: null,
      firstImageUrl: null,
      secondImageUrl: null,
      firstVoteTitle: 'Kesinlikle',
      secondVoteTitle: 'Ölmeden önce izle',
      firstVoteValue: 129,
      secondVoteValue: 770,
      commentList: fakeCommentList,
    ),
  ];
}

class FakeCategory {
  int id;
  String title;
  IconData iconData;
  Color backgroundColor;

  FakeCategory(this.id, this.title, this.iconData, this.backgroundColor);
}

class FakeSurvey {
  FakeCategory category;
  String title;
  String description;
  String centerImageUrl;
  String firstImageUrl;
  String secondImageUrl;
  String firstVoteTitle;
  String secondVoteTitle;
  int firstVoteValue;
  int secondVoteValue;
  List<FakeComment> commentList;
  FakeSurvey({
    this.category,
    this.title,
    this.description,
    this.centerImageUrl,
    this.firstImageUrl,
    this.secondImageUrl,
    this.firstVoteTitle,
    this.secondVoteTitle,
    this.firstVoteValue,
    this.secondVoteValue,
    this.commentList,
  });
}

class FakeComment {
  String name;
  String comment;
  int approvers;
  int disapprovals;
  FakeComment(this.name, this.comment, this.approvers, this.disapprovals);
}

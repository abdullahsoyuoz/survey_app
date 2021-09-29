import 'package:anketapp/Pages/Auth/RegisterPage.dart';
import 'package:anketapp/Pages/mainPageViewBuilder.dart';
import 'package:anketapp/Utility/AssetsPath.dart';
import 'package:anketapp/Utility/Colors.dart';
import 'package:anketapp/Utility/Util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:anketapp/Utility/CustomSocialButton.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _surnameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    List<Widget> loginButtonWidgetList = [
      SignInButton(Buttons.Facebook,
          mini: true,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          onPressed: () {}),
      SignInButton(Buttons.Twitter,
          mini: true,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          onPressed: () {}),
      SignInButton(Buttons.Google,
          mini: true,
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          onPressed: () {}),
    ];

    return Scaffold(
        resizeToAvoidBottomPadding: true,
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.appColorOrange,
        body: Form(
          key: _formKey,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top,
              ),
              physics: ClampingScrollPhysics(),
              children: [
                Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height / 2,
                  child: CustomPaint(
                    painter: CustomLoginPainter(context),
                    size: Size(getSize(context),
                        MediaQuery.of(context).size.height / 2),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 24.0),
                        child: Image.asset(
                          AppAssetsPath.loginIllustrator,
                          // width: getSize(context) * 0.6,
                          height: MediaQuery.of(context).size.height / 3,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 1.5,
                  padding: EdgeInsets.only(top: 10),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        height: 45,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            boxShadow: [BoxShadow(color: Colors.grey.shade400.withOpacity(.7), blurRadius: 5, offset: Offset(0,2), spreadRadius: 2)],
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          controller: _emailController,
                          style: GoogleFonts.poppins(color: Colors.grey.shade600),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'E-mail adresiniz',
                              hintStyle: GoogleFonts.poppins(color: Colors.grey.shade600)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          height: 45,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                            boxShadow: [BoxShadow(color: Colors.grey.shade400.withOpacity(.7), blurRadius: 5, offset: Offset(0,2), spreadRadius: 2)],
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            controller: _passwordController,
                            style: GoogleFonts.poppins(color: Colors.grey.shade600),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Şifreniz',
                                hintStyle: GoogleFonts.poppins(color: Colors.grey.shade600)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 16.0,
                          left: 30,
                          right: 30,
                        ),
                        child: FlatButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => MainPageViewBuilder(),
                                ));
                          },
                          child: Text(
                            'Giriş Yap',
                            style: GoogleFonts.poppins(color: Colors.white),
                          ),
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: AppColors.appColorDarkGreen,
                          minWidth: getSize(context),
                          height: 45,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: loginButtonWidgetList,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => MainPageViewBuilder(),
                                  ));
                            },
                            style: TextButton.styleFrom(
                                primary: AppColors.appColorOrange),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Giriş yapmadan önce içeriğe göz at',
                                  style: GoogleFonts.poppins(color: Colors.grey),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  color: Colors.grey,
                                )
                              ],
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => RegisterPage(),
                                  ));
                            },
                            style: TextButton.styleFrom(
                                primary: AppColors.appColorOrange),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Henüz kayıt olmadınız mı?',
                                  style: GoogleFonts.poppins(color: Colors.grey),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  color: Colors.grey,
                                )
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class CustomLoginPainter extends CustomPainter {
  BuildContext context;
  CustomLoginPainter(this.context);

  @override
  void paint(Canvas canvas, Size size) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height / 2;

    Paint backgroundPainter = Paint()
      ..color = AppColors.appColorOrange
      ..style = PaintingStyle.fill;
    Path path = Path();
    path.moveTo(width, height - 30);
    path.lineTo(width, 0);
    path.lineTo(0, 0);
    path.lineTo(0, height);
    path.cubicTo(
        0, height, width * 1 / 6, height - 120, width * 2 / 6, height - 40);
    path.quadraticBezierTo(
        width * 3.1 / 6, height + 30, width * 4.7 / 6, height - 50);
    path.quadraticBezierTo(width * 5.15 / 6, height - 70, width, height - 60);

    // path.lineTo(0, height / 2);
    canvas.drawPath(path, backgroundPainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

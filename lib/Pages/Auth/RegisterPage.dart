import 'package:anketapp/Utility/AssetsPath.dart';
import 'package:anketapp/Utility/Colors.dart';
import 'package:anketapp/Utility/Util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _surnameController = new TextEditingController();
  TextEditingController _mailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text('Kayıt Ol', style: GoogleFonts.poppins(color: Colors.black,),),
          centerTitle: true,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(FontAwesomeIcons.chevronLeft, color: Colors.black,),
          ),
        ),
        body: Form(
          key: _formKey,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.only(bottom: 10),
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 24.0, bottom: 0),
                    child: Image.asset(
                      AppAssetsPath.loginIllustrator,
                      // width: getSize(context) * 0.6,
                      height: MediaQuery.of(context).size.height / 5,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Container(
                  
                  color: Colors.white,
                  padding: EdgeInsets.only(top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
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
                            controller: _mailController,
                            style: GoogleFonts.poppins(color: Colors.grey.shade600),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Adınız',
                                hintStyle: GoogleFonts.poppins(color: Colors.grey.shade600)),
                          ),
                        ),
                      ),Padding(
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
                            controller: _mailController,
                            style: GoogleFonts.poppins(color: Colors.grey.shade600),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Soyadınız',
                                hintStyle: GoogleFonts.poppins(color: Colors.grey.shade600)),
                          ),
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
                            controller: _mailController,
                            style: GoogleFonts.poppins(color: Colors.grey.shade600),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'E-mail adresiniz',
                                hintStyle: GoogleFonts.poppins(color: Colors.grey.shade600)),
                          ),
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
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Kayıt Ol',
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

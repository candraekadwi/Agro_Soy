import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Colors
const kTextColor = Color(0xFF0D1333);
const kbackground = Color.fromRGBO(231, 233, 222, 1);
const kBlueColor = Color(0xFF3382CC);
const kBestSellerColor = Color(0xFFFFD073);
const kGreenColor = Color.fromARGB(255, 49, 182, 60);
const kTitleTextColor = Color(0xFF303030);
final kShadowColor = const Color(0xFFB7B7B7).withOpacity(.16);
const kDeathColor = Color(0xFFFF4848);
const kRecovercolor = Color(0xFF36C12C);
const kInfectedColor = Color(0xFFFF8748);
const kTextLightColor = Color(0xFF959595);
// My Text Styles
const kHeadingextStyle = TextStyle(
  fontSize: 28,
  color: kTextColor,
  fontWeight: FontWeight.bold,
);
const kSubheadingextStyle = TextStyle(
  fontSize: 24,
  color: Color(0xFF61688B),
  height: 2,
);


TextStyle kTitleTextStyle (Size size) => TextStyle(
  fontSize: size.width * 0.045,
  color: kTitleTextColor,
  fontWeight: FontWeight.bold,
);
const ktabelTextStyle = TextStyle(
  fontSize: 16,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);
const ktabelTextvalue = TextStyle(
  fontSize: 13,
  color: kTitleTextColor,
  fontWeight: FontWeight.bold,
);

const kSubtitleTextSyule = TextStyle(
  fontSize: 13,
  color: kTextLightColor,
  fontWeight: FontWeight.bold,
);

const kDetails = TextStyle(
  fontWeight: FontWeight.w600,
  color: kBlueColor,
);

const knpk = TextStyle(fontSize: 30, color: kInfectedColor);




TextStyle kLoginTitleStyle(Size size) => GoogleFonts.ubuntu(
      fontSize: size.height * 0.050,
      fontWeight: FontWeight.bold,
    );

TextStyle kLoginSubtitleStyle(Size size) => GoogleFonts.ubuntu(
      fontSize: size.height * 0.030,
    );

TextStyle kLoginTermsAndPrivacyStyle(Size size) =>
    GoogleFonts.ubuntu(fontSize: 15, color: Colors.grey, height: 1.5);

TextStyle kresetStyle(Size size) =>
    GoogleFonts.ubuntu(fontSize: 18, color: Colors.grey, height: 1.5,);

TextStyle kHaveAnAccountStyle(Size size) =>
    GoogleFonts.ubuntu(fontSize: size.height * 0.022, color: Colors.black);

TextStyle kLoginOrSignUpTextStyle(
  Size size,
) =>
    GoogleFonts.ubuntu(
      fontSize: size.height * 0.022,
      fontWeight: FontWeight.w500,
      color: const Color(0xff009889),
    );

TextStyle kTextFormFieldStyle() => const TextStyle(color: Colors.black);

TextStyle kTextlogin() => const TextStyle(fontWeight: FontWeight.bold, fontSize: 18);
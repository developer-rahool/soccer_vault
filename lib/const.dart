import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

const Color darkBlackColor = Color(0xFF191919);
const Color midBlackColor = Color(0xFF757575);
const Color lightBlackColor = Color(0xFFE8E8E8);
const Color yellowColor = Color(0xFFFEDE33);
const Color orangeColor = Color(0xFFFE8833);
const Color lightGreenColor = Color(0xFFCCEDCE);

nextPage(BuildContext context, Widget page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}

screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

void copyText(String text) {
  Clipboard.setData(ClipboardData(text: text));
}

String formatDate(String date) {
  DateTime parsedDate = DateTime.parse(date);
  DateFormat formatter = DateFormat('dd MMM, yyyy');
  return formatter.format(parsedDate);
}

class Custom_Button extends StatelessWidget {
  String? text;
  Function()? onPressed;
  Custom_Button({
    required this.text,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: yellowColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(45.0),
            // side: BorderSide(
            //     color: ,
            //     width: 1),
          ),
        ),
        child: Text(
          text!,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: darkBlackColor),
        ),
      ),
    );
  }
}

toast(BuildContext context, {String? msg}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: midBlackColor,
      content: Text(
        msg ?? "copied",
        style: const TextStyle(
            fontWeight: FontWeight.w600, fontSize: 15, color: Colors.white),
      )));
}

import 'package:flutter/material.dart';
import 'package:echo_cash/core/constants/app_constants.dart';
import 'package:echo_cash/core/constants/app_globals.dart';

class SuccessfullScreen extends StatelessWidget {

  final String title;

  final String subtitle;

  final String message;

  const SuccessfullScreen({Key? key, required this.title, required this.subtitle, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:

      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          ClipPath(
            clipper: CurveClipper(),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              height: MediaQuery.of(context).size.height/2.2,
              width: MediaQuery.of(context).size.width,
              color: secondaryColor,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.check_circle_outline,size: 100,color: Colors.white,),
                    Text(title,style: buttonTextDarkBgStyle,textAlign: TextAlign.center,)

                  ]),
            ),
          ),

          Column(children: [

            SizedBox(height: 8,),
            Text(title,style: headingStyle,textAlign: TextAlign.center,),
            SizedBox(height: 12,),
            Text(subtitle,style: textStyle3Secondary,textAlign: TextAlign.center,),
            SizedBox(height: 12,),
            Text(message,style: textStyle4DarkGrey,textAlign: TextAlign.center,),

          ],),
          Column(children: [
            Image.asset('assets/images/logo_in_app.png',width: 100,),
            Align(
              alignment: Alignment.centerRight,
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                elevation: 7,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: Container(

                  width: 55.0,
                  height: 55.0,

                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Center(
                      child: Icon(Icons.close_rounded,color: secondaryColor,size: 30,)
                  ),
                ),
              ),)
          ],),

        ],),
    );
  }
}
class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    int curveHeight = 20;
    Offset controlPoint = Offset(size.width / 2, size.height + curveHeight);
    Offset endPoint = Offset(size.width, size.height - curveHeight);

    Path path = Path()
      ..lineTo(0, size.height - curveHeight)
      ..quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy)
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
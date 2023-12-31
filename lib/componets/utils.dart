import 'package:avvento_media/componets/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/dialog/coming_soon_widget.dart';

class Utils {
  static double calculateAspectHeight(BuildContext context, width) {
    double screenWidth = MediaQuery.of(context).size.width;
    double widgetWidth = width * screenWidth;
    return widgetWidth * 9.0 / 16.0;
  }

  static double calculateHeight(BuildContext context, height) {
    double screenHeight = MediaQuery.of(context).size.height;
    double widgetHeight = height * screenHeight;
    return  widgetHeight;
  }

  static double calculateWidth(BuildContext context, width) {
    double screenWidth = MediaQuery.of(context).size.width;
    double widgetWidth = width * screenWidth;
    return  widgetWidth;
  }

  static String formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  static Future openBrowserURL({required String url, bool inApp = false}) async {
    Uri uriUrl = Uri.parse(url);
    if(await canLaunchUrl(uriUrl)){
      await launchUrl(
        uriUrl,
        mode: inApp ? LaunchMode.externalApplication : LaunchMode.inAppBrowserView
      );
    }
  }

  static Future openEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: AppConstants.avventoEmail,
      queryParameters: {
        'subject': '',
        'body': '',
      },
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not launch $emailUri';
    }
  }

  static void share(String shareBody) async {
    await Share.share(shareBody);
  }

  static void showComingSoonDialog(BuildContext context) {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: '',
        transitionDuration: const Duration(microseconds: 400),
        pageBuilder: (context,animation1, animation2) {
          return Container();
        },
        transitionBuilder: (context,a1,a2,widget) {
          return ComingSoonDialog(animation: a1,);
        });
  }

}
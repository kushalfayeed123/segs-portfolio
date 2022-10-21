import 'package:flutter/material.dart';
import 'package:segs/ui/shared/app_colors.dart';

class Projects extends StatelessWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      margin: const EdgeInsets.only(bottom: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '''Some Apps I've Built''',
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: AppColors.primary),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: AppColors.primary,
                  width: 0.05,
                )),
              )
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          card(
              context,
              '01',
              'assets/images/bestill.png',
              'Be Still',
              '''Bestill is a mobile app that helps people manage their prayer lives. You can create prayer points as an individual or as part of a group.''',
              '',
              'Flutter, Dart, Firebase, Cloud Functions, Node JS'),
          card(
              context,
              '02',
              'assets/images/247cash.png',
              '247 Cash',
              '''247 Cash is a mobile app that helps people carry out offline money transfers via the use of qr codes. Users can make money transfers to any bank in Nigeria as well as to any user on the app.''',
              '',
              'Flutter, Dart, Firebase, Node JS, Heroku')
        ],
      ),
    );
  }

  Widget card(context, String id, String image, String name, String description,
      String link, String stack) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Card(
            elevation: 0,
            color: Colors.transparent,
            child: Stack(
              children: <Widget>[
                // Stroked text as border.
                Text(
                  id,
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 1
                          ..color = AppColors.offWhite.withOpacity(0.3),
                      ),
                ),
                // Solid text as fill.
                Text(
                  id,
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                      color: Theme.of(context).scaffoldBackgroundColor),
                ),
              ],
            ),
          ),
          projectInfo(context, image, name, description, link, stack),
        ],
      ),
    );
  }

  Widget projectInfo(context, String image, String name, String description,
      String link, String stack) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: AppColors.primary.withOpacity(0.1)),
          borderRadius: BorderRadius.circular(50)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RotatedBox(
            quarterTurns: -1,
            child: Text(
              stack,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  wordSpacing: 2,
                  letterSpacing: 2,
                  color: AppColors.offWhite.withOpacity(0.3)),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
                border: Border.all(color: AppColors.offWhite.withOpacity(0.2)),
                borderRadius: BorderRadius.circular(50)),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    name,
                    textAlign: TextAlign.left,
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontFamily: 'Segoe UI'),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    description,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        wordSpacing: 2,
                        fontSize: 20,
                        color: AppColors.offWhite.withOpacity(0.5)),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      padding: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: AppColors.offWhite.withOpacity(0.3)))),
                      child: Text(
                        'Get the App',
                        textAlign: TextAlign.left,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 16),
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Icon(Icons.sports_basketball),
                    Icon(Icons.sports_basketball)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

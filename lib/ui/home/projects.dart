import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:segs/domain/core/app_data_provider.dart';
import 'package:segs/ui/shared/app_colors.dart';
import 'package:segs/ui/shared/image_loader.dart';
import 'package:segs/ui/shared/text_widget.dart';

import '../../domain/business/app_business_provider.dart';
import '../shared/app_divider.dart';

class Projects extends ConsumerWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProjects = ref.watch(userDataProvider(ref.watch(currentUserId))
        .select((value) => value.value?.projects ?? []));
    final numberPrefix = userProjects.length > 9 ? '' : '0';
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      margin: const EdgeInsets.only(bottom: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomTextWidget(
                text: 'My Projects',
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: AppColors.primary),
              ),
              const SizedBox(
                width: 20,
              ),
              const CustomDivider()
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Column(
            children: [
              for (var e in userProjects)
                card(
                    context,
                    '$numberPrefix${userProjects.indexOf(e) + 1}',
                    e.imgUrl ?? '',
                    e.title ?? '',
                    e.description ?? '',
                    e.type == 'mobile' ? e.appUrl ?? '' : e.webUrl ?? '',
                    e.stack ?? '',
                    ref)
            ],
          )
          // card(
          //     context,
          //     '01',
          //     'assets/images/247cash.png',
          //     '247 Cash',
          //     '''247 Cash is a mobile app that helps people carry out offline money transfers via the use of qr codes. Users can make money transfers to any bank in Nigeria as well as to any user on the app.''',
          //     '',
          //     'Flutter, Dart, Firebase, Node JS, Heroku'),
          // card(
          //     context,
          //     '02',
          //     'assets/images/bestill.png',
          //     'Be Still',
          //     '''Bestill is a mobile app that helps people manage their prayer lives. You can create prayer points as an individual or as part of a group.''',
          //     '',
          //     'Flutter, Dart, Firebase, Cloud Functions, Node JS'),
        ],
      ),
    );
  }

  Widget card(context, String id, String image, String name, String description,
      String link, String stack, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ResponsiveRowColumn(
        columnCrossAxisAlignment: CrossAxisAlignment.start,
        rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
        rowCrossAxisAlignment: CrossAxisAlignment.start,
        layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        children: [
          ResponsiveRowColumnItem(
            child: Card(
              elevation: 0,
              color: Colors.transparent,
              child: Stack(
                children: <Widget>[
                  // Stroked text as border.
                  CustomTextWidget(
                    text: id,
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 3
                            ..color = AppColors.primary,
                        ),
                  ),
                  // Solid text as fill.
                  CustomTextWidget(
                    text: id,
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                        color: Theme.of(context).scaffoldBackgroundColor),
                  ),
                ],
              ),
            ),
          ),
          ResponsiveRowColumnItem(
              child: projectInfo(
                  context, image, name, description, link, stack, ref)),
        ],
      ),
    );
  }

  Widget projectInfo(context, String image, String name, String description,
      String link, String stack, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      height: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
          ? MediaQuery.of(context).size.height * 0.9
          : MediaQuery.of(context).size.height * 0.8,
      width: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
          ? MediaQuery.of(context).size.width * 0.95
          : MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: AppColors.primary.withOpacity(0.1)),
          borderRadius: BorderRadius.circular(50)),
      child: ResponsiveRowColumn(
        rowMainAxisAlignment: MainAxisAlignment.spaceEvenly,
        layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        children: [
          ResponsiveRowColumnItem(child: verticalSpacer(context)),
          ResponsiveRowColumnItem(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: RotatedBox(
                quarterTurns:
                    ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                        ? 0
                        : -1,
                child: CustomTextWidget(
                  text: stack,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        wordSpacing: 2,
                        letterSpacing: 2,
                      ),
                ),
              ),
            ),
          ),
          ResponsiveRowColumnItem(child: verticalSpacer(context)),
          ResponsiveRowColumnItem(
            child: InkWell(
              hoverColor: Colors.transparent,
              onTap: () => ref.watch(openLink(link)),
              child: Container(
                  height: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                      ? MediaQuery.of(context).size.height * 0.5
                      : MediaQuery.of(context).size.height * 0.7,
                  width: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                      ? MediaQuery.of(context).size.width * 0.7
                      : MediaQuery.of(context).size.width * 0.25,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: AppColors.offWhite.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: ImageLoader(
                    color: AppColors.primary.withOpacity(0.7),
                    image: image,
                    height: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                        ? MediaQuery.of(context).size.height * 0.5
                        : MediaQuery.of(context).size.height * 0.7,
                    width: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                        ? MediaQuery.of(context).size.width * 0.7
                        : MediaQuery.of(context).size.width * 0.25,
                    radius: 50,
                  )),
            ),
          ),
          ResponsiveRowColumnItem(
            child: Container(
              width: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                  ? MediaQuery.of(context).size.width * 0.75
                  : MediaQuery.of(context).size.width * 0.3,
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: CustomTextWidget(
                      text: name,
                      textAlign: TextAlign.left,
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(fontSize: 60),
                    ),
                  ),
                  ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                      ? const SizedBox.shrink()
                      : Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          margin: const EdgeInsets.only(bottom: 20),
                          child: CustomTextWidget(
                            text: description,
                            textAlign: TextAlign.left,
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      wordSpacing: 2,
                                      fontSize: 20,
                                    ),
                          ),
                        ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        hoverColor: Colors.transparent,
                        onTap: () => ref.watch(openLink(link)),
                        child: Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            padding: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: AppColors.offWhite
                                            .withOpacity(0.4)))),
                            child: CustomTextWidget(
                              text: 'View App',
                              textAlign: TextAlign.left,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: 16,
                                  ),
                            )),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.sports_basketball,
                            color: AppColors.offWhite2,
                          ),
                          Icon(
                            Icons.sports_basketball,
                            color: AppColors.offWhite2,
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget verticalSpacer(context) {
    if (ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)) {
      return const SizedBox(
        height: 20,
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

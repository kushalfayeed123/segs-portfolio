import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:segs/domain/business/app_business_provider.dart';
import 'package:segs/domain/core/app_data_provider.dart';
import 'package:segs/ui/shared/app_colors.dart';
import 'package:segs/ui/shared/app_divider.dart';
import 'package:segs/ui/shared/image_loader.dart';
import 'package:segs/ui/shared/text_widget.dart';
import 'package:show_up_animation/show_up_animation.dart';

class About extends ConsumerStatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  AboutState createState() => AboutState();
}

class AboutState extends ConsumerState<About>
    with SingleTickerProviderStateMixin {
  late double _imageScale;
  late AnimationController _imageController;

  @override
  void initState() {
    super.initState();
    _imageController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _imageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _imageScale = 1 + _imageController.value;

    final isHoverActive = ref.watch(hoverActive);
    final userId = ref.watch(currentUserId);
    final description = ref.watch(userDataProvider(userId)
        .select((value) => value.value?.description ?? ''));
    final image = ref.watch(
        userDataProvider(userId).select((value) => value.value?.imgUrl ?? ''));
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      margin: const EdgeInsets.only(bottom: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomTextWidget(
                text: 'About Me',
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
            height: 20,
          ),
          ResponsiveRowColumn(
            rowSpacing: MediaQuery.of(context).size.width * 0.09,
            columnSpacing: MediaQuery.of(context).size.height * 0.05,
            columnCrossAxisAlignment: CrossAxisAlignment.start,
            rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
            layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                ? ResponsiveRowColumnType.COLUMN
                : ResponsiveRowColumnType.ROW,
            children: [
              ResponsiveRowColumnItem(
                child: SizedBox(
                  width: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                      ? MediaQuery.of(context).size.width
                      : MediaQuery.of(context).size.width * 0.40,
                  height: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                      ? MediaQuery.of(context).size.height * 0.7
                      : MediaQuery.of(context).size.height * 0.9,
                  child: CustomTextWidget(
                    text: description,
                    textAlign:
                        ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                            ? TextAlign.justify
                            : TextAlign.left,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          wordSpacing: 2,
                          fontSize: 20,
                        ),
                  ),
                ),
              ),
              ResponsiveRowColumnItem(
                child: ShowUpAnimation(
                  delayStart: const Duration(seconds: 1),
                  animationDuration: const Duration(seconds: 2),
                  curve: Curves.bounceIn,
                  direction: Direction.vertical,
                  child: InkWell(
                    hoverColor: Colors.transparent,
                    onHover: (value) {
                      if (value) {
                        _imageController.forward();
                      } else {
                        _imageController.reverse();
                      }
                      ref.watch(hoverActive.state).state = value;
                    },
                    onTap: () {},
                    child: Transform.scale(
                      scale: _imageScale,
                      child: SizedBox(
                        width:
                            ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                                ? MediaQuery.of(context).size.width * 0.9
                                : MediaQuery.of(context).size.width * 0.25,
                        height:
                            ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                                ? MediaQuery.of(context).size.height * 0.5
                                : MediaQuery.of(context).size.height * 0.9,
                        child: Stack(
                          children: [
                            Positioned(
                                top: 20,
                                left: 20,
                                child: Card(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  elevation: 1,
                                  child: Container(
                                    width: ResponsiveWrapper.of(context)
                                            .isSmallerThan(DESKTOP)
                                        ? MediaQuery.of(context).size.width *
                                            0.72
                                        : MediaQuery.of(context).size.width *
                                            0.2,
                                    height: ResponsiveWrapper.of(context)
                                            .isSmallerThan(DESKTOP)
                                        ? MediaQuery.of(context).size.height *
                                            0.45
                                        : MediaQuery.of(context).size.height *
                                            0.55,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: AppColors.primary,
                                        ),
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                )),
                            Card(
                              elevation: 3,
                              color: AppColors.primary,
                              child: Container(
                                width: ResponsiveWrapper.of(context)
                                        .isSmallerThan(DESKTOP)
                                    ? MediaQuery.of(context).size.width * 0.72
                                    : MediaQuery.of(context).size.width * 0.2,
                                height: ResponsiveWrapper.of(context)
                                        .isSmallerThan(DESKTOP)
                                    ? MediaQuery.of(context).size.height * 0.45
                                    : MediaQuery.of(context).size.height * 0.55,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: ImageLoader(
                                  image: image,
                                  color: isHoverActive
                                      ? AppColors.primary.withOpacity(1)
                                      : AppColors.primary.withOpacity(0.7),
                                  width: ResponsiveWrapper.of(context)
                                          .isSmallerThan(DESKTOP)
                                      ? MediaQuery.of(context).size.width * 0.72
                                      : MediaQuery.of(context).size.width * 0.2,
                                  height: ResponsiveWrapper.of(context)
                                          .isSmallerThan(DESKTOP)
                                      ? MediaQuery.of(context).size.height *
                                          0.45
                                      : MediaQuery.of(context).size.height *
                                          0.55,
                                  radius: 5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

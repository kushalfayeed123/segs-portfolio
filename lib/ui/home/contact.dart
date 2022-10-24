import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../shared/app_colors.dart';
import '../shared/app_divider.dart';
import '../shared/text_widget.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      margin: const EdgeInsets.only(bottom: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextWidget(
                text: 'Get In Touch',
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
              SizedBox(
                width: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                    ? MediaQuery.of(context).size.width * 0.95
                    : MediaQuery.of(context).size.width * 0.5,
                child: CustomTextWidget(
                  text:
                      'Thanks for taking the time to browse through my portfolio, Although I am currently engaged with a few projects, I am still open to taking up new projects. So if you have an idea you want to build or looking to add to your creative team, please do get in touch.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: AppColors.offWhite,
                        fontSize: 30,
                      ),
                ),
              ),
              Container(
                width: 120,
                height: 50,
                margin: const EdgeInsets.symmetric(vertical: 40),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primary),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: CustomTextWidget(
                    text: 'Say Hello',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: AppColors.primary),
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

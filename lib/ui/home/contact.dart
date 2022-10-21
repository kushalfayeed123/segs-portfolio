import 'package:flutter/material.dart';

import '../shared/app_colors.dart';

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
              Text(
                '''Get In Touch''',
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
          Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  'Thanks for taking the time to look at my portfolio, I am currently in the market for a new opportunity. if you think we might be a good fit please do not hesitate to get in touch.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: AppColors.offWhite.withOpacity(0.3),
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
                  child: Text(
                    'Say Hello',
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

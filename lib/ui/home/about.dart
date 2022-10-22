import 'package:flutter/material.dart';
import 'package:segs/ui/shared/app_colors.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      margin: const EdgeInsets.only(bottom: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'About Me',
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
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                height: MediaQuery.of(context).size.height * 0.9,
                child: Text(
                  '''
Hello! My name is Segun and I enjoy building great applications. 

I started building web applications five years ago
when I had the opportunity to intern in a growing technology firm and since then, I have had the opportunity to collaborate with so many intelligent and experienced developers while working on some amazing applications.

Over the years, I have worked with a number of technologies such as: angular, react and vue js for the front-end, .Net and Node Js for the back-end and for data storage, I have worked with MSSQL, MYSQL, MongoDB and Firebase.

I recently started working with flutter which is a framework used to build natively compiled, multi-platform applications. This has allowed me build great mobile and web applications. I have also been able to publish a few of these applications to the app store and play store.
                  ''',
                  softWrap: true,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      wordSpacing: 2,
                      fontSize: 20,
                      color: AppColors.offWhite.withOpacity(0.5)),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                height: MediaQuery.of(context).size.height * 0.9,
                child: Stack(
                  children: [
                    Positioned(
                        top: 20,
                        left: 20,
                        child: Card(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          elevation: 1,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.25,
                            height: MediaQuery.of(context).size.height * 0.55,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.primary.withOpacity(0.2),
                                ),
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        )),
                    Card(
                      elevation: 3,
                      color: Colors.purple,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.height * 0.55,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: const DecorationImage(
                                fit: BoxFit.fitHeight,
                                image: AssetImage('assets/images/me.png'))),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

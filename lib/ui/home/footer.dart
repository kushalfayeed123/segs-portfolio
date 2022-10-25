import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../domain/business/app_business_provider.dart';
import '../../domain/core/app_data_provider.dart';
import '../shared/app_colors.dart';

class Footer extends ConsumerWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = ref.watch(currentUserId);
    final twitterUrl = ref
        .watch(userDataProvider(id).select((value) => value.value?.twitterUrl));
    final instagramUrl = ref.watch(
        userDataProvider(id).select((value) => value.value?.instagramUrl));
    final linkedInUrl = ref.watch(
        userDataProvider(id).select((value) => value.value?.linkedInUrl));
    final gitHubUrl = ref
        .watch(userDataProvider(id).select((value) => value.value?.gitHubUrl));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Text(
                    'Built with',
                    style: Theme.of(context).textTheme.bodyText2!,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2),
                  child: FaIcon(
                    FontAwesomeIcons.heart,
                    color: Colors.red,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Text(
                    'by Segun Ajanaku',
                    style: Theme.of(context).textTheme.bodyText2!,
                  ),
                ),
              ],
            ),
          ),
        ),
        ResponsiveVisibility(
            visible: false,
            visibleWhen: const [
              Condition.smallerThan(name: DESKTOP),
            ],
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () => ref.watch(openLink(twitterUrl ?? '')),
                  hoverColor: Colors.transparent,
                  child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: FaIcon(
                        FontAwesomeIcons.twitter,
                        color: AppColors.offWhite2,
                        size: 20,
                      )),
                ),
                InkWell(
                  onTap: () => ref.watch(openLink(instagramUrl ?? '')),
                  hoverColor: Colors.transparent,
                  child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: FaIcon(
                        FontAwesomeIcons.instagram,
                        color: AppColors.offWhite2,
                        size: 20,
                      )),
                ),
                InkWell(
                  onTap: () => ref.watch(openLink(linkedInUrl ?? '')),
                  child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: FaIcon(
                        FontAwesomeIcons.linkedinIn,
                        color: AppColors.offWhite2,
                        size: 20,
                      )),
                ),
                InkWell(
                  onTap: () => ref.watch(openLink(gitHubUrl ?? '')),
                  child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: FaIcon(
                        FontAwesomeIcons.github,
                        color: AppColors.offWhite2,
                        size: 20,
                      )),
                ),
              ],
            ))
      ],
    );
  }
}

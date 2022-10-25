import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:segs/domain/business/app_business_provider.dart';
import 'package:segs/domain/core/app_data_provider.dart';

import '../shared/app_colors.dart';

class LeftColumn extends ConsumerStatefulWidget {
  const LeftColumn({Key? key}) : super(key: key);

  @override
  LeftColumnState createState() => LeftColumnState();
}

class LeftColumnState extends ConsumerState<LeftColumn>
    with TickerProviderStateMixin {
  late double _twitterScale;
  late double _instagramScale;
  late double _linkedInScale;
  late double _githubScale;
  late AnimationController _twitterController;
  late AnimationController _instagramController;
  late AnimationController _linkedinController;
  late AnimationController _githubController;

  @override
  void initState() {
    super.initState();

    _twitterController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    _instagramController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    _linkedinController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    _githubController = AnimationController(
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
    _twitterController.dispose();
    _instagramController.dispose();
    _linkedinController.dispose();
    _githubController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _twitterScale = 1 + _twitterController.value;
    _instagramScale = 1 + _instagramController.value;
    _linkedInScale = 1 + _linkedinController.value;
    _githubScale = 1 + _githubController.value;
    final id = ref.watch(currentUserId);
    final twitterUrl = ref
        .watch(userDataProvider(id).select((value) => value.value?.twitterUrl));
    final instagramUrl = ref.watch(
        userDataProvider(id).select((value) => value.value?.instagramUrl));
    final linkedInUrl = ref.watch(
        userDataProvider(id).select((value) => value.value?.linkedInUrl));
    final gitHubUrl = ref
        .watch(userDataProvider(id).select((value) => value.value?.gitHubUrl));
    final isTwitterActive = ref.watch(twitterActive);
    final isInstagramActive = ref.watch(instagramActive);
    final isLinkedInActive = ref.watch(linkedInActive);
    final isgithubActive = ref.watch(githubActive);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () => ref.watch(openLink(twitterUrl ?? '')),
          hoverColor: Colors.transparent,
          onHover: (value) {
            if (value) {
              _twitterController.forward();
            } else {
              _twitterController.reverse();
            }
            ref.watch(twitterActive.state).state = value;
          },
          child: Transform.scale(
            scale: _twitterScale,
            child: Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: FaIcon(
                  FontAwesomeIcons.twitter,
                  color:
                      isTwitterActive ? AppColors.primary : AppColors.offWhite2,
                  size: 20,
                )),
          ),
        ),
        InkWell(
          onTap: () => ref.watch(openLink(instagramUrl ?? '')),
          hoverColor: Colors.transparent,
          onHover: (value) {
            if (value) {
              _instagramController.forward();
            } else {
              _instagramController.reverse();
            }
            ref.watch(instagramActive.state).state = value;
          },
          child: Transform.scale(
            scale: _instagramScale,
            child: Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: FaIcon(
                  FontAwesomeIcons.instagram,
                  color: isInstagramActive
                      ? AppColors.primary
                      : AppColors.offWhite2,
                  size: 20,
                )),
          ),
        ),
        InkWell(
          onTap: () => ref.watch(openLink(linkedInUrl ?? '')),
          hoverColor: Colors.transparent,
          onHover: (value) {
            if (value) {
              _linkedinController.forward();
            } else {
              _linkedinController.reverse();
            }
            ref.watch(linkedInActive.state).state = value;
          },
          child: Transform.scale(
            scale: _linkedInScale,
            child: Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: FaIcon(
                  FontAwesomeIcons.linkedinIn,
                  color: isLinkedInActive
                      ? AppColors.primary
                      : AppColors.offWhite2,
                  size: 20,
                )),
          ),
        ),
        InkWell(
          onTap: () => ref.watch(openLink(gitHubUrl ?? '')),
          hoverColor: Colors.transparent,
          onHover: (value) {
            if (value) {
              _githubController.forward();
            } else {
              _githubController.reverse();
            }
            ref.watch(githubActive.state).state = value;
          },
          child: Transform.scale(
            scale: _githubScale,
            child: Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: FaIcon(
                  FontAwesomeIcons.github,
                  color:
                      isgithubActive ? AppColors.primary : AppColors.offWhite2,
                  size: 20,
                )),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.15,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.offWhite2, width: 0.2)),
        ),
      ],
    );
  }
}

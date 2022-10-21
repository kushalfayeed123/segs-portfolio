import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../shared/app_colors.dart';

class LeftColumn extends StatefulWidget {
  const LeftColumn({Key? key}) : super(key: key);

  @override
  State<LeftColumn> createState() => _LeftColumnState();
}

class _LeftColumnState extends State<LeftColumn> with TickerProviderStateMixin {
  Color twitterColor = AppColors.offWhite.withOpacity(0.4);
  Color instagramColor = AppColors.offWhite.withOpacity(0.4);
  Color linkedinColor = AppColors.offWhite.withOpacity(0.4);
  Color gitHubColor = AppColors.offWhite.withOpacity(0.4);
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {},
          hoverColor: Colors.transparent,
          onHover: (value) {
            if (value) {
              twitterColor = AppColors.primary;
              _twitterController.forward();
            } else {
              twitterColor = AppColors.offWhite.withOpacity(0.4);
              _twitterController.reverse();
            }
            setState(() {});
          },
          child: Transform.scale(
            scale: _twitterScale,
            child: Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: FaIcon(
                  FontAwesomeIcons.twitter,
                  color: twitterColor,
                  size: 20,
                )),
          ),
        ),
        InkWell(
          onTap: () {},
          hoverColor: Colors.transparent,
          onHover: (value) {
            if (value) {
              instagramColor = AppColors.primary;
              _instagramController.forward();
            } else {
              instagramColor = AppColors.offWhite.withOpacity(0.4);
              _instagramController.reverse();
            }
            setState(() {});
          },
          child: Transform.scale(
            scale: _instagramScale,
            child: Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: FaIcon(
                  FontAwesomeIcons.instagram,
                  color: instagramColor,
                  size: 20,
                )),
          ),
        ),
        InkWell(
          onTap: () {},
          hoverColor: Colors.transparent,
          onHover: (value) {
            if (value) {
              linkedinColor = AppColors.primary;
              _linkedinController.forward();
            } else {
              linkedinColor = AppColors.offWhite.withOpacity(0.4);
              _linkedinController.reverse();
            }
            setState(() {});
          },
          child: Transform.scale(
            scale: _linkedInScale,
            child: Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: FaIcon(
                  FontAwesomeIcons.linkedinIn,
                  color: linkedinColor,
                  size: 20,
                )),
          ),
        ),
        InkWell(
          onTap: () {},
          hoverColor: Colors.transparent,
          onHover: (value) {
            if (value) {
              gitHubColor = AppColors.primary;
              _githubController.forward();
            } else {
              gitHubColor = AppColors.offWhite.withOpacity(0.4);
              _githubController.reverse();
            }
            setState(() {});
          },
          child: Transform.scale(
            scale: _githubScale,
            child: Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: FaIcon(
                  FontAwesomeIcons.github,
                  color: gitHubColor,
                  size: 20,
                )),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.15,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.offWhite, width: 0.2)),
        ),
      ],
    );
  }
}

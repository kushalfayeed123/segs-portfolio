import 'package:flutter/material.dart';
import 'package:segs/ui/home/about.dart';
import 'package:segs/ui/home/contact.dart';
import 'package:segs/ui/home/footer.dart';
import 'package:segs/ui/home/hero.dart';
import 'package:segs/ui/home/projects.dart';

class CenterInfoColumn extends StatelessWidget {
  const CenterInfoColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          CustomHero(),
          About(),
          Projects(),
          Contact(),
          Footer()
        ],
      ),
    );
  }
}

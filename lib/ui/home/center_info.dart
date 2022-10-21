import 'package:flutter/material.dart';
import 'package:segs/ui/home/about.dart';
import 'package:segs/ui/home/contact.dart';
import 'package:segs/ui/home/footer.dart';
import 'package:segs/ui/home/hero.dart';
import 'package:segs/ui/home/projects.dart';

class CenterInfoColumn extends StatefulWidget {
  final int currentPosition;

  const CenterInfoColumn({Key? key, required this.currentPosition})
      : super(key: key);

  @override
  State<CenterInfoColumn> createState() => _CenterInfoColumnState();
}

class _CenterInfoColumnState extends State<CenterInfoColumn> {
  ScrollController scrollController = ScrollController();
  var containerKey = GlobalKey();
  var container2Key = GlobalKey();
  var container3Key = GlobalKey();
  var container4Key = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.delayed(const Duration(milliseconds: 100), () {
      switch (widget.currentPosition) {
        case 1:
          Scrollable.ensureVisible(
            containerKey.currentContext!,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
          );
          break;
        case 2:
          Scrollable.ensureVisible(
            container2Key.currentContext!,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
          );
          break;
        case 3:
          Scrollable.ensureVisible(
            container3Key.currentContext!,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
          );
          break;
        case 4:
          Scrollable.ensureVisible(
            container4Key.currentContext!,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
          );
          break;
        default:
          Scrollable.ensureVisible(
            containerKey.currentContext!,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
          );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomHero(
            key: containerKey,
          ),
          About(
            key: container2Key,
          ),
          Projects(
            key: container3Key,
          ),
          Contact(
            key: container4Key,
          ),
          const Footer()
        ],
      ),
    );
  }
}

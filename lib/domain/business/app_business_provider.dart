import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

final activeHomeWidget = StateProvider<int>(((ref) => 1));
final activeMenuWidget = StateProvider<int>(((ref) => 0));
final showLoader = StateProvider<bool>(((ref) => true));
final hoverActive = StateProvider<bool>(((ref) => false));
final twitterActive = StateProvider<bool>(((ref) => false));
final linkedInActive = StateProvider<bool>(((ref) => false));
final instagramActive = StateProvider<bool>(((ref) => false));
final githubActive = StateProvider<bool>(((ref) => false));
final emailActive = StateProvider<bool>(((ref) => false));
final currentUserId = StateProvider<String>(((ref) => '7ovTA1XwXTmbEc3guCKC'));
final openLink = Provider.family((ref, String url) {
  launchURL(url);
});
final launchMail = Provider.family((ref, String email) {
  launchEmail(email);
});

void launchURL(String url) async {
  try {
    final newUrl = Uri.parse(url);
    if (await canLaunchUrl(newUrl)) {
      await launchUrl(newUrl);
    } else {
      throw 'Could not launch $newUrl';
    }
  } catch (e) {
    throw e.toString();
  }
}

void launchEmail(String email) async {
  try {
    final mail = 'mailto:$email';
    if (await canLaunchUrlString(mail)) {
      await launchUrlString(mail);
    } else {
      throw 'Could not launch $mail';
    }
  } catch (e) {
    throw e.toString();
  }
}

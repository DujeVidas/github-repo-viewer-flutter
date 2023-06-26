// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  static void launchRepoUrl(BuildContext context, String repoUrl) async {
    final Uri parsedRepoUrl = Uri.parse(repoUrl);
    if (await canLaunchUrl(parsedRepoUrl)) {
      await launchUrl(parsedRepoUrl);
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Failed to launch repository URL.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    }
  }

  static void launchUserUrl(BuildContext context, String userName) async {
    final Uri userUrl = Uri.parse('https://github.com/$userName');
    if (await canLaunchUrl(userUrl)) {
      await launchUrl(userUrl);
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Failed to launch user URL.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    }
  }
}

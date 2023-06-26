import 'package:flutter/material.dart';

import 'search_repos.dart';
import 'user_card.dart';
import 'repo_carousel.dart';
import 'url_launcher.dart';
import 'search_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GitHub Repo Search',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> _repos = [];
  String _userAvatarUrl = '';
  String _userName = '';

  void _updateUserRepos(Map<String, dynamic> result) {
    setState(() {
      _userAvatarUrl = result['userAvatarUrl'];
      _userName = result['userName'];
      _repos = result['repos'];
    });
  }

  void _launchRepoUrl(String repoUrl) async {
    UrlLauncher.launchRepoUrl(context, repoUrl);
  }

  void _launchUserUrl() async {
    UrlLauncher.launchUserUrl(context, _searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GitHub Repo Search'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (_repos.isNotEmpty)
            UserCard(
              avatarUrl: _userAvatarUrl,
              userName: _userName,
              onTap: _launchUserUrl,
            ),
          SearchRepos(controller: _searchController),
          SearchButton(
            controller: _searchController,
            onSearchPressed: _updateUserRepos,
          ),
          Expanded(
            child: RepoCarousel(
              repos: _repos,
              onRepoTap: _launchRepoUrl,
            ),
          ),
        ],
      ),
    );
  }
}

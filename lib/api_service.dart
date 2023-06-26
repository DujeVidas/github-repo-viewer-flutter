import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<Map<String, dynamic>> fetchUserRepos(String username) async {
    final String url = 'https://api.github.com/users/$username/repos';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final userData =
          await http.get(Uri.parse('https://api.github.com/users/$username'));
      if (userData.statusCode == 200) {
        final userJson = json.decode(userData.body);
        final userAvatarUrl = userJson['avatar_url'];
        final userName = userJson['name'];
        final repos = json.decode(response.body);
        return {
          'userAvatarUrl': userAvatarUrl,
          'userName': userName,
          'repos': repos,
        };
      }
    }

    throw Exception('Failed to fetch user repositories.');
  }
}



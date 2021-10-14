import 'dart:convert';

import 'package:git_search_app/models/models.dart';
import 'package:git_search_app/utils/env.dart';
import 'package:http/http.dart' as http;

class GitProvider {
  Future<List<GitCard>> getRepos(searchKey) async {
    var urlString;

    final queryParameters = {
      'q': searchKey,
    };

    urlString = Uri.https(url, '/search/repositories', queryParameters);

    final responseGit = await http.get(urlString);

    if (responseGit.statusCode == 200) {
      final List<dynamic> gitJson = json.decode(responseGit.body)['items'];

      return gitJson.map((json) => GitCard.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching users');
    }
  }
}

import 'package:git_search_app/models/models.dart';
import 'package:git_search_app/services/api_provider.dart';

class GitRepository {
  final GitProvider _gitProvider = GitProvider();
  Future<List<GitCard>> getAllGits(searchKey) {
    // ignore: avoid_print
    print(_gitProvider.getRepos(searchKey));
    return _gitProvider.getRepos(searchKey);
  }
}
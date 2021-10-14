import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_search_app/blocs/git/git_event.dart';
import 'package:git_search_app/blocs/git/git_state.dart';
import 'package:git_search_app/models/models.dart';
import 'package:git_search_app/services/api_repository.dart';


class GitBloc extends Bloc<GitEvent, GitState> {
  final GitRepository gitRepository;

  GitBloc(this.gitRepository)
      : super(GitLoadingState());

  GitState get initialState => GitLoadingState();

  @override
  Stream<GitState> mapEventToState(GitEvent event) async* {
    if (event is GitLoadEvent) {
      yield GitLoadingState();
      try {
        final List<GitCard> _loadedReposList =
        await gitRepository.getAllGits(event.searchKey);

        yield GitLoadedState(
          loadedRepos: _loadedReposList,
        );
      } catch (_) {
        yield GitErrorState();
      }
    }
  }
}

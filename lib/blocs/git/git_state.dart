abstract class GitState {}

class GitLoadingState extends GitState {}

class GitLoadedState extends GitState {
  List<dynamic> loadedRepos;

  GitLoadedState({
    required this.loadedRepos,
  });
}

class GitErrorState extends GitState {}

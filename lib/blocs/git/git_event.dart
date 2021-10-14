abstract class GitEvent {}

class GitLoadEvent extends GitEvent {
  final dynamic searchKey;

  GitLoadEvent(this.searchKey);
}

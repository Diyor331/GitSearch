class GitCard {
  dynamic id;
  dynamic node_id;
  dynamic name;
  dynamic full_name;
  dynamic private;
  dynamic owner;
  dynamic watchers_count;
  dynamic stargazers_count;
  dynamic html_url;

  GitCard({
    required this.id,
    this.node_id,
    this.name,
    this.full_name,
    this.private,
    this.owner,
    this.watchers_count,
    this.stargazers_count,
    this.html_url,
  });

  factory GitCard.fromJson(Map<String, dynamic> json) {
    return GitCard(
      id: json['id'],
      node_id: json['node_id'],
      name: json['name'],
      full_name: json['full_name'],
      private: json['private'],
      owner: json['owner'],
      watchers_count: json['watchers_count'],
      stargazers_count: json['stargazers_count'],
      html_url: json['html_url'],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:git_search_app/blocs/blocs.dart';
import 'package:git_search_app/ui/screens/screens.dart';

class ResultPage extends StatefulWidget {
  static const routeName = 'resultPage';

  // ignore: prefer_typing_uninitialized_variables
  final searchKey;

  const ResultPage({Key? key, this.searchKey}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  void initState() {
    // ignore: close_sinks
    final GitBloc gitBloc = BlocProvider.of<GitBloc>(context);
    gitBloc.add(GitLoadEvent(widget.searchKey.text));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Репозитории Git'),
      ),
      body: BlocBuilder<GitBloc, GitState>(
        builder: (context, state) {
          if (state is GitLoadedState) {
            return SafeArea(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: state.loadedRepos.isEmpty
                    ? const Center(
                        child:
                            Text('Упс, по вашему запросу ничего не найдено!'))
                    : ListView.builder(
                        itemCount: state.loadedRepos.length,
                        itemBuilder: (BuildContext ctx, int index) {
                          var item = state.loadedRepos[index];
                          return Card(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    leading:
                                        const FaIcon(FontAwesomeIcons.github),
                                    title: Text(
                                      'Имя проекта:${item.name}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            'Автор:${item.owner['login']}'),
                                        Text(
                                            'Просмотров:${item.watchers_count}'),
                                        Text(
                                            'Кол-во звезд:${item.stargazers_count}'),
                                      ],
                                    ),
                                    trailing: IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                RepoDetail(
                                              url: state
                                                  .loadedRepos[index].html_url,
                                            ),
                                          ),
                                        );
                                      },
                                      icon: const Icon(
                                          Icons.arrow_forward_ios_outlined),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            );
          }
          if (state is GitLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          return const Center(
              child: Text("Ошибка загрузки,проверьте интернет"));
        },
      ),
    );
  }
}

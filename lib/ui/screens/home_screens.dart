import 'package:flutter/material.dart';
import 'package:git_search_app/ui/screens/result_screens.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _searchKey = GlobalKey<FormState>();
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _searchKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Заполните поле';
                    } else if (val.length < 3) {
                      return 'Недостаточно символов';
                    }
                    return null;
                  },
                  controller: _searchController,
                  autofocus: true,
                  decoration: const InputDecoration(
                    labelText: 'Поиск',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 13),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 35,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_searchKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => ResultPage(
                              searchKey: _searchController,
                            ),
                          ),
                        );
                      }
                    },
                    child: const Text('Поиск'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

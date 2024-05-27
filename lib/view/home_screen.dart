import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userPreferenece = Provider.of<UserViewModel>(context);
    return Scaffold(
        backgroundColor: Colors.yellow,
        body: InkWell(
            onTap: () {
              userPreferenece.remove().then(
                  (value) => {Navigator.pushNamed(context, RoutesName.login)});
            },
            child: Center(child: Text("home logOut"))));
  }
}

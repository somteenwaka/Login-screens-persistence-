import 'package:db_assignment/models/user.dart';
import 'package:flutter/material.dart';

class UserDetailPage extends StatelessWidget {
  const UserDetailPage({Key? key, required this.users}) : super(key: key);
  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (BuildContext context, int index) {
            User user = users[index];
            return _singleListItem(context, user);
          }),
    );
  }

  Widget _singleListItem(BuildContext context, User user) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Image.asset(
          "images/profile.jpg",
          fit: BoxFit.cover,
          width: 100,
          height: 120,
        ),
      ),
      subtitle: Text(user.email),
      title: Text("${user.firstName} ${user.lastName}"),
    );
  }
}

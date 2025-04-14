import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tutorial_app/bloc/user/user_bloc.dart';
import 'package:tutorial_app/bloc/user/user_state.dart';
import 'package:tutorial_app/models/user.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Usuarios')),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return state.when(
            initial: () => Center(child: CircularProgressIndicator()),
            loading: () => Center(child: CircularProgressIndicator()),
            loaded:
                (users) => ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (_, index) {
                    User user = users[index];
                    return ListTile(
                      title: Text(user.name),
                      subtitle: Text(user.email),
                    );
                  },
                ),
            error: (message) => Center(child: Text('Error: $message')),
          );
        },
      ),
    );
  }
}

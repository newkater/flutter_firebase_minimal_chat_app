import 'package:flutter/material.dart';
import 'package:flutter_firebase_minimal_chat_app/components/my_drawer.dart';
import 'package:flutter_firebase_minimal_chat_app/components/user_tile.dart';
import 'package:flutter_firebase_minimal_chat_app/pages/chat_page.dart';
import 'package:flutter_firebase_minimal_chat_app/services/auth/auth_service.dart';
import 'package:flutter_firebase_minimal_chat_app/services/chat/chat_service.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      drawer: MyDrawer(),
      body: _buildUserList(),
    );
  }

  // build a list of users apart from the current user
  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUsersStream(), 
      builder: (context, snapshot) {
        // error
        if (snapshot.hasError) {
          return const Text("Error");
        }

        // loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading..");
        }

        // return list view
        return ListView(
          children: snapshot.data!
          .map<Widget>((userData) => _buildUserListItem(userData, context))
          .toList(),
        );
      },
    );
  }

  // build individual list tile for user'
  Widget _buildUserListItem(Map<String, dynamic> userData, BuildContext context) {
    // display all users except for the current user
    return UserTile(
      text: userData["email"],
      onTap: () {
        // tap on user --> go to chat page
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => ChatPage(receiverEmail: userData["email"],),
          )
        );
      },
    );
  }
}
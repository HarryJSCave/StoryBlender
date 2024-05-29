import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import  '../API/api_controler.dart';

class TestWorkspaceView extends StatelessWidget {
  const TestWorkspaceView({super.key});

  static const routeName = '/test_workspace';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChatProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Test Work Space'),
        ),
        body: ChatScreen(),
      ),
    );
  }
}

class ChatScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context);

    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: chatProvider.messages.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(chatProvider.messages[index]),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: 'Enter message',
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {
                  chatProvider.sendMessage(_controller.text);
                  _controller.clear();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}


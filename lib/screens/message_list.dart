import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterql/model/message.dart';

class MessageListScreen extends StatefulWidget {
  final String title;
  MessageListScreen({required this.title});

  @override
  State<MessageListScreen> createState() => _MessageListScreenState();
}

class _MessageListScreenState extends State<MessageListScreen> {
  var messages = const [];

  @override
  void initState() {
    super.initState();
    fetchMessage();
  }

  Future fetchMessage() async {
    String data = await rootBundle.loadString('data/message.json');
    List decodedResponse = json.decode(data);
    List<Message> _messages = decodedResponse
        .map(
          (json) => Message.fromJson(json),
        )
        .toList();
    setState(() {
      messages = _messages;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          Message message = messages[index];
          return ListTile(
            title: Text(message.subject),
            subtitle: Text(
              message.body,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            leading: CircleAvatar(
              child: Image.network(
                message.profileImage,
                fit: BoxFit.cover,
              ),
            ),
            onTap: () {},
            isThreeLine: true,
          );
        },
        itemCount: messages.length,
      ),
    );
  }
}

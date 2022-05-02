import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    var data = await rootBundle.loadString('data/message.json');
    var decodedResponse = json.decode(data);
    setState(() {
      messages = decodedResponse;
    });
    print(data);
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
          return ListTile(
            title: Text('${messages[index]['subject']}'),
            subtitle: Text(
              '${messages[index]['body']}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            leading: CircleAvatar(
              child: Image.network('${messages[index]['profileImage']}',
                  fit: BoxFit.cover,),
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

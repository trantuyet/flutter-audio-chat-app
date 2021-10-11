import 'package:ayyo_mycheckk/config.dart';
import 'package:ayyo_mycheckk/main.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

import 'channel_page.dart';

class ChannelListPage extends StatelessWidget {
  const ChannelListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ayyo Mycheckkk'),
        actions: [
          GestureDetector(
            onTap: () async {
              await StreamChat.of(context).client.disconnectUser();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const SelectUserPage()),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text('Chọn người khác'),
              ),
            ),
          )
        ],
      ),
      body: ChannelsBloc(
        child: ChannelListView(
          emptyBuilder: (conext) {
            return Center(
              child: ElevatedButton(
                onPressed: () async {
                  final channel = StreamChat.of(context).client.channel(
                    "messaging",
                    id: "1",
                    extraData: {
                      "name": "Chat điiiiii",
                      "image":
                          "https://marketplace.canva.com/EAEgoreUJis/2/0/400w/canva-navy-minimalist-music-logo-PS6yti4cX8M.jpg",
                      "members": [firstItem.id, secondItem.id]
                    },
                  );
                  await channel.create();
                },
                child: const Text('Tạo kênh mới'),
              ),
            );
          },
          filter:
              Filter.in_('members', [StreamChat.of(context).currentUser!.id]),
          sort: const [SortOption('last_message_at')],
          pagination: const PaginationParams(limit: 30),
          channelWidget: const ChannelPage(),
        ),
      ),
    );
  }
}
import 'dart:async';

import 'package:baetobe/application/routing/router_provider.dart';
import 'package:baetobe/application/routing/routes.gr.dart';
import 'package:baetobe/domain/chat/messages_provider.dart';
import 'package:baetobe/domain/matches_provider.dart';
import 'package:baetobe/domain/user_provider.dart';
import 'package:baetobe/entities/data/match.dart';
import 'package:baetobe/entities/data/user_image.dart';
import 'package:baetobe/entities/view_models/chat_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

const connectionStateToColor = {
  connectionState.connected: Colors.green,
  connectionState.connecting: Colors.yellow,
  connectionState.connectionLost: Colors.red,
  connectionState.connectionFailed: Colors.red,
  connectionState.disconnected: Colors.red,
};

const connectionStateToText = {
  connectionState.connected: 'Connected',
  connectionState.connecting: 'Connecting',
  connectionState.connectionLost: 'Connection Lost',
  connectionState.connectionFailed: 'Connection Failed',
  connectionState.disconnected: 'Disconnected',
};

class MessagesForMatchScreen extends HookConsumerWidget {
  final Match match;
  const MessagesForMatchScreen({Key? key, required this.match})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.read(routerProvider.notifier);
    final state = ref.watch(messagesProvider(match));
    final user = ref.watch(userProvider);
    final stateNotifier = ref.read(messagesProvider(match).notifier);

    return WillPopScope(
      onWillPop: () async {
        unawaited(ref.read(matchesProvider.notifier).fetchMatches(1, true));
        return true;
      },
      child: Column(children: [
        GFListTile(
            icon: IconButton(
              icon: Icon(FontAwesomeIcons.solidTimesCircle,
                  color: Theme.of(context).primaryColor, size: 20),
              onPressed: () {
                ref.read(routerProvider.notifier).pop();
              },
            ),
            color: Colors.white,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(0),
            avatar: Hero(
              tag: match.userId,
              child: GFAvatar(
                shape: GFAvatarShape.square,
                backgroundColor: Colors.white,
                size: GFSize.LARGE,
                backgroundImage: match.profilePicture != null
                    ? CachedNetworkImageProvider(match.profilePicture!.url)
                    : Image.asset('assets/profile_placeholder.png').image,
              ),
            ),
            onTap: () {
              router.push(UserProfileScreenRoute(
                  id: match.userId,
                  name: match.userName,
                  firstPhoto: match.profilePicture ??
                      UserImage(
                          url: 'assets/profile_placeholder.png',
                          id: -1,
                          position: -1),
                  age: match.age));
            },
            title: Hero(
              tag: match.userName,
              child: Text(match.userName,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontWeight: FontWeight.w500)),
            )),
        state.connectionStateVisible
            ? Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(connectionStateToText[state.connection]!)
                        .padding(right: 5),
                    Icon(FontAwesomeIcons.solidDotCircle,
                        color: connectionStateToColor[state.connection]!,
                        size: 15)
                  ],
                ).padding(vertical: 5),
              )
            : Container(),
        Flexible(
          child: state.initialLoading
              ? Center(
                  child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor))
              : Chat(
                  theme: DefaultChatTheme(
                      primaryColor: Theme.of(context).primaryColor),
                  customBottomWidget: state.matchClosed
                      ? Container(
                          width: MediaQuery.of(context).size.width,
                          height: 0.1 * MediaQuery.of(context).size.height,
                          color: Colors.grey[300],
                          child: Center(
                              child: Text(state.closedBy == user.id
                                  ? 'you have closed this conversation'
                                  : 'the conversation is closed')))
                      : null,
                  messages: state.messages,
                  onEndReached: stateNotifier.updateMessages,
                  onSendPressed: stateNotifier.sendMessage,
                  textMessageBuilder: (
                    types.TextMessage message, {
                    required int messageWidth,
                    required bool showName,
                  }) {
                    return Consumer(
                      builder: (context, ref, child) {
                        ref.watch(messagesProvider(match).select((chatState) =>
                            chatState.messages.where((stateMessage) =>
                                stateMessage.id == message.id)));

                        return SizedBox(
                          width: 0.6 * MediaQuery.of(context).size.width,
                          child: Slidable(
                            key: ValueKey(message.id),
                            startActionPane: message.author.id ==
                                        user.id.toString() &&
                                    (message.metadata!['isDeleted'] != true) &&
                                    (state.connection ==
                                        connectionState.connected)
                                ? ActionPane(
                                    extentRatio: 1,
                                    motion: const DrawerMotion(),
                                    children: [
                                      SlidableAction(
                                        onPressed: (_) {
                                          if (message.remoteId != null) {
                                            ref
                                                .read(messagesProvider(match)
                                                    .notifier)
                                                .deleteMessage(
                                                    message.remoteId!);
                                          }
                                        },
                                        backgroundColor:
                                            const Color(0xFFFE4A49),
                                        foregroundColor: Colors.white,
                                        icon: Icons.delete,
                                      ),
                                    ],
                                  )
                                : null,
                            child: TextMessage(
                                    emojiEnlargementBehavior:
                                        EmojiEnlargementBehavior.multi,
                                    hideBackgroundOnEmojiMessages: true,
                                    message: message,
                                    showName: showName,
                                    usePreviewData: true)
                                .opacity(message.metadata!['isDeleted'] == true
                                    ? 0.5
                                    : 1),
                          ),
                        );
                      },
                    );
                  },
                  user:
                      types.User(id: user.id.toString(), firstName: user.name),
                ),
        )
      ]),
    );
  }
}

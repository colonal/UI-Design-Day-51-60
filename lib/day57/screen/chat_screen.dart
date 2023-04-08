import 'package:flutter/material.dart';
import 'package:ui_design_day_51_60/day57/data/data.dart';
import 'package:ui_design_day_51_60/day57/widget/background_widget.dart';


class ChatScreen extends StatelessWidget {
  final Room room;
  const ChatScreen({required this.room, super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          Expanded(
            child: BackgroundWidget(
              child: ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                itemCount: room.messages.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
                itemBuilder: (context, index) {
                  return _buildMessag(index, size);
                },
              ),
            ),
          ),
          _buildSendBox(size),
           ],
      ),
    );
  }

  Widget _buildMessag(int index, Size size) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Stack(
          alignment:
              messages[index].me ? Alignment.bottomRight : Alignment.bottomLeft,
          children: [
            Align(
              alignment:
                  messages[index].me ? Alignment.topLeft : Alignment.topRight,
              child: Container(
                width: size.width * .79,
                alignment: Alignment.topRight,
                padding:
                    const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                decoration: BoxDecoration(
                  color: messages[index].me
                      ? const Color(0xFFA18AF5)
                      : Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(15),
                    topRight: const Radius.circular(15),
                    bottomRight: Radius.circular(messages[index].me ? 4 : 15),
                    bottomLeft: Radius.circular(messages[index].me ? 15 : 4),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _getMessageType(messages[index], size),
                    const SizedBox(height: 10),
                    _buildBottmSideMasseg(index),
                  ],
                ),
              ),
            ),
            if (_showImage(index))
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  room.messages[index].cover,
                  width: size.width * .1,
                  height: size.width * .1,
                  fit: BoxFit.cover,
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildBottmSideMasseg(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Icons.favorite,
              color: Color(0xFFFA6969),
              size: 20,
            ),
            const SizedBox(width: 7),
            Text(
              room.messages[index].like.toString(),
              style: TextStyle(
                color:
                    messages[index].me ? Colors.white : const Color(0xFFFA6969),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.visibility,
              color: Color(0xFFCCC7D1),
              size: 20,
            ),
            const SizedBox(width: 3),
            Text(
              room.messages[index].view,
              style: TextStyle(
                color:
                    messages[index].me ? Colors.white : const Color(0xFF8C8098),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              room.messages[index].time,
              style: TextStyle(
                color:
                    messages[index].me ? Colors.white : const Color(0xFF8C8098),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSendBox(Size size) {
    return Container(
      width: size.width,
      height: size.height * .1,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          const Icon(
            Icons.add,
            color: Color(0xff8C8098),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF2F1F3),
                borderRadius: BorderRadius.circular(8),
              ),
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 11,
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Color(0xFFF2F1F3)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Color(0xFFF2F1F3)),
                  ),
                  hintText: "Type something...",
                  hintStyle: const TextStyle(
                    color: Color(0xFF8C8098),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          const Icon(
            Icons.mic_none_outlined,
            color: Color(0xff8C8098),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar(context) {
    return AppBar(
      backgroundColor: const Color(0xFFFFFFFF),
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Color(0xFF8667F2),
        ),
      ),
      centerTitle: true,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            room.title,
            style: const TextStyle(
              color: Color(0xFF200E32),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.person,
                color: Color(0xFF8C8098),
                size: 12,
              ),
              SizedBox(width: 5),
              Text(
                "4",
                style: TextStyle(
                  color: Color(0xFF8C8098),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 8),
              Icon(
                Icons.visibility,
                color: Color(0xFF8C8098),
                size: 12,
              ),
              SizedBox(width: 5),
              Text(
                "2 482",
                style: TextStyle(
                  color: Color(0xFF8C8098),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              clipBehavior: Clip.antiAlias,
              child: Image.network(
                room.image,
                fit: BoxFit.cover,
                width: 40,
                height: 40,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _getMessageType(Message message, Size size) {
    switch (message.messageType) {
      case MessagesType.text:
        return Text(
          message.message,
          style: TextStyle(color: message.me ? Colors.white : Colors.black),
        );

      case MessagesType.image:
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            message.message,
            width: size.width * .79,
            fit: BoxFit.fill,
            height: 130,
          ),
        );
      default:
        return Text(message.message);
    }
  }

  bool _showImage(int index) {
    if (messages.length - 2 <= index) {
      return true;
    }

    return messages[index].id != messages[index + 1].id;
  }
}

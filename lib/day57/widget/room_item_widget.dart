import 'package:flutter/material.dart';
import 'package:ui_design_day_51_60/day57/screen/chat_screen.dart';

import '../data/data.dart';
import '../screen/room_screen.dart';

class RoomItemWidget extends StatelessWidget {
  final Room room;
  const RoomItemWidget({required this.room, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const RoomScreen(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            _buildTopSide(),
            const SizedBox(height: 14),
            _buildBottomSide(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSide(context) {
    return SizedBox(
      height: 35,
      child: Row(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                ...List.generate(
                  room.images.length < 6 ? room.images.length : 6,
                  (index) => Transform.translate(
                    offset: Offset(20.0 * index, 0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(1.5),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(room.images[index]),
                        ),
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(
                      20.0 *
                          (room.images.length < 6 ? room.images.length + 1 : 7),
                      0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Text(
                      "+ ${room.view}",
                      style: const TextStyle(
                        color: Color(0xff8C8098),
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ChatScreen(room: room),
              ));
            },
            padding: EdgeInsets.zero,
            color: const Color(0xFF8667F2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              "Join",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _buildTopSide() {
    return SizedBox(
      height: 64,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.network(
              room.image,
              fit: BoxFit.cover,
              width: 64,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          room.title,
                          style: const TextStyle(
                            color: Color(0xff200E32),
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          room.time,
                          style: const TextStyle(
                            color: Color(0xff8C8098),
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Flexible(
                  child: Text(
                    room.name,
                    style: const TextStyle(
                      color: Color(0xff200E32),
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ),
                Flexible(
                  child: Text(
                    room.lastMessage + room.lastMessage,
                    style: const TextStyle(
                      color: Color(0xff8C8098),
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shamo/models/message_mode.dart';
import 'package:shamo/pages/detail_chat.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/models/product_model.dart';

class ChatTile extends StatelessWidget {
  final MessageModel messageModel;
  ChatTile(this.messageModel);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailChatPage(
              UninitializedProductModel(),
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 33),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/image_shop_logo.png',
                  width: 54,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shoe Store',
                        style: primaryTextStyle.copyWith(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        messageModel.message,
                        style: secondaryTextStyle.copyWith(
                            fontSize: 14, fontWeight: light),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Text(
                  'Now',
                  style: secondaryTextStyle.copyWith(
                    fontSize: 10,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Divider(
              thickness: 1,
              color: Color(0xff282939),
            )
          ],
        ),
      ),
    );
  }
}

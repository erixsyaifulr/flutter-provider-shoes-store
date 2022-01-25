import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shamo/models/message_model.dart';
import 'package:shamo/models/product_model.dart';
import 'package:shamo/models/user_model.dart';

class MessageService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<List<MessageModel>> getMessagesByUserid({int userId}) {
    try {
      return firestore
          .collection('messages')
          .where('userId', isEqualTo: userId)
          .snapshots()
          .map((QuerySnapshot list) {
        var result = list.docs.map<MessageModel>((DocumentSnapshot message) {
          return MessageModel.fromJson(message.data());
        }).toList();

        result.sort(
          (MessageModel a, MessageModel b) =>
              a.createdAt.compareTo(b.createdAt),
        );
        print('result : ' + result.length.toString());
        return result;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> addMessagae(
      {UserModel user,
      bool isFromUser,
      String mesage,
      ProductModel product}) async {
    try {
      firestore.collection('messages').add({
        'userId': user.id,
        'userName': user.name,
        'userImage': user.profilPhotoUrl,
        'isFromUser': isFromUser,
        'message': mesage,
        'product': product is UninitializedProductModel ? {} : {},
        'createdAt': DateTime.now().toString(),
        'updatedAt': DateTime.now().toString(),
      }).then((value) => print('Pesan berhasil dikirim...'));
    } catch (e) {
      throw Exception('Pesan gagal dikirim...');
    }
  }
}

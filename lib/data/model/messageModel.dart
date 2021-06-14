import 'package:supabase_flutter/data/model/userModel.dart';

class MessageModel {
    MessageModel({
        this.canalId,
        this.userId,
        this.message,
        this.insertedAt,
        this.user,
    });

    int canalId;
    String userId;
    String message;
    String insertedAt;
    UserModel user;


    factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        canalId: json["canal_id"],
        userId: json["user_id"],
        message: json["message"],
        insertedAt: json["inserted_at"],
        user: UserModel.fromJson(json["users"]),
    );

    Map<String, dynamic> toJson() => {
        "canal_id": canalId,
        "user_id": userId,
        "message": message,
        "inserted_at": insertedAt,
        "users": user.toJson(),
    };
}

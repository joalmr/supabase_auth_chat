class UserModel {
    UserModel({
        this.id,
        this.username,
    });

    String id;
    String username;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
    };
}

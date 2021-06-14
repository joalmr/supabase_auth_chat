class CanalModel {
    CanalModel({
        this.canalId,
        this.userId,
    });

    int canalId;
    String userId;

    factory CanalModel.fromJson(Map<String, dynamic> json) => CanalModel(
        canalId: json["canal_id"],
        userId: json["user_id"],
    );

    Map<String, dynamic> toJson() => {
        "canal_id": canalId,
        "user_id": userId,
    };
}

enum ActionType {
  github,
  naverBlog,
  playStore,
  linkedIn;

  String toJson() => name;
  static ActionType fromJson(String json) => values.byName(json);
}

class ActionInfo {
  ActionInfo({this.type = ActionType.github, this.url = ''});

  ActionType type;
  String url;

  ActionInfo.fromJson(Map<String, dynamic> json)
      : type = ActionType.fromJson(json['type']),
        url = json['url'];

  Map<String, dynamic> toJson() => {
        'type': type.toJson(),
        'url': url,
      };
}

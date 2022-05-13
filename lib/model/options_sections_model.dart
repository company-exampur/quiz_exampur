class Options {
  Options({
    this.option_name,
    this.option_image,
    this.is_true
  });

  String? option_name;
  String? option_image;
  bool? is_true;

  factory Options.fromJson(Map<String, dynamic> json) => Options(
      option_name: json["option_name"],
      option_image: json["option_image"],
      is_true:json["is_true"]
  );

  Map<String, dynamic> toJson() => {
    "option_name": "option_name",
    "option_image": "option_image",
    "is_true":"is_true"
  };
}
class Solution {
  Solution({
    this.solution_name,
    this.solution_image,
  });

  String? solution_name;
  String? solution_image;

  factory Solution.fromJson(Map<String, dynamic> json) => Solution(
    solution_name: json["solution_name"],
    solution_image: json["solution_image"],
  );

  Map<String, dynamic> toJson() => {
    "solution_name": solution_name,
    "solution_image":solution_image,
  };
}

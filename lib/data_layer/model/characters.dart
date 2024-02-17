import 'package:breaking_bad_app/data_layer/model/info.dart';
import 'package:breaking_bad_app/data_layer/model/results.dart';

class Characters {
  final Info info;
  late final List<Result> results;

  Characters({
    required this.info,
    required this.results,
  });

  factory Characters.fromJson(Map<String, dynamic> json) => Characters(
    info: Info.fromJson(json["info"]),
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "info": info.toJson(),
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}
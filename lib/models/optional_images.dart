import 'dart:convert';

List<OptionalImages> optionalImagesFromJson(String str) =>
    List<OptionalImages>.from(
        json.decode(str).map((x) => OptionalImages.fromJson(x)));

String optionalImagesToJson(List<OptionalImages> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OptionalImages {
  OptionalImages({
    required this.toothSelections,
    required this.view,
    required this.image,
  });

  String toothSelections;
  String view;
  String image;

  factory OptionalImages.fromJson(Map<String, dynamic> json) => OptionalImages(
        toothSelections: json["toothSelections"],
        view: json["view"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "toothSelections": toothSelections,
        "view": view,
        "image": image,
      };
}

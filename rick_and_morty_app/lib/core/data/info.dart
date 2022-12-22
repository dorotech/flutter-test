class Info {
  Info({
    this.count,
    this.pages,
    this.next,
    this.prev,
  });

  int? count;
  int? pages;
  String? next;
  dynamic prev;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        prev: json["prev"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "pages": pages,
        "next": next,
        "prev": prev,
      };
}

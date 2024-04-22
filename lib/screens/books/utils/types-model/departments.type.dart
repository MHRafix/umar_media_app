class IDepartments {
  String name;
  String iconImage;
  String coverImage;
  String description;
  dynamic booksCount;

  IDepartments(
      {required this.name,
      required this.iconImage,
      required this.coverImage,
      required this.description,
      required this.booksCount});
}

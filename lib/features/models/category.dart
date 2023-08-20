class Category {
  String thumbnail;
  String name;
  int noOfCourses;

  Category(
      {required this.thumbnail, required this.name, required this.noOfCourses});
}

List<Category> categoryList = [
  Category(thumbnail: 'path', name: 'Physics', noOfCourses: 12),
  Category(thumbnail: 'path', name: 'Math', noOfCourses: 15),
  Category(thumbnail: 'path', name: 'Biology', noOfCourses: 8),
  Category(thumbnail: 'path', name: 'Civics', noOfCourses: 12),
  Category(thumbnail: 'path', name: 'Aptitude', noOfCourses: 7),
  Category(thumbnail: 'path', name: 'Geography', noOfCourses: 5),
  Category(thumbnail: 'path', name: 'Economics', noOfCourses: 12),
  Category(thumbnail: 'path', name: 'ICT', noOfCourses: 7),
  Category(thumbnail: 'path', name: 'General Psychology', noOfCourses: 5),
];

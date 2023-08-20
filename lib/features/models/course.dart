class Course {
  String name;
  double completedPercentage;
  String author;
  String thumbnail;

  Course(
      {required this.name,
      required this.completedPercentage,
      required this.author,
      required this.thumbnail});
}

List<Course> courses = [
  Course(
      name: 'Phsics-Grade 9',
      completedPercentage: .75,
      author: 'author name',
      thumbnail: 'path'),
  Course(
      name: 'Phsics-Grade 9',
      completedPercentage: .75,
      author: 'author name',
      thumbnail: 'path'),
  Course(
      name: 'Phsics-Grade 9',
      completedPercentage: .75,
      author: 'author name',
      thumbnail: 'path'),
  Course(
      name: 'Phsics-Grade 9',
      completedPercentage: .75,
      author: 'author name',
      thumbnail: 'path'),
  Course(
      name: 'Phsics-Grade 9',
      completedPercentage: .75,
      author: 'author name',
      thumbnail: 'path'),
];

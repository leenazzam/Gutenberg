class JobModel {
  final String id;
  final String title;
  final String description;
  final String department;
  final DateTime postedDate;

  JobModel({
    required this.id,
    required this.title,
    required this.description,
    required this.department,
    required this.postedDate,
  });
}

List<dynamic> jobs = [];

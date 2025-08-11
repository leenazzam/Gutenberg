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

List<JobModel> jobs = [
  JobModel(
    id: '1',
    title: 'Software Engineer',
    description: 'Develop and maintain software applications.',
    department: 'Engineering',
    postedDate: DateTime(2025, 7, 20),
  ),
  JobModel(
    id: '2',
    title: 'Product Manager',
    description: 'Lead product development and strategy.',
    department: 'Product',
    postedDate: DateTime(2025, 7, 18),
  ),
  JobModel(
    id: '3',
    title: 'UX/UI Designer',
    description: 'Design user-friendly interfaces and experiences.',
    department: 'Design',
    postedDate: DateTime(2025, 7, 15),
  ),
  JobModel(
    id: '4',
    title: 'Digital Marketing Specialist',
    description: 'Manage online marketing campaigns.',
    department: 'Marketing',
    postedDate: DateTime(2025, 7, 10),
  ),
  JobModel(
    id: '5',
    title: 'Customer Support Representative',
    description: 'Provide support to customers via phone and email.',
    department: 'Support',
    postedDate: DateTime(2025, 7, 5),
  ),
];

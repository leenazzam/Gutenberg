class SolutionModel {
  final String id;
  final String title;
  final String description;
  final String type; // 'custom' or 'ready made'
  final String image;

  SolutionModel({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.image,
  });
}

List<dynamic> solutions = [];

/*List<SolutionModel> solutions = [
  SolutionModel(
    id: '1',
    title: 'Custom CRM',
    description: 'Tailored customer relationship management system.',
    type: 'custom',
    image:
        'https://images.unsplash.com/photo-1519389950473-47ba0277781c?auto=format&fit=crop&w=400&h=300&q=80',
  ),
  SolutionModel(
    id: '2',
    title: 'E-commerce Platform',
    description: 'Ready-made platform for online stores.',
    type: 'ready made',
    image:
        'https://images.unsplash.com/photo-1498050108023-c5249f4df085?auto=format&fit=crop&w=400&h=300&q=80',
  ),
  SolutionModel(
    id: '3',
    title: 'Inventory Management',
    description: 'Custom inventory tracking and control system.',
    type: 'custom',
    image:
        'https://images.unsplash.com/photo-1556761175-4b46a572b786?auto=format&fit=crop&w=400&h=300&q=80',
  ),
  SolutionModel(
    id: '4',
    title: 'CMS Template',
    description: 'Pre-built content management system template.',
    type: 'ready made',
    image:
        'https://images.unsplash.com/photo-1504384308090-c894fdcc538d?auto=format&fit=crop&w=400&h=300&q=80',
  ),
  SolutionModel(
    id: '5',
    title: 'Marketing Automation',
    description: 'Custom solution for automating marketing campaigns.',
    type: 'custom',
    image:
        'https://images.unsplash.com/photo-1486312338219-ce68d2c6f44d?auto=format&fit=crop&w=400&h=300&q=80',
  ),
];*/

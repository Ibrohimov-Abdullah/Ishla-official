class JobModel {
  final String id;
  final String title;
  final String companyName;
  final String companyLogo;
  final String jobDescription;
  final List<String> requirements;
  final List<String> responsibilities;
  final String location;
  final double latitude;
  final double longitude;
  final String salary;
  final String experience;
  final String jobType;
  final DateTime postedDate;
  final List<String> benefits;
  final List<String> technologies;

  JobModel({
    required this.id,
    required this.title,
    required this.companyName,
    required this.companyLogo,
    required this.jobDescription,
    required this.requirements,
    required this.responsibilities,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.salary,
    required this.experience,
    required this.jobType,
    required this.postedDate,
    required this.benefits,
    required this.technologies,
  });
}
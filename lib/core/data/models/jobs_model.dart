import 'dart:convert';

List<JobsModel> jobsModelFromJson(String str) => List<JobsModel>.from(json.decode(str).map((x) => JobsModel.fromJson(x)));

String jobsModelToJson(List<JobsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JobsModel {
  final int? id;
  final String? company;
  final String? category;
  final String? title;
  final String? description;
  final double? salaryMin;
  final double? salaryMax;
  final String? location;
  final String? jobType;
  final String? requirements;
  final DateTime? createdAt;
  final bool? isActive;

  JobsModel({
    this.id,
    this.company,
    this.category,
    this.title,
    this.description,
    this.salaryMin,
    this.salaryMax,
    this.location,
    this.jobType,
    this.requirements,
    this.createdAt,
    this.isActive,
  });

  JobsModel copyWith({
    int? id,
    String? company,
    String? category,
    String? title,
    String? description,
    double? salaryMin,
    double? salaryMax,
    String? location,
    String? jobType,
    String? requirements,
    DateTime? createdAt,
    bool? isActive,
  }) =>
      JobsModel(
        id: id ?? this.id,
        company: company ?? this.company,
        category: category ?? this.category,
        title: title ?? this.title,
        description: description ?? this.description,
        salaryMin: salaryMin ?? this.salaryMin,
        salaryMax: salaryMax ?? this.salaryMax,
        location: location ?? this.location,
        jobType: jobType ?? this.jobType,
        requirements: requirements ?? this.requirements,
        createdAt: createdAt ?? this.createdAt,
        isActive: isActive ?? this.isActive,
      );

  factory JobsModel.fromJson(Map<String, dynamic> json) => JobsModel(
    id: json["id"],
    company: json["company"],
    category: json["category"],
    title: json["title"],
    description: json["description"],
    salaryMin: json["salary_min"]?.toDouble(),
    salaryMax: json["salary_max"]?.toDouble(),
    location: json["location"],
    jobType: json["job_type"],
    requirements: json["requirements"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    isActive: json["is_active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "company": company,
    "category": category,
    "title": title,
    "description": description,
    "salary_min": salaryMin,
    "salary_max": salaryMax,
    "location": location,
    "job_type": jobType,
    "requirements": requirements,
    "created_at": createdAt?.toIso8601String(),
    "is_active": isActive,
  };
}
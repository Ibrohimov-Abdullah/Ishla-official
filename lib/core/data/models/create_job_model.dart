// To parse this JSON data, do
//
//     final createJobModel = createJobModelFromJson(jsonString);

import 'dart:convert';

CreateJobModel createJobModelFromJson(String str) => CreateJobModel.fromJson(json.decode(str));

String createJobModelToJson(CreateJobModel data) => json.encode(data.toJson());

class CreateJobModel {
  final String? title;
  final String? description;
  final int? salaryMin;
  final int? salaryMax;
  final String? location;
  final String? jobType;
  final String? requirements;
  final bool? isActive;

  CreateJobModel({
    this.title,
    this.description,
    this.salaryMin,
    this.salaryMax,
    this.location,
    this.jobType,
    this.requirements,
    this.isActive,
  });

  CreateJobModel copyWith({
    String? title,
    String? description,
    int? salaryMin,
    int? salaryMax,
    String? location,
    String? jobType,
    String? requirements,
    bool? isActive,
  }) =>
      CreateJobModel(
        title: title ?? this.title,
        description: description ?? this.description,
        salaryMin: salaryMin ?? this.salaryMin,
        salaryMax: salaryMax ?? this.salaryMax,
        location: location ?? this.location,
        jobType: jobType ?? this.jobType,
        requirements: requirements ?? this.requirements,
        isActive: isActive ?? this.isActive,
      );

  factory CreateJobModel.fromJson(Map<String, dynamic> json) => CreateJobModel(
    title: json["title"],
    description: json["description"],
    salaryMin: json["salary_min"],
    salaryMax: json["salary_max"],
    location: json["location"],
    jobType: json["job_type"],
    requirements: json["requirements"],
    isActive: json["is_active"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "salary_min": salaryMin,
    "salary_max": salaryMax,
    "location": location,
    "job_type": jobType,
    "requirements": requirements,
    "is_active": isActive,
  };
}
import 'dart:convert';

List<CompaniesModel> companiesModelFromJson(String str) => List<CompaniesModel>.from(json.decode(str).map((x) => CompaniesModel.fromJson(x)));

String companiesModelToJson(List<CompaniesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CompaniesModel {
  final int? id;
  final String? name;
  final String? description;
  final String? logo;
  final String? website;
  final String? phone;
  final DateTime? createdAt;
  final String? jobs;

  CompaniesModel({
    this.id,
    this.name,
    this.description,
    this.logo,
    this.website,
    this.phone,
    this.createdAt,
    this.jobs,
  });

  CompaniesModel copyWith({
    int? id,
    String? name,
    String? description,
    String? logo,
    String? website,
    String? phone,
    DateTime? createdAt,
    String? jobs,
  }) =>
      CompaniesModel(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        logo: logo ?? this.logo,
        website: website ?? this.website,
        phone: phone ?? this.phone,
        createdAt: createdAt ?? this.createdAt,
        jobs: jobs ?? this.jobs,
      );

  factory CompaniesModel.fromJson(Map<String, dynamic> json) => CompaniesModel(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    logo: json["logo"],
    website: json["website"],
    phone: json["phone"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    jobs: json["jobs"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "logo": logo,
    "website": website,
    "phone": phone,
    "created_at": createdAt?.toIso8601String(),
    "jobs": jobs,
  };
}
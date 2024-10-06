import 'dart:convert';

import 'package:my_practice_bloc/features/homepage/domain/entities/homepage_entities.dart';

class HomepageDataModel extends HomepageData {
  const HomepageDataModel({
    required super.id, 
    required super.email, 
    required super.firstName, 
    required super.lastName, 
    required super.avatar
  });

  factory HomepageDataModel.fromJson(Map<String, dynamic> json) {
    return HomepageDataModel(
      id: json['id'] ?? 0,
      email: json['email'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      avatar: json['avatar'] ?? '',
    );
  }

  static List<HomepageDataModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => HomepageDataModel.fromJson(json)).toList();
  }
}
import 'package:my_practice_bloc/features/homepage/domain/entities/resource.dart';

class ResourceModel extends Resource {
  const ResourceModel({
    required super.id,
    required super.name,
    required super.year,
    required super.color,
    required super.pantone
  });

  factory ResourceModel.fromJson(Map<String, dynamic> data) {
    return ResourceModel(
      id: data['id'] ?? 0, 
      name: data['name'] ?? '', 
      year: data['year'] ?? 0, 
      color: data['color'] ?? '', 
      pantone: data['pantone'] ?? '',
    );
  }

  static List<ResourceModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => ResourceModel.fromJson(json)).toList();
  }
}
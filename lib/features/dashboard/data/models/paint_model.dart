import '../../domain/entities/paint.dart';

class PaintModel extends Paint {
  final String pantoneValue;

  const PaintModel({
    required super.id, 
    required super.name, 
    required super.year, 
    required super.color, 
    required this.pantoneValue,
  }) : super(pantone: pantoneValue);

  factory PaintModel.fromJson(Map<String, dynamic> data) {
    return PaintModel(
      id: data['id'] ?? 0,
      name: data['name'] ?? '',
      year: data['year'] ?? 0,
      color: data['color'] ?? '',
      pantoneValue: data['pantone_value'] ?? '',
    );
  }
}
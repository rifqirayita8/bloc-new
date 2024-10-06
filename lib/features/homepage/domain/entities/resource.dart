import 'package:equatable/equatable.dart';

class Resource extends Equatable {
  final int id;
  final String name;
  final int year;
  final String color;
  final String pantone;

  const Resource({
    required this.id, 
    required this.name, 
    required this.year, 
    required this.color, 
    required this.pantone
  });
  
  @override
  List<Object?> get props => [
    id,
    name,
    year,
    color,
    pantone,
  ];
}
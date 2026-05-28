import 'package:equatable/equatable.dart';

class Ingredient extends Equatable {
  final String name;
  final String measure;

  const Ingredient({required this.name, required this.measure});

  @override
  List<Object?> get props => [name, measure];
}

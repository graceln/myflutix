part of 'models.dart';

class Theater extends Equatable {
  final String name;

  const Theater(this.name);

  @override
  List<Object> get props => [name];
}

List<Theater> dummyTheaters = [
  const Theater("CGV Paris Van Java Mall"),
  const Theater("XXI Paris Van Java Mall"),
  const Theater("XXI Big Mall")
];

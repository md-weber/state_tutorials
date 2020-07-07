class Drink {
  final String name;
  final bool selected;

  const Drink(this.name, this.selected);

  Drink copyWith({String name, bool selected}) {
    return Drink(name ?? this.name, selected ?? this.selected);
  }

  @override
  String toString() => 'Drink($name, $selected)';
}

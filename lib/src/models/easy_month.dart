class EasyMonth {
  const EasyMonth({
    required this.year,
    required this.name,
    required this.vale,
  });

  /// The name of the month
  final String name;

  ///the value of the month and this value has range of 1,...12
  final int vale;

  ///the value of the year e.g: 2023
  final int year;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EasyMonth &&
          runtimeType == other.runtimeType &&
          year == other.year &&
          name == other.name &&
          vale == other.vale;

  @override
  int get hashCode => Object.hash(
        year.hashCode,
        name.hashCode,
        vale.hashCode,
      );

  @override
  String toString() => "<$year,$name,$vale>";
}

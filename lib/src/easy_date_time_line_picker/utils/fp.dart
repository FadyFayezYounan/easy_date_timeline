/// Extension on `Iterable` that adds a method to find the first element that matches a given condition or return null if no such element is found.
///
/// The `firstWhereOrNull` method iterates through the elements of the iterable and returns the first element that satisfies the provided `test` function.
/// If no element satisfies the `test` function, it returns the result of the `orElse` function if provided, otherwise it returns `null`.
///
/// Example usage:
/// ```dart
/// List<int> numbers = [1, 2, 3, 4, 5];
/// int? firstEven = numbers.firstWhereOrNull((n) => n.isEven);
/// print(firstEven); // Output: 2
///
/// int? firstGreaterThanFive = numbers.firstWhereOrNull((n) => n > 5, orElse: () => -1);
/// print(firstGreaterThanFive); // Output: -1
/// ```
///
/// - Parameter test: A function that tests each element.
/// - Parameter orElse: An optional function that returns a value if no element satisfies the `test` function.
/// - Returns: The first element that satisfies the `test` function, the result of the `orElse` function if provided, or `null`.
extension FirstWhereOrNullX<T> on Iterable<T> {
  T? firstWhereOrNull(bool Function(T element) test, {T Function()? orElse}) {
    for (T element in this) {
      if (test(element)) return element;
    }
    if (orElse != null) return orElse();
    return null;
  }
}

// extension IterableExtension<T> on Iterable<T?> {
//   Iterable<T> whereNotNull() => where((element) => element != null).cast<T>();
// }

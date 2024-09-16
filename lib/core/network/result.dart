
class Result<T, E> {
  final T? value;
  final E? error;

  bool get isSuccess => error == null;
  bool get isError => error != null;

  Result._(this.value, this.error);

  factory Result.success(T value) => Result._(value, null);
  factory Result.error(E error) => Result._(null, error);
}

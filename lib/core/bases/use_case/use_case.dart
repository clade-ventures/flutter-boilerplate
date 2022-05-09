import '../../errors/decider.dart';
import '../../errors/failures.dart';

abstract class UseCase<T, A> {
  Future<Decide<Failure, T?>> execute([A args]);
}

import 'package:custom_fit/domain/entities/try_on_result.dart';
import 'package:custom_fit/domain/repositories/try_on_repository.dart';

class TryOnUseCase {
  final TryOnRepository repository;

  TryOnUseCase(this.repository);

  Future<TryOnResult> requestTryOn(Map<String, dynamic> tryOnData) async {
    return await repository.requestTryOn(tryOnData);
  }
}

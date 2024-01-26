import 'package:custom_fit/domain/entities/try_on_result.dart';

abstract class TryOnRepository {
  Future<TryOnResult> requestTryOn(Map<String, dynamic> tryOnData);
}

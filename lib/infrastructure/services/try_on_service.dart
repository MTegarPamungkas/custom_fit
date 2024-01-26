import 'package:custom_fit/domain/entities/try_on_result.dart';
import 'package:custom_fit/infrastructure/data/remote/try_on_client.dart';

class TryOnService {
  final TryOnApiClient apiClient;

  TryOnService(this.apiClient);

  Future<TryOnResult> requestTryOn(
      String? top, String? bottom, String? modelId) async {
    try {
      const String endpoint = 'https://api-custom-fit.vercel.app/requestTryOn';
      Map<String, dynamic> requestBody = {
        'garments': {
          'tops': top,
          'bottoms': bottom,
        },
        'model_id': modelId,
        'background': 'studio',
      };

      final response = await apiClient.requestTryOn(endpoint, requestBody);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = response.data;

        final String gender = jsonResponse['model_metadata']['gender'];
        final String modelFile = jsonResponse['model_metadata']['model_file'];
        final String modelId = jsonResponse['model_metadata']['model_id'];
        final String? shoesId = jsonResponse['model_metadata']['shoes_id'];
        final String version = jsonResponse['model_metadata']['version'];
        final bool success = jsonResponse['success'];
        final String imageUrl = jsonResponse['imageUrl'];

        final tryOnResult = TryOnResult(
          gender: gender,
          modelFile: modelFile,
          modelId: modelId,
          shoesId: shoesId,
          version: version,
          success: success,
          imageUrl: imageUrl,
        );

        return tryOnResult;
      } else {
        throw Exception(
            'Failed to request try-on. Status code: ${response.statusCode}');
      }
    } catch (error) {
      // Handle any other errors that might occur
      throw Exception('Error requesting try-on: $error');
    }
  }
}

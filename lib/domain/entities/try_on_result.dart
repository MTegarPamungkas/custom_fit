class TryOnResult {
  final String gender;
  final String modelFile;
  final String modelId;
  final String? shoesId;
  final String version;
  final bool success;
  final String imageUrl;

  TryOnResult({
    required this.gender,
    required this.modelFile,
    required this.modelId,
    required this.shoesId,
    required this.version,
    required this.success,
    required this.imageUrl,
  });
}

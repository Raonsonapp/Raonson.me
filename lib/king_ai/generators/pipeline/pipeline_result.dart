class PipelineResult {
  final bool success;
  final String? outputPath;
  final String? error;

  PipelineResult.success(this.outputPath)
      : success = true,
        error = null;

  PipelineResult.failure(this.error)
      : success = false,
        outputPath = null;
}
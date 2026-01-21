class TemplateEngine {
  String render(String template, Map<String, String> vars) {
    var result = template;
    vars.forEach((k, v) {
      result = result.replaceAll('{{$k}}', v);
    });
    return result;
  }
}
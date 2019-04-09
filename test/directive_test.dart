import 'package:graphql_builder/graphql_builder.dart';
import 'package:test/test.dart';

void main() {
  group('test include directive', () {
    test('include directive bake method test', () {
      expect(IncludeDirective(Variable("var")).bake(), "@include(if:\$var)");
    });
  });

  group('test skip directive', () {
    test('include directive bake method test', () {
      expect(SkipDirective(Variable("var")).bake(), "@skip(if:\$var)");
    });
  });
}

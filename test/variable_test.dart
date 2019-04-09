import 'package:graphql_builder/graphql_builder.dart';
import 'package:test/test.dart';

void main() {

  group('test variables', () {
    test('test bake method', () {
      expect(Variable("testVariable").bake(), equals("\$testVariable"));
      expect(Variable("testV_ariable").bake(), equals("\$testV_ariable"));
    });
  });

}
import 'package:graphql_builder/graphql_builder.dart';
import 'package:test/test.dart';

void main() {
  group('test FragmentSpread', () {
    test('test bake method with simple parameters', () {
      expect(FragmentSpread("frag1").bake(), equals("...frag1"));
      expect(FragmentSpread("frag_tst").bake(), equals("...frag_tst"));
    });

    test('test bake method with sinle directive', () {
      expect(
          FragmentSpread("frag1")
              .addDirective(SkipDirective(Variable("tst")))
              .bake(),
          equals("...frag1 @skip(if:\$tst)"));
      expect(
          FragmentSpread("frag_tst")
              .addDirective(IncludeDirective(Variable("tst")))
              .bake(),
          equals("...frag_tst @include(if:\$tst)"));
    });

    test('test bake method with many directives', () {
      expect(
          FragmentSpread("frag1")
              .addDirective(SkipDirective(Variable("var1")))
              .addDirective(IncludeDirective(Variable("var2")))
              .addDirective(IncludeDirective(Variable("var3")))
              .bake(),
          equals("...frag1 @skip(if:\$var1) @include(if:\$var2) @include(if:\$var3)"));
    });
  });
}

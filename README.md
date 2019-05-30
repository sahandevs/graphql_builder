[![Coverage Status](https://coveralls.io/repos/github/SahandAkbarzadeh/graphql_builder/badge.svg?branch=master)](https://coveralls.io/github/SahandAkbarzadeh/graphql_builder?branch=master)
[![Build Status](https://travis-ci.com/SahandAkbarzadeh/graphql_builder.svg?branch=master)](https://travis-ci.com/SahandAkbarzadeh/graphql_builder)

Build GraphQL queries in dart.

## Example
this code:
```dart
Document()
    .add(Query(name: "test")
        .addSelection(Field("title"))
        .addSelection(Field("name"))
        .addSelection(FragmentSpread("frag1")))
    .add(Fragment("frag1", TypeCondition("Cat"))
        .addSelection(Field("id"))
        .addSelection(Field("name")))
    .bake()
```
will generate this query:
```
query test {
  title
  name
  ...frag1
} 

fragment frag1 on Cat {
  id
  name
}
```

## Usage

add `graphql_builder: ^1.0.0` to your dependencies

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clave_usuario_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetClaveUsuarioModelCollection on Isar {
  IsarCollection<ClaveUsuarioModel> get claveUsuarioModels => this.collection();
}

const ClaveUsuarioModelSchema = CollectionSchema(
  name: r'ClaveUsuarioModel',
  id: -2527444341285950511,
  properties: {
    r'claveHash': PropertySchema(
      id: 0,
      name: r'claveHash',
      type: IsarType.string,
    ),
    r'fechaCreacion': PropertySchema(
      id: 1,
      name: r'fechaCreacion',
      type: IsarType.dateTime,
    ),
    r'salt': PropertySchema(
      id: 2,
      name: r'salt',
      type: IsarType.string,
    )
  },
  estimateSize: _claveUsuarioModelEstimateSize,
  serialize: _claveUsuarioModelSerialize,
  deserialize: _claveUsuarioModelDeserialize,
  deserializeProp: _claveUsuarioModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'user': LinkSchema(
      id: -5728573110822917382,
      name: r'user',
      target: r'UsuarioModel',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _claveUsuarioModelGetId,
  getLinks: _claveUsuarioModelGetLinks,
  attach: _claveUsuarioModelAttach,
  version: '3.1.0+1',
);

int _claveUsuarioModelEstimateSize(
  ClaveUsuarioModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.claveHash.length * 3;
  bytesCount += 3 + object.salt.length * 3;
  return bytesCount;
}

void _claveUsuarioModelSerialize(
  ClaveUsuarioModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.claveHash);
  writer.writeDateTime(offsets[1], object.fechaCreacion);
  writer.writeString(offsets[2], object.salt);
}

ClaveUsuarioModel _claveUsuarioModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ClaveUsuarioModel();
  object.claveHash = reader.readString(offsets[0]);
  object.fechaCreacion = reader.readDateTime(offsets[1]);
  object.id = id;
  object.salt = reader.readString(offsets[2]);
  return object;
}

P _claveUsuarioModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _claveUsuarioModelGetId(ClaveUsuarioModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _claveUsuarioModelGetLinks(
    ClaveUsuarioModel object) {
  return [object.user];
}

void _claveUsuarioModelAttach(
    IsarCollection<dynamic> col, Id id, ClaveUsuarioModel object) {
  object.id = id;
  object.user.attach(col, col.isar.collection<UsuarioModel>(), r'user', id);
}

extension ClaveUsuarioModelQueryWhereSort
    on QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QWhere> {
  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ClaveUsuarioModelQueryWhere
    on QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QWhereClause> {
  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ClaveUsuarioModelQueryFilter
    on QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QFilterCondition> {
  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterFilterCondition>
      claveHashEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'claveHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterFilterCondition>
      claveHashGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'claveHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterFilterCondition>
      claveHashLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'claveHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterFilterCondition>
      claveHashBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'claveHash',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterFilterCondition>
      claveHashStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'claveHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterFilterCondition>
      claveHashEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'claveHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterFilterCondition>
      claveHashContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'claveHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterFilterCondition>
      claveHashMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'claveHash',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterFilterCondition>
      claveHashIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'claveHash',
        value: '',
      ));
    });
  }

  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterFilterCondition>
      claveHashIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'claveHash',
        value: '',
      ));
    });
  }

  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterFilterCondition>
      fechaCreacionEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterFilterCondition>
      fechaCreacionGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterFilterCondition>
      fechaCreacionLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterFilterCondition>
      fechaCreacionBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaCreacion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterFilterCondition>
      saltEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'salt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterFilterCondition>
      saltGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'salt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterFilterCondition>
      saltLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'salt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterFilterCondition>
      saltBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'salt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterFilterCondition>
      saltStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'salt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterFilterCondition>
      saltEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'salt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterFilterCondition>
      saltContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'salt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterFilterCondition>
      saltMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'salt',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterFilterCondition>
      saltIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'salt',
        value: '',
      ));
    });
  }

  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterFilterCondition>
      saltIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'salt',
        value: '',
      ));
    });
  }
}

extension ClaveUsuarioModelQueryObject
    on QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QFilterCondition> {}

extension ClaveUsuarioModelQueryLinks
    on QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QFilterCondition> {
  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterFilterCondition>
      user(FilterQuery<UsuarioModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'user');
    });
  }

  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterFilterCondition>
      userIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'user', 0, true, 0, true);
    });
  }
}

extension ClaveUsuarioModelQuerySortBy
    on QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QSortBy> {
  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterSortBy>
      sortByClaveHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'claveHash', Sort.asc);
    });
  }

  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterSortBy>
      sortByClaveHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'claveHash', Sort.desc);
    });
  }

  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterSortBy>
      sortByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterSortBy>
      sortByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterSortBy>
      sortBySalt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salt', Sort.asc);
    });
  }

  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterSortBy>
      sortBySaltDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salt', Sort.desc);
    });
  }
}

extension ClaveUsuarioModelQuerySortThenBy
    on QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QSortThenBy> {
  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterSortBy>
      thenByClaveHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'claveHash', Sort.asc);
    });
  }

  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterSortBy>
      thenByClaveHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'claveHash', Sort.desc);
    });
  }

  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterSortBy>
      thenByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterSortBy>
      thenByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterSortBy>
      thenBySalt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salt', Sort.asc);
    });
  }

  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QAfterSortBy>
      thenBySaltDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salt', Sort.desc);
    });
  }
}

extension ClaveUsuarioModelQueryWhereDistinct
    on QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QDistinct> {
  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QDistinct>
      distinctByClaveHash({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'claveHash', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QDistinct>
      distinctByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaCreacion');
    });
  }

  QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QDistinct> distinctBySalt(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'salt', caseSensitive: caseSensitive);
    });
  }
}

extension ClaveUsuarioModelQueryProperty
    on QueryBuilder<ClaveUsuarioModel, ClaveUsuarioModel, QQueryProperty> {
  QueryBuilder<ClaveUsuarioModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ClaveUsuarioModel, String, QQueryOperations>
      claveHashProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'claveHash');
    });
  }

  QueryBuilder<ClaveUsuarioModel, DateTime, QQueryOperations>
      fechaCreacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaCreacion');
    });
  }

  QueryBuilder<ClaveUsuarioModel, String, QQueryOperations> saltProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'salt');
    });
  }
}

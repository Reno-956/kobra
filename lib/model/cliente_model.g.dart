// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cliente_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetClienteModelCollection on Isar {
  IsarCollection<ClienteModel> get clienteModels => this.collection();
}

const ClienteModelSchema = CollectionSchema(
  name: r'ClienteModel',
  id: -8935630899739365906,
  properties: {
    r'correo': PropertySchema(
      id: 0,
      name: r'correo',
      type: IsarType.string,
    ),
    r'direccion': PropertySchema(
      id: 1,
      name: r'direccion',
      type: IsarType.string,
    ),
    r'esSincronizado': PropertySchema(
      id: 2,
      name: r'esSincronizado',
      type: IsarType.bool,
    ),
    r'fechaCreacion': PropertySchema(
      id: 3,
      name: r'fechaCreacion',
      type: IsarType.dateTime,
    ),
    r'identificacion': PropertySchema(
      id: 4,
      name: r'identificacion',
      type: IsarType.string,
    ),
    r'nombre': PropertySchema(
      id: 5,
      name: r'nombre',
      type: IsarType.string,
    ),
    r'saldoCredito': PropertySchema(
      id: 6,
      name: r'saldoCredito',
      type: IsarType.double,
    ),
    r'telefono': PropertySchema(
      id: 7,
      name: r'telefono',
      type: IsarType.string,
    )
  },
  estimateSize: _clienteModelEstimateSize,
  serialize: _clienteModelSerialize,
  deserialize: _clienteModelDeserialize,
  deserializeProp: _clienteModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _clienteModelGetId,
  getLinks: _clienteModelGetLinks,
  attach: _clienteModelAttach,
  version: '3.1.0+1',
);

int _clienteModelEstimateSize(
  ClienteModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.correo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.direccion;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.identificacion.length * 3;
  bytesCount += 3 + object.nombre.length * 3;
  {
    final value = object.telefono;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _clienteModelSerialize(
  ClienteModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.correo);
  writer.writeString(offsets[1], object.direccion);
  writer.writeBool(offsets[2], object.esSincronizado);
  writer.writeDateTime(offsets[3], object.fechaCreacion);
  writer.writeString(offsets[4], object.identificacion);
  writer.writeString(offsets[5], object.nombre);
  writer.writeDouble(offsets[6], object.saldoCredito);
  writer.writeString(offsets[7], object.telefono);
}

ClienteModel _clienteModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ClienteModel(
    correo: reader.readStringOrNull(offsets[0]),
    direccion: reader.readStringOrNull(offsets[1]),
    esSincronizado: reader.readBoolOrNull(offsets[2]) ?? true,
    fechaCreacion: reader.readDateTimeOrNull(offsets[3]),
    id: id,
    identificacion: reader.readString(offsets[4]),
    nombre: reader.readString(offsets[5]),
    telefono: reader.readStringOrNull(offsets[7]),
  );
  object.saldoCredito = reader.readDouble(offsets[6]);
  return object;
}

P _clienteModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readBoolOrNull(offset) ?? true) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _clienteModelGetId(ClienteModel object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _clienteModelGetLinks(ClienteModel object) {
  return [];
}

void _clienteModelAttach(
    IsarCollection<dynamic> col, Id id, ClienteModel object) {
  object.id = id;
}

extension ClienteModelQueryWhereSort
    on QueryBuilder<ClienteModel, ClienteModel, QWhere> {
  QueryBuilder<ClienteModel, ClienteModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ClienteModelQueryWhere
    on QueryBuilder<ClienteModel, ClienteModel, QWhereClause> {
  QueryBuilder<ClienteModel, ClienteModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<ClienteModel, ClienteModel, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterWhereClause> idBetween(
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

extension ClienteModelQueryFilter
    on QueryBuilder<ClienteModel, ClienteModel, QFilterCondition> {
  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      correoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'correo',
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      correoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'correo',
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition> correoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'correo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      correoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'correo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      correoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'correo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition> correoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'correo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      correoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'correo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      correoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'correo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      correoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'correo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition> correoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'correo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      correoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'correo',
        value: '',
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      correoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'correo',
        value: '',
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      direccionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'direccion',
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      direccionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'direccion',
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      direccionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'direccion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      direccionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'direccion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      direccionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'direccion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      direccionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'direccion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      direccionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'direccion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      direccionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'direccion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      direccionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'direccion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      direccionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'direccion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      direccionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'direccion',
        value: '',
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      direccionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'direccion',
        value: '',
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      esSincronizadoEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'esSincronizado',
        value: value,
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      fechaCreacionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaCreacion',
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      fechaCreacionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaCreacion',
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      fechaCreacionEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      fechaCreacionGreaterThan(
    DateTime? value, {
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

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      fechaCreacionLessThan(
    DateTime? value, {
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

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      fechaCreacionBetween(
    DateTime? lower,
    DateTime? upper, {
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

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition> idGreaterThan(
    Id? value, {
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

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition> idLessThan(
    Id? value, {
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

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
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

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      identificacionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'identificacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      identificacionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'identificacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      identificacionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'identificacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      identificacionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'identificacion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      identificacionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'identificacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      identificacionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'identificacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      identificacionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'identificacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      identificacionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'identificacion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      identificacionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'identificacion',
        value: '',
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      identificacionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'identificacion',
        value: '',
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition> nombreEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      nombreGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      nombreLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition> nombreBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nombre',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      nombreStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      nombreEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      nombreContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition> nombreMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nombre',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      nombreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      nombreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      saldoCreditoEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'saldoCredito',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      saldoCreditoGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'saldoCredito',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      saldoCreditoLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'saldoCredito',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      saldoCreditoBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'saldoCredito',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      telefonoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'telefono',
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      telefonoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'telefono',
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      telefonoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'telefono',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      telefonoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'telefono',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      telefonoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'telefono',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      telefonoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'telefono',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      telefonoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'telefono',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      telefonoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'telefono',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      telefonoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'telefono',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      telefonoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'telefono',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      telefonoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'telefono',
        value: '',
      ));
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterFilterCondition>
      telefonoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'telefono',
        value: '',
      ));
    });
  }
}

extension ClienteModelQueryObject
    on QueryBuilder<ClienteModel, ClienteModel, QFilterCondition> {}

extension ClienteModelQueryLinks
    on QueryBuilder<ClienteModel, ClienteModel, QFilterCondition> {}

extension ClienteModelQuerySortBy
    on QueryBuilder<ClienteModel, ClienteModel, QSortBy> {
  QueryBuilder<ClienteModel, ClienteModel, QAfterSortBy> sortByCorreo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correo', Sort.asc);
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterSortBy> sortByCorreoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correo', Sort.desc);
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterSortBy> sortByDireccion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direccion', Sort.asc);
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterSortBy> sortByDireccionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direccion', Sort.desc);
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterSortBy>
      sortByEsSincronizado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esSincronizado', Sort.asc);
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterSortBy>
      sortByEsSincronizadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esSincronizado', Sort.desc);
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterSortBy> sortByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterSortBy>
      sortByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterSortBy>
      sortByIdentificacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'identificacion', Sort.asc);
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterSortBy>
      sortByIdentificacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'identificacion', Sort.desc);
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterSortBy> sortByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterSortBy> sortByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterSortBy> sortBySaldoCredito() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoCredito', Sort.asc);
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterSortBy>
      sortBySaldoCreditoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoCredito', Sort.desc);
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterSortBy> sortByTelefono() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telefono', Sort.asc);
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterSortBy> sortByTelefonoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telefono', Sort.desc);
    });
  }
}

extension ClienteModelQuerySortThenBy
    on QueryBuilder<ClienteModel, ClienteModel, QSortThenBy> {
  QueryBuilder<ClienteModel, ClienteModel, QAfterSortBy> thenByCorreo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correo', Sort.asc);
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterSortBy> thenByCorreoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correo', Sort.desc);
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterSortBy> thenByDireccion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direccion', Sort.asc);
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterSortBy> thenByDireccionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direccion', Sort.desc);
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterSortBy>
      thenByEsSincronizado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esSincronizado', Sort.asc);
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterSortBy>
      thenByEsSincronizadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esSincronizado', Sort.desc);
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterSortBy> thenByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterSortBy>
      thenByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterSortBy>
      thenByIdentificacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'identificacion', Sort.asc);
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterSortBy>
      thenByIdentificacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'identificacion', Sort.desc);
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterSortBy> thenByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterSortBy> thenByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterSortBy> thenBySaldoCredito() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoCredito', Sort.asc);
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterSortBy>
      thenBySaldoCreditoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saldoCredito', Sort.desc);
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterSortBy> thenByTelefono() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telefono', Sort.asc);
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QAfterSortBy> thenByTelefonoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telefono', Sort.desc);
    });
  }
}

extension ClienteModelQueryWhereDistinct
    on QueryBuilder<ClienteModel, ClienteModel, QDistinct> {
  QueryBuilder<ClienteModel, ClienteModel, QDistinct> distinctByCorreo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'correo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QDistinct> distinctByDireccion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'direccion', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QDistinct>
      distinctByEsSincronizado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'esSincronizado');
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QDistinct>
      distinctByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaCreacion');
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QDistinct> distinctByIdentificacion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'identificacion',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QDistinct> distinctByNombre(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nombre', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QDistinct> distinctBySaldoCredito() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'saldoCredito');
    });
  }

  QueryBuilder<ClienteModel, ClienteModel, QDistinct> distinctByTelefono(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'telefono', caseSensitive: caseSensitive);
    });
  }
}

extension ClienteModelQueryProperty
    on QueryBuilder<ClienteModel, ClienteModel, QQueryProperty> {
  QueryBuilder<ClienteModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ClienteModel, String?, QQueryOperations> correoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'correo');
    });
  }

  QueryBuilder<ClienteModel, String?, QQueryOperations> direccionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'direccion');
    });
  }

  QueryBuilder<ClienteModel, bool, QQueryOperations> esSincronizadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'esSincronizado');
    });
  }

  QueryBuilder<ClienteModel, DateTime?, QQueryOperations>
      fechaCreacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaCreacion');
    });
  }

  QueryBuilder<ClienteModel, String, QQueryOperations>
      identificacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'identificacion');
    });
  }

  QueryBuilder<ClienteModel, String, QQueryOperations> nombreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nombre');
    });
  }

  QueryBuilder<ClienteModel, double, QQueryOperations> saldoCreditoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'saldoCredito');
    });
  }

  QueryBuilder<ClienteModel, String?, QQueryOperations> telefonoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'telefono');
    });
  }
}

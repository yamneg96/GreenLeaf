// Mocks generated by Mockito 5.4.5 from annotations
// in greenleaf_app/test/plant_notifier_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:greenleaf_app/domain/observation.dart' as _i6;
import 'package:greenleaf_app/domain/plant.dart' as _i2;
import 'package:greenleaf_app/infrastructure/local_data_source.dart' as _i5;
import 'package:greenleaf_app/infrastructure/plant_repository.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakePlant_0 extends _i1.SmartFake implements _i2.Plant {
  _FakePlant_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [PlantRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockPlantRepository extends _i1.Mock implements _i3.PlantRepository {
  MockPlantRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<List<_i2.Plant>> getPlants() => (super.noSuchMethod(
        Invocation.method(
          #getPlants,
          [],
        ),
        returnValue: _i4.Future<List<_i2.Plant>>.value(<_i2.Plant>[]),
      ) as _i4.Future<List<_i2.Plant>>);

  @override
  _i4.Future<_i2.Plant> getPlant(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getPlant,
          [id],
        ),
        returnValue: _i4.Future<_i2.Plant>.value(_FakePlant_0(
          this,
          Invocation.method(
            #getPlant,
            [id],
          ),
        )),
      ) as _i4.Future<_i2.Plant>);

  @override
  _i4.Future<_i2.Plant> addPlant(
    Map<String, dynamic>? data,
    String? imagePath,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #addPlant,
          [
            data,
            imagePath,
          ],
        ),
        returnValue: _i4.Future<_i2.Plant>.value(_FakePlant_0(
          this,
          Invocation.method(
            #addPlant,
            [
              data,
              imagePath,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Plant>);

  @override
  _i4.Future<_i2.Plant> updatePlant(
    int? id,
    Map<String, dynamic>? data,
    String? imagePath,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updatePlant,
          [
            id,
            data,
            imagePath,
          ],
        ),
        returnValue: _i4.Future<_i2.Plant>.value(_FakePlant_0(
          this,
          Invocation.method(
            #updatePlant,
            [
              id,
              data,
              imagePath,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Plant>);

  @override
  _i4.Future<void> deletePlant(int? id) => (super.noSuchMethod(
        Invocation.method(
          #deletePlant,
          [id],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}

/// A class which mocks [LocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocalDataSource extends _i1.Mock implements _i5.LocalDataSource {
  MockLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<void> cachePlants(List<_i2.Plant>? plants) => (super.noSuchMethod(
        Invocation.method(
          #cachePlants,
          [plants],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  List<_i2.Plant> getCachedPlants() => (super.noSuchMethod(
        Invocation.method(
          #getCachedPlants,
          [],
        ),
        returnValue: <_i2.Plant>[],
      ) as List<_i2.Plant>);

  @override
  _i4.Future<void> addPlant(_i2.Plant? plant) => (super.noSuchMethod(
        Invocation.method(
          #addPlant,
          [plant],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<void> updatePlant(_i2.Plant? plant) => (super.noSuchMethod(
        Invocation.method(
          #updatePlant,
          [plant],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<void> deletePlant(int? id) => (super.noSuchMethod(
        Invocation.method(
          #deletePlant,
          [id],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<void> cacheObservations(List<_i6.Observation>? observations) =>
      (super.noSuchMethod(
        Invocation.method(
          #cacheObservations,
          [observations],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  List<_i6.Observation> getCachedObservations() => (super.noSuchMethod(
        Invocation.method(
          #getCachedObservations,
          [],
        ),
        returnValue: <_i6.Observation>[],
      ) as List<_i6.Observation>);

  @override
  _i4.Future<void> addObservation(_i6.Observation? observation) =>
      (super.noSuchMethod(
        Invocation.method(
          #addObservation,
          [observation],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<void> updateObservation(_i6.Observation? observation) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateObservation,
          [observation],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<void> deleteObservation(int? id) => (super.noSuchMethod(
        Invocation.method(
          #deleteObservation,
          [id],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<void> clearAllData() => (super.noSuchMethod(
        Invocation.method(
          #clearAllData,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}

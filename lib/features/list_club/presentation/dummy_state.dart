import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/dummy/model/dummy_model.dart';

abstract class DummyState {}

class DummyStateSuccess extends DummyState {
  final DummyModel listDummy;
  DummyStateSuccess(this.listDummy);
}

class DummyStateLoading extends DummyState {}

class DummyStateIdle extends DummyState {}

class DummyStateError extends DummyState {}

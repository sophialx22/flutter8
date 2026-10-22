import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../data/home_repository.dart';
import '../../../models/home_item.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _repository;

  HomeBloc(this._repository) : super(const HomeInitial()) {
    on<LoadHomeData>(_onLoadHomeData);
  }

  Future<void> _onLoadHomeData(
      LoadHomeData event,
      Emitter<HomeState> emit,
      ) async {
    emit(const HomeLoading());
    try {
      final items = await _repository.getHomeItems();
      final images = await _repository.getHomeImages();
      emit(HomeLoaded(items, images));
    } catch (e) {
      emit(const HomeError('Не удалось загрузить данные из БД'));
    }
  }
}
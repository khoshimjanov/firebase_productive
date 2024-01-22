import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productive/features/notes/notes/data/repository/notes.dart';
import 'package:productive/features/tasks/data/models/status.dart';

import '../../../data/models/notes.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final NoteRepository _repository;
  NoteBloc({
    required NoteRepository repository,
}) : _repository = repository,
      super(
        const NoteState(
          status: LoadingStatus.pure,
          allNotes: [],
        ),
      ) {
    on<LoadNotes>((event, emit) async {
      emit(state.copyWith(status: LoadingStatus.loading));
      try {
        final noteList = await _repository.getNote();
        emit(
          state.copyWith(
            status: LoadingStatus.loadedWithSuccess,
            allNotes: noteList,
          ),
        );
      } catch (e) {
        addError(e);
        emit(state.copyWith(status: LoadingStatus.loadedWithFailure));
      }
      });

    on<DeleteNote>((event, emit) {
      state.allNotes.removeWhere((note) => note.id == event.id);
      
      emit(state.copyWith(
        status: LoadingStatus.loadedWithSuccess,
        allNotes: List.from(state.allNotes),
      ));
    });
  }
  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
  }
}
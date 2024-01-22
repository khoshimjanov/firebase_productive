part of 'notes_bloc.dart';

sealed class NoteEvent {
  const NoteEvent();
}

class LoadNotes extends NoteEvent {}

class DeleteNote extends NoteEvent {
  final int id;
  DeleteNote({required this.id});
}
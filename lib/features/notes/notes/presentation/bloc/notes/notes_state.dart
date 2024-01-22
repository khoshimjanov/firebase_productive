part of 'notes_bloc.dart';

class NoteState {
  final LoadingStatus status;
  final List<NoteModel> allNotes;
  const NoteState({
    required this.allNotes,
    required this.status,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NoteState &&
            status == other.status &&
            allNotes == other.allNotes;
  }


  @override
  int get hashCode => status.hashCode ^ allNotes.hashCode;

  NoteState copyWith({
    LoadingStatus? status,
    List<NoteModel>? allNotes,
  }) {
    return NoteState(
      status: status ?? this.status,
      allNotes: allNotes ?? this.allNotes,
    );
  }
}
import 'package:productive/features/notes/notes/data/mock_data.dart';

import '../models/notes.dart';

class NoteRepository {
  Future<List<NoteModel>> getNote() async {
    await Future.delayed(const Duration(seconds: 2));

    return (datas['notes'] as List)
        .map(
        (note) => NoteModel(
            id: note['id'],
            title: note['title'],
            desc: note['desc'],
            image: note['image'],
            voiceIcon: note['voice_icon'],
            createdDay: note['created_day']
        ),
    ).toList();
  }
}
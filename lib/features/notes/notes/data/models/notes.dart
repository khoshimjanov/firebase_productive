class NoteModel {
  final int id;
  final String title;
  final String? image;
  final String desc;
  final bool voiceIcon;
  final DateTime createdDay;
  const NoteModel({
    required this.id,
    required this.title,
    required this.image,
    required this.desc,
    required this.voiceIcon,
    required this.createdDay,
  });
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) return true;
        return other is NoteModel &&
            runtimeType == other.runtimeType &&
            id == other.id &&
            title == other.title &&
            image == other.image &&
            desc == other.desc &&
            voiceIcon == other.voiceIcon &&
            createdDay == other.createdDay;

  }

  @override
  int get hashCode {
  return id.hashCode ^
    title.hashCode ^
    image.hashCode ^
    desc.hashCode ^
    voiceIcon.hashCode ^
    createdDay.hashCode;
  }

  @override
  String toString() {
    return 'NotesModel{id: $id, title: $title, image: $image,desc: $desc, voiceIcon: $voiceIcon, createdDay: $createdDay}';
  }

  NoteModel copyWith({
    int? id,
    String? title,
    String? image,
    String? desc,
    bool? voiceIcon,
    DateTime? createdDay,
  }) {
    return NoteModel(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      desc: desc ?? this.desc,
      voiceIcon: voiceIcon ?? this.voiceIcon,
      createdDay: createdDay ?? this.createdDay,
    );
  }
}



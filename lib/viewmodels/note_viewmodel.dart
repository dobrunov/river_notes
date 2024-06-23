import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/note.dart';
import '../models/note_repository.dart';
import 'package:uuid/uuid.dart';

class NoteViewModel extends StateNotifier<List<Note>> {
  final NoteRepository repository;
  NoteViewModel(this.repository) : super(repository.getNotes());

  final Uuid uuid = const Uuid();

  void addNote(String title, String content) {
    final newNote = Note(
      id: uuid.v4(),
      title: title,
      content: content,
    );
    repository.addNote(newNote);
    state = repository.getNotes();
  }

  void deleteNote(Note note) {
    repository.deleteNote(note);
    state = repository.getNotes();
  }

  void updateNote(Note updatedNote) {
    repository.updateNote(updatedNote);
    state = repository.getNotes();
  }
}

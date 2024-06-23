import 'note.dart';

abstract class NoteRepository {
  List<Note> getNotes();
  void addNote(Note note);
  void deleteNote(Note note);
  void updateNote(Note note);
}

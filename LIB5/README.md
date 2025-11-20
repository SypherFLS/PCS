# Красавин Л.В ЭФБО-10-23 ПЗ-5

## Цели ПЗ

Разработать мини-приложение "Simple Notes" для управления заметками с функциями создания, редактирования, удаления и поиска.

## Ход работы

### Шаг 1: Создание модели данных
Создана модель Note с полями id, title, body и методом copyWith для обновления заметок.

### Шаг 2: Реализация экрана редактирования
Создан экран EditNotePage с формой для создания и редактирования заметок, включая валидацию.

### Шаг 3: Реализация главного экрана
Создан экран NotesPage со списком заметок, поиском, кнопками добавления/удаления и свайп-удалением.

### Ключевые фрагменты кода

**1. Модель данных с методом copyWith:**
```dart
Note copyWith({String? title, String? body}) => Note(
  id: id,
  title: title ?? this.title,
  body: body ?? this.body,
);
```
Метод позволяет создавать копию заметки с изменёнными полями при редактировании, сохраняя оригинальный id.

**2. Фильтрация заметок по поисковому запросу:**
```dart
List<Note> get _filteredNotes {
  if (_searchQuery.isEmpty) return _notes;
  return _notes
      .where((note) =>
          note.title.toLowerCase().contains(_searchQuery.toLowerCase()))
      .toList();
}
```
Геттер фильтрует список заметок по заголовку без учёта регистра в реальном времени.

**3. Навигация с возвратом результата:**
```dart
Future<void> _addNote() async {
  final newNote = await Navigator.push<Note>(
    context,
    MaterialPageRoute(builder: (_) => const EditNotePage()),
  );
  if (newNote != null) {
    setState(() => _notes.add(newNote));
  }
}
```
Асинхронная навигация ожидает результат от экрана редактирования и добавляет новую заметку в список.

**4. Свайп-удаление через Dismissible:**
```dart
Dismissible(
  key: ValueKey(note.id),
  direction: DismissDirection.endToStart,
  background: Container(
    alignment: Alignment.centerRight,
    padding: const EdgeInsets.only(right: 20),
    color: Colors.red,
    child: const Icon(Icons.delete, color: Colors.white, size: 32),
  ),
  onDismissed: (direction) => _delete(note),
  child: Card(...),
)
```
Виджет Dismissible позволяет удалять заметки свайпом слева направо с визуальной индикацией.

**5. Валидация и сохранение формы:**
```dart
void _save() {
  if (!_formKey.currentState!.validate()) return;
  _formKey.currentState!.save();
  
  final result = (widget.existing == null)
      ? Note(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          title: _title,
          body: _body,
        )
      : widget.existing!.copyWith(title: _title, body: _body);
  
  Navigator.pop(context, result);
}
```
Метод проверяет валидацию формы, создаёт новую заметку или обновляет существующую через copyWith, затем возвращает результат на предыдущий экран.

## Видео

<video src="video.mp4" width=auto height=auto controls></video>

## Выводы

### Что получилось

Успешно реализовано приложение для управления заметками со всеми требуемыми функциями. Работает создание, редактирование и удаление заметок. Реализован поиск по заголовкам с фильтрацией в реальном времени. Добавлено свайп-удаление через Dismissible для удобного взаимодействия. Навигация между экранами работает корректно с передачей данных. Применён Material Design с использованием Card и ListTile для красивого отображения списка.

### Что было сложным

Наиболее сложным оказалась работа с асинхронной навигацией и передачей данных между экранами через Navigator.push с возвратом результата — потребовалось разобраться с типами Future и обработкой null-значений. Реализация свайп-удаления через Dismissible требовала правильной настройки direction, background и обработки события onDismissed. Фильтрация списка в реальном времени при вводе текста потребовала использования геттера и правильной работы с состоянием через setState. Использование copyWith для обновления существующих заметок без изменения id было новым подходом, который пришлось изучить. Также важно было правильно обрабатывать состояние при всех операциях CRUD через setState для обновления интерфейса.

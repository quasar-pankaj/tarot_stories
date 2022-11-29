import 'package:flutter_test/flutter_test.dart';
import 'package:sembast/timestamp.dart';
import 'package:tarot_stories/database/app_database.dart';
import 'package:tarot_stories/database/project.dart';
import 'package:tarot_stories/database/repository.dart';

void main() {
  setUp(() async {
    final Repository<Project> projects =
        Repository(storeName: AppDatabase.projects);
    await projects.deleteAll();
  });
  tearDown(() async {
    final Repository<Project> projects =
        Repository(storeName: AppDatabase.projects);
    await projects.deleteAll();
  });

  test('Inserts a new record of immutable object', () async {
    final Repository<Project> projects =
        Repository(storeName: AppDatabase.projects);

    final Project project = Project(
      name: 'Project 1 ',
      created: Timestamp.now(),
      modified: Timestamp.now(),
    );

    await projects.insert(project);
    final allProjects = await projects.getAllSortedByName();

    expect(allProjects.length, 1);
  });

  test('Updates a record of immutable object', () async {
    final Repository<Project> projects =
        Repository(storeName: AppDatabase.projects);

    final Project project = Project(
      name: 'Project 1 ',
      created: Timestamp.now(),
      modified: Timestamp.now(),
    );

    await projects.insert(project);
    var allProjects = await projects.getAllSortedByName();

    final uProject =
        project.copyWith(name: 'Project 2', modified: Timestamp.now());

    await projects.update(uProject);
    allProjects = await projects.getAllSortedByName();

    expect(allProjects.length, 1);
  });

  test('Deletes a record of immutable object', () async {
    final Repository<Project> projects =
        Repository(storeName: AppDatabase.projects);

    final Project project = Project(
      name: 'Project 1 ',
      created: Timestamp.now(),
      modified: Timestamp.now(),
    );

    project.id = await projects.insert(project);
    var allProjects = await projects.getAllSortedByName();

    await projects.delete(project);
    allProjects = await projects.getAllSortedByName();

    expect(allProjects.length, 0);
  });
}

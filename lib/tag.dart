/// A short name that can be used to group tasks. Think of a Tag in github.
class Tag {
  final String uuid;
  final String title;

  const Tag({
    required this.uuid,
    required this.title,
  });

  @override
  String toString() => 'Tag(uuid: $uuid, title: $title)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Tag && other.uuid == uuid && other.title == title;
  }

  @override
  int get hashCode => uuid.hashCode ^ title.hashCode;
}

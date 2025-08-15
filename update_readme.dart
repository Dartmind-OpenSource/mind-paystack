import 'dart:io';

void main() {
  final docsDir = Directory('docs');
  if (!docsDir.existsSync()) {
    print('Docs folder not found.');
    exit(1);
  }

  final buffer = StringBuffer()
    ..writeln('# My Project')
    ..writeln()
    ..writeln(
        '> This README automatically lists all documentation files in `/docs`')
    ..writeln()
    ..writeln('## Documentation')
    ..writeln();

  for (final entity in docsDir.listSync(recursive: true)) {
    if (entity is File && entity.path.endsWith('.mdx')) {
      final relativePath = entity.path.replaceFirst('docs/', '');
      final displayName = relativePath.replaceAll('.mdx', '');
      final link =
          'https://github.com/Dartmind-OpenSource/mind-paystack/tree/main/docs/$displayName.mdx';
      buffer.writeln('- [$displayName]($link)');
    }
  }

  final readmeFile = File('README.md');
  readmeFile.writeAsStringSync(buffer.toString());
  print('README.md updated successfully!');
}

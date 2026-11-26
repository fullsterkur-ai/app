import 'dart:io';

void main() async {
  final hookSource = File('.githooks/pre-commit');
  final hookTarget = File('.git/hooks/pre-commit');
  await hookSource.copy(hookTarget.path);
  print('Git hooks installed');
}

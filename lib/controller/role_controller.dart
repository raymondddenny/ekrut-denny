import 'package:flutter/material.dart';

class RoleProvider extends ChangeNotifier {
  final TextEditingController _titleTextEditingController =
      TextEditingController();
  final TextEditingController _descriptionTextEditingController =
      TextEditingController();
  final TextEditingController _requirementTextEditingController =
      TextEditingController();

  TextEditingController get titletexteditingcontroller =>
      _titleTextEditingController;
  TextEditingController get descriptiontexteditingcontroller =>
      _descriptionTextEditingController;
  TextEditingController get requirementtexteditingcontroller =>
      _requirementTextEditingController;

  // TODO: add HTTP Request Handle
  // TODO: integrate role page
  // TODO: integrate user page
}

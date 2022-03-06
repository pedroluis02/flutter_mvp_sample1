import 'package:flutter/material.dart';

import '../presenter/new_book_presenter.dart';
import '../view/base_stateful_page.dart';

class NewBookPage extends StatefulWidget {

  @override
  _State createState() => _State();

}

class _State extends PageStateNavbar <NewBookPage> implements NewBookView {

  NewBookPresenter presenter;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();

  _State() : super(title: 'New book');

  @override
  initState() {
    super.initState();

    presenter = NewBookPresenter(this);
  }

  @override
  Widget buildPage(BuildContext context) {
    return Center(
      child: _createForm(),
    );
  }

  Widget _createForm() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _createField(
            label: 'Title',
            controller: _titleController,
          ),
          _createField(
            label: 'Author',
            controller: _authorController,
          ),
          SizedBox(height: 32),
          ElevatedButton(
            child: const Text('Save'),
            onPressed: onSubmit,
          ),
        ],
      ),
    );
  }

  Widget _createField({String label, TextEditingController controller}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label ?? '',
        hintText: label ?? '',
      ),
      validator: _emptyValidator,
    );
  }

  String _emptyValidator(String value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter some text';
    }

    return null;
  }

  void onSubmit() {
    if(_formKey.currentState.validate()) {
      final _title = _titleController.text.trim();
      final _author = _authorController.text.trim();

      presenter.onSaveCliked(_title, _author);
    }
  }

  @override
  void onSuccessulSaved() {
    Navigator.pop(context);
  }

}
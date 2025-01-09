import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

class AddWebScreen extends StatelessWidget {
  AddWebScreen({super.key});

  final _titleController = TextEditingController();
  final _urlController = TextEditingController();

  final _formKey = GlobalKey<FormState>(); // Form key for validation

  void _getFormData(context) {
    if (_formKey.currentState!.validate()) {
      String title = _titleController.text.trim();
      String url = _urlController.text.trim();

      toastification.show(
        context: context,
        showProgressBar: false,
        alignment: Alignment.bottomCenter,
        title: Text('Page Added: $title ($url)'),
        autoCloseDuration: const Duration(seconds: 5),
      );
    }
  }

  String? _validateUrl(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a URL';
    }

    const urlPattern = r'^(https?:\/\/)?'
        r'((([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,6})|'
        r'((\d{1,3}\.){3}\d{1,3}))'
        r'(:\d+)?'
        r'(\/[a-zA-Z0-9@:%._\+~#=\/-]*)?'
        r'(\?[a-zA-Z0-9@:%._\+~#&=\/-]*)?'
        r'(#[-a-zA-Z0-9@:%._\+~#=]*)?$';
    final regex = RegExp(urlPattern);

    if (!regex.hasMatch(value)) {
      return 'Please enter a valid URL';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text('Add new page'),
          leading: IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.arrow_back)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _titleController,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontSize: 18),
                  decoration: InputDecoration(
                    hintText: 'Title or name',
                    contentPadding: const EdgeInsets.all(12),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.5, color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please enter a title'
                      : null,
                ),
                const SizedBox(
                  height: 35,
                ),
                TextFormField(
                  controller: _urlController,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontSize: 18),
                  decoration: InputDecoration(
                    hintText: 'URL',
                    contentPadding: const EdgeInsets.all(12),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.5, color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  validator: _validateUrl,
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () => _getFormData(context),
                    child: const Text('Add web page'))
              ],
            ),
          ),
        ));
  }
}

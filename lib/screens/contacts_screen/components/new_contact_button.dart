import 'package:flutter/material.dart';

import '../../add_new_contact_screen/new_contact_screen.dart';

class AddNewContactButton extends StatefulWidget {
  const AddNewContactButton({Key? key}) : super(key: key);

  @override
  State<AddNewContactButton> createState() => _NewContactButtonState();
}

class _NewContactButtonState extends State<AddNewContactButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          context: context,
          builder: (context) => const NewContactScreen(),
        ).then((value) => setState(() {}));
      },
      child: const Icon(Icons.add),
    );
  }
}

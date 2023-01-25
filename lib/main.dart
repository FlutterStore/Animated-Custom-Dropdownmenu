import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Custom Dropdown App',
      home: Home(),
    );
  }
}

const _labelStyle = TextStyle(fontWeight: FontWeight.w600);

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final formKey = GlobalKey<FormState>();
  final List<String> list = ['Developer', 'Designer', 'Consultant', 'Student','Web Designer','Node JS','React Native'];
  TextEditingController jobRoleDropdownCtrl = TextEditingController();
  TextEditingController jobRoleFormDropdownCtrl = TextEditingController();
  TextEditingController jobRoleSearchDropdownCtrl = TextEditingController();

  @override
  void dispose() {
    jobRoleDropdownCtrl.dispose();
    jobRoleFormDropdownCtrl.dispose();
    jobRoleSearchDropdownCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.white,
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
        elevation: .25,
        title: const Text(
          'Animated Custom Dropdown',
          style: TextStyle(color: Colors.white, fontSize: 15,fontWeight: FontWeight.normal),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text('Job Roles Dropdown', style: _labelStyle),
          const SizedBox(height: 8),
          CustomDropdown(
            hintText: 'Select job role',
            items: list,
            controller: jobRoleDropdownCtrl,
            excludeSelected: false,
          ),
          const SizedBox(height: 24),
          const Divider(height: 0),
          const SizedBox(height: 24),
          // dropdown having search field
          const Text('Job Roles Search Dropdown', style: _labelStyle),
          const SizedBox(height: 8),
          CustomDropdown.search(
            hintText: 'Select job role',
            items: list,
            controller: jobRoleSearchDropdownCtrl,
          ),
          const SizedBox(height: 24),
          const Divider(height: 0),
          const SizedBox(height: 24),

          // using form for validation
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Job Roles Dropdown with Form validation',
                  style: _labelStyle,
                ),
                const SizedBox(height: 8),
                CustomDropdown(
                  hintText: 'Select job role',
                  items: list,
                  controller: jobRoleFormDropdownCtrl,
                  excludeSelected: false,
                  listItemBuilder: (context, result) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text(result), const Icon(Icons.person)],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
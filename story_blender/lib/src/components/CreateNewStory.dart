import 'package:flutter/material.dart';
import 'package:story_blender/src/components/LandingPage.dart';
import 'package:story_blender/src/common/TextSection.dart';

import '../settings/settings_view.dart';

/// Landing page for the application
class CreateNewStory extends StatelessWidget {
  const CreateNewStory({
    super.key,
  });

  static const routeName = '/create_new_story';

  @override
  Widget build(BuildContext context) {
    goHome() {
      Navigator.restorablePushNamed(context, LandingPage.routeName);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a new story!'),
        actions: [
          FilledButton(onPressed: goHome, child: const Text('Home')),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            TextSection(
              description:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc egestas '
                  'quam non hendrerit ullamcorper, nisl tortor iaculis arcu, molestie mattis lectus sem faucibus ipsum. '
                  'Proin vitae velit porta, gravida sem tincidunt, laoreet leo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                  'Donec commodo mauris efficitur, tristique diam eu, sodales risus. In est leo, tempor at sagittis dapibus, placerat a nibh. '
                  'Curabitur quam sapien, imperdiet sit amet malesuada in, mollis et urna. Etiam aliquet lorem eu nisl faucibus, in pharetra nisi ultricies. '
                  'Praesent nunc libero, interdum sed rhoncus sit amet, pharetra sed purus.',
            ),
            OptionsSection(),
          ],
        ),
      ),
    );
  }
}


class OptionsSection extends StatelessWidget {

  const OptionsSection({
    super.key
  });


  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;

    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonWithText(color: color, icon: Icons.create, label: 'Start From Scratch', onPressed: () {}),
          ButtonWithText(color: color, icon: Icons.auto_stories, label: 'Use Template', onPressed: () {}),
        ],
      )
    );
  }
}


class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  final Color color;
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 52),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: ElevatedButton(
              onPressed: onPressed,
              child: Text(label)),
        ),
      ],
    );
  }
}
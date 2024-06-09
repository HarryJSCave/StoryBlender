import 'package:flutter/material.dart';
import 'package:story_blender/src/components/CreateNewStory.dart';
import 'package:story_blender/src/common/TextSection.dart';
import 'package:story_blender/src/common/WidgetsSection.dart';

import '../settings/settings_view.dart';

/// Landing page for the application
class LandingPage extends StatelessWidget {
  const LandingPage({
    super.key,
  });

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Story Blender';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to $appTitle'),
        actions: [
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
            ButtonsSection(),
          ],
        ),
      ),
    );
  }
}

class ButtonsSection extends StatelessWidget {
  const ButtonsSection({
    super.key,
    this.direction = 'row',
  });

  /// 'row' or 'column' @default row
  final String direction;

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    onPressed() {} // TODO: does nothing for now

    onNewStory() {
      Navigator.restorablePushNamed(context, CreateNewStory.routeName);
    }

    // return SizedBox(
    //   child: direction == 'row' ? Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //     children: [
    //       ElevatedButton(
    //           onPressed: () {
    //             Navigator.restorablePushNamed(
    //                 context, CreateNewStory.routeName);
    //           },
    //           child: const Text('Create New Story')),
    //       FilledButton(
    //           onPressed: onPressed, child: const Text('Continue Story')),
    //     ],
    //   ) : Column(
    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //     children: [
    //       ElevatedButton(
    //           onPressed: () {
    //             Navigator.restorablePushNamed(
    //                 context, CreateNewStory.routeName);
    //           },
    //           child: const Text('Create New Story')),
    //       FilledButton(
    //           onPressed: onPressed, child: const Text('Continue Story')),
    //     ],
    //   ),
    // );

    final widgets = [
      ElevatedButton(
          onPressed: () {
            Navigator.restorablePushNamed(context, CreateNewStory.routeName);
          },
          child: const Text('Create New Story')),
      FilledButton(onPressed: onPressed, child: const Text('Continue Story')),
    ];

    return WidgetsSection(widgets: widgets);
  }
}

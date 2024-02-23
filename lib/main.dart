import 'package:flutter/material.dart';
import 'package:story_chooser/storyFactory.dart';

void main() {
  runApp(const StoryChooser());
}

class StoryChooser extends StatelessWidget {
  const StoryChooser({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
          body: SafeArea(
        child: StoryViewer(),
      )),
    );
  }
}

class StoryViewer extends StatefulWidget {
  const StoryViewer({super.key});

  @override
  State<StoryViewer> createState() => _StoryViewer();
}

class _StoryViewer extends State<StoryViewer> {
  StoryFactory storyFactory = StoryFactory();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/background.png'), fit: BoxFit.cover)),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Center(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
            Expanded(
                flex: 5,
                child: Container(
                  width: MediaQuery.of(context).size.width - 50,
                  child: Center(
                    child: Text(
                      storyFactory.getListStoryTitle()!,
                      style: const TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                )),
            Expanded(
                flex: 1,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffff002b),
                        elevation: 0,
                        fixedSize: Size.fromWidth(
                            MediaQuery.of(context).size.width - 50),
                        shape: const LinearBorder()),
                    onPressed: () {
                      setState(() {
                        storyFactory.selectNextStory(1);
                      });
                    },
                    child: Text(storyFactory.getListStoryChoice1()!,
                        style: const TextStyle(
                            color: Colors.white, fontSize: 16)))),
            const SizedBox(height: 16),
            if (storyFactory.getCurrentStory() < 3) Expanded(
                flex: 1,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff407ba7),
                        elevation: 0,
                        fixedSize: Size.fromWidth(
                            MediaQuery.of(context).size.width - 50),
                        shape: const LinearBorder()),
                    onPressed: () {
                      setState(() {
                        storyFactory.selectNextStory(2);
                      });
                    },
                    child: Text(storyFactory.getListStoryChoice2()!,
                        style: const TextStyle(
                            color: Colors.white, fontSize: 16))))
          ])),
        ),
      ),
    );
  }
}

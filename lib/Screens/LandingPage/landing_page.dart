import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:video_player/video_player.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      'https://filedn.com/lHkTDYuRdbmBzmcg2d5Vx6b/nurow1.mp4',
    )..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.

        setState(() {});
      });
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      // mutes the video
      _controller.setVolume(0);
      // Plays the video once the widget is build and loaded.
      _controller.play();
    });

    _controller.setLooping(true);
    // _controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Container(
          padding: const EdgeInsets.all(20),
          color: Colors.grey[400],
          child: Center(
              child: sizingInformation.isDesktop
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _controller.value.isInitialized
                            ? SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height:
                                    MediaQuery.of(context).size.height * 0.7,
                                child: AspectRatio(
                                  aspectRatio: 0.4,
                                  child: VideoPlayer(
                                    _controller,
                                  ),
                                ),
                              )
                            : const Center(
                                child: CircularProgressIndicator(),
                              ),
                        Container(
                          padding: const EdgeInsets.all(15),
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.7,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 140,
                                width: 140,
                                child: Image.network(
                                    'https://i.ibb.co/bzyPjVc/X-Icon.png'),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              const Text(
                                """
Id mollit amet ad est. Ex id Lorem culpa ea. Elit dolor culpa ea sint pariatur deserunt eu esse sint eu. Cillum ipsum commodo dolore culpa incididunt mollit irure excepteur aliqua deserunt ipsum nostrud consectetur.

Aute pariatur incididunt non culpa sit velit. Sit ex amet esse quis pariatur amet incididunt Lorem aliqua elit culpa dolore. Eu eiusmod Lorem sint consequat pariatur. Occaecat minim quis culpa nostrud deserunt cillum ex.

""",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(),
                            ],
                          ),
                        ),
                      ],
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 80,
                            width: 280,
                            child: Image.network(
                                'https://i.ibb.co/bzyPjVc/X-Icon.png'),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          _controller.value.isInitialized
                              ? SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  height:
                                      MediaQuery.of(context).size.height * 0.4,
                                  child: AspectRatio(
                                    aspectRatio: 0.4,
                                    child: VideoPlayer(
                                      _controller,
                                    ),
                                  ),
                                )
                              : const Center(
                                  child: CircularProgressIndicator(),
                                ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.7,
                            child: Column(
                              children: const [
                                Text(
                                  """
Id mollit amet ad est. Ex id Lorem culpa ea. Elit dolor culpa ea sint pariatur deserunt eu esse sint eu. Cillum ipsum commodo dolore culpa incididunt mollit irure excepteur aliqua deserunt ipsum nostrud consectetur.

Aute pariatur incididunt non culpa sit velit. Sit ex amet esse quis pariatur amet incididunt Lorem aliqua elit culpa dolore. Eu eiusmod Lorem sint consequat pariatur. Occaecat minim quis culpa nostrud deserunt cillum ex.

""",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

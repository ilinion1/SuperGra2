import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_gra_pro/ASDFsrcADF/SDAFcontrollersASD/DFAmoney_controllerSADF.dart';
import 'package:video_player/video_player.dart';

class DGDSAdScreenAGR extends StatefulWidget {
  final String videoAsset;

  const DGDSAdScreenAGR({
    super.key,
    required this.videoAsset,
  });

  @override
  State<DGDSAdScreenAGR> createState() => _DGDSAdScreenAGRState();
}

class _DGDSAdScreenAGRState extends State<DGDSAdScreenAGR> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  late final Timer _timer;

  bool _videoCompleted = false;

  @override
  void initState() {
    super.initState();

    _timer = Timer(const Duration(seconds: 30), () {
      _videoCompleted = true;
    });

    _controller = VideoPlayerController.asset(widget.videoAsset);
    _initializeVideoPlayerFuture = _controller.initialize();

    _controller.addListener(() async {
      if (_videoCompleted) {
        await context.read<SAFEMoneyCubitASEF>().setMoney(100);
        if (mounted) Navigator.pop(context);
      }
    });

    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  bool _canPop() {
    return _videoCompleted;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: PopScope(
            canPop: _canPop(),
            child: FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

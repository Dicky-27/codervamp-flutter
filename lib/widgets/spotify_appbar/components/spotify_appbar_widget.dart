import 'package:codervamp/utils/assets.dart';
import 'package:codervamp/widgets/spotify_appbar/spotify_playlist_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

class SpotifyPlaylistAppBar extends StatelessWidget {
  const SpotifyPlaylistAppBar({
    Key? key,
    required this.maxAppBarHeight,
    required this.minAppBarHeight,
  }) : super(key: key);

  final double maxAppBarHeight;
  final double minAppBarHeight;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
        pinned: true,
        delegate: SliverAppBarDelegate(
            maxHeight: maxAppBarHeight,
            minHeight: minAppBarHeight,
            builder: (context, shrinkOffset) {
              final double shrinkRatio = shrinkOffset / maxAppBarHeight;
              final bool animateOpacityToZero = shrinkRatio > 0.6;
              const double animatePlaylistImageFromPoint = 0.4;
              final double playlistImageSize =
                  MediaQuery.of(context).size.height * 0.3 - shrinkOffset / 2;
              final bool animatePlaylistImage =
                  shrinkRatio >= animatePlaylistImageFromPoint;
              final double? playlistPositionFromTop = animatePlaylistImage
                  ? (animatePlaylistImageFromPoint - shrinkRatio) *
                      maxAppBarHeight
                  : null;
              final bool showFixedAppBar = shrinkRatio > 0.7;
              final double titleOpacity = showFixedAppBar
                  ? 1 - (maxAppBarHeight - shrinkOffset) / minAppBarHeight
                  : 0;

              return Stack(
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    top: playlistPositionFromTop,
                    child: PLaylistImage(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top + 15,
                          right: 10,
                          left: 10),
                      animateOpacityToZero: animateOpacityToZero,
                      animateImage: animatePlaylistImage,
                      shrinkToMaxAppBarHeightRatio: shrinkRatio,
                      imageSize: playlistImageSize,
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    decoration: BoxDecoration(
                      gradient: showFixedAppBar
                          ? const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                kAppBarPrimary,
                                kAppBarSecondary,
                              ],
                            )
                          : null,
                    ),
                    child: SpotifyFixedAppBar(titleOpacity: titleOpacity),
                  ),
                ],
              );
            }));
  }
}

// Delegate
typedef SliverAppBarDelegateBuilder = Widget Function(
  BuildContext context,
  double shrinkOffset,
);

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.builder,
  });
  final double minHeight;
  final double maxHeight;
  final SliverAppBarDelegateBuilder builder;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: builder(context, shrinkOffset),
    );
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        builder != oldDelegate.builder;
  }
}

// Playlist Image
class PLaylistImage extends StatelessWidget {
  const PLaylistImage({
    Key? key,
    required this.padding,
    required this.animateOpacityToZero,
    required this.animateImage,
    required this.shrinkToMaxAppBarHeightRatio,
    required this.imageSize,
  }) : super(key: key);

  final EdgeInsets padding;
  final bool animateOpacityToZero;
  final bool animateImage;
  final double shrinkToMaxAppBarHeightRatio;
  final double imageSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: padding,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 100),
          opacity: animateOpacityToZero
              ? 0
              : animateImage
                  ? 1 - shrinkToMaxAppBarHeightRatio
                  : 1,
          child: Container(
            height: imageSize,
            width: imageSize,
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent,
              image: const DecorationImage(
                image: AssetImage(Assets.IMG_PLAY_3),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black87.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 20,
                ),
              ],
            ),
          ),
        ));
  }
}

// Fixed Appbar
class SpotifyFixedAppBar extends StatelessWidget {
  const SpotifyFixedAppBar({
    Key? key,
    required this.titleOpacity,
  }) : super(key: key);

  final double titleOpacity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
          bottom: 5,
          right: 10,
          left: 10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          textBaseline: TextBaseline.ideographic,
          children: [
            const Icon(
              Icons.chevron_left,
              color: Colors.white,
              size: 30,
            ),
            const Spacer(),
            AnimatedOpacity(
              opacity: titleOpacity.clamp(0, 1),
              duration: const Duration(milliseconds: 100),
              child: Text("1(Remastered)",
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  )),
            ),
            const Spacer(),
            const SizedBox(width: 30)
          ],
        ),
      ),
    );
  }
}

// Play Pause Button
class PlayButton extends StatefulWidget {
  const PlayButton({
    Key? key,
    required this.scrollController,
    required this.maxAppBarHeight,
    required this.minAppBarHeight,
    required this.playPauseButtonSize,
    required this.infoBoxHeight,
  }) : super(key: key);

  final ScrollController scrollController;
  final double maxAppBarHeight;
  final double minAppBarHeight;
  final double playPauseButtonSize;
  final double infoBoxHeight;

  @override
  State<PlayButton> createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> {
  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(() {
      setState(() {});
    });
  }

  double get getPositionFromTop {
    double position = widget.maxAppBarHeight;
    double finalPosition =
        widget.minAppBarHeight - widget.playPauseButtonSize / 0.9;

    if (widget.scrollController.hasClients) {
      double offset = widget.scrollController.offset;
      double addOrSubtractValue =
          widget.infoBoxHeight - widget.playPauseButtonSize - 10;
      bool isFinalPosition =
          offset > (position - finalPosition + addOrSubtractValue);
      position = isFinalPosition
          ? finalPosition
          : (position - offset + addOrSubtractValue);
    }

    return position;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: getPositionFromTop,
      right: 10,
      child: ElevatedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: kPlayPauseButtonColor,
          fixedSize:
              Size(widget.playPauseButtonSize, widget.playPauseButtonSize),
          shape: const CircleBorder(),
        ),
        onPressed: () {},
        child: const Icon(
          Icons.play_arrow,
          color: Colors.black,
          size: 30,
        ),
      ),
    );
  }
}

import 'package:codervamp/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/spotify_appbar_widget.dart';

// Sample Colors
const Color kPrimaryColor = Color(0xFFC63224);
const Color kPlayPauseButtonColor = Color(0xFF1DB954);
const Color kAppBarPrimary = Color(0xFFC63224);
const Color kAppBarSecondary = Color(0xFF641D17);

class SpotifyPlaylistPage extends StatefulWidget {
  const SpotifyPlaylistPage({Key? key}) : super(key: key);

  @override
  State<SpotifyPlaylistPage> createState() => _SpotifyPlaylistPageState();
}

class _SpotifyPlaylistPageState extends State<SpotifyPlaylistPage> {
  late ScrollController _scrollController;
  late double maxAppBarHeight;
  late double minAppBarHeight;
  late double playPauseButtonSize;
  late double infoBoxHeight;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    maxAppBarHeight = MediaQuery.of(context).size.height * 0.41;
    minAppBarHeight = MediaQuery.of(context).padding.top +
        MediaQuery.of(context).size.height * 0.1;
    playPauseButtonSize = (MediaQuery.of(context).size.width / 320) * 50 > 80
        ? 40
        : (MediaQuery.of(context).size.width / 320) * 40;
    infoBoxHeight = 160;

    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                kPrimaryColor,
                Colors.black,
              ],
              stops: [
                0,
                0.7
              ]),
        ),
        child: Stack(
          children: [
            CustomScrollView(
              controller: _scrollController,
              slivers: [
                SpotifyPlaylistAppBar(
                  maxAppBarHeight: maxAppBarHeight,
                  minAppBarHeight: minAppBarHeight,
                ),
                PlaylistInfo(infoBoxHeight: infoBoxHeight),
                const SongsList(),
              ],
            ),
            PlayButton(
                scrollController: _scrollController,
                maxAppBarHeight: maxAppBarHeight,
                minAppBarHeight: minAppBarHeight,
                playPauseButtonSize: playPauseButtonSize,
                infoBoxHeight: infoBoxHeight)
          ],
        ),
      ),
    );
  }
}

/// Playslist info
class PlaylistInfo extends StatelessWidget {
  const PlaylistInfo({
    Key? key,
    required this.infoBoxHeight,
  }) : super(key: key);

  final double infoBoxHeight;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black87,
              ],
              stops: [
                0.00022,
                1.0,
              ]),
        ),
        child: SizedBox(
          height: infoBoxHeight,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "1(Remastered)",
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage(Assets.IMG_PROFILE_1),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Coldplay",
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Playlist . 2024",
                  style: GoogleFonts.montserrat(
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.add_circle_outline,
                      color: Colors.white,
                    ),
                    SizedBox(width: 15),
                    Icon(
                      Icons.download_for_offline_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(width: 15),
                    Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// SongsList
class SongsList extends StatelessWidget {
  const SongsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 20,
        (context, index) => Container(
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        Assets.IMG_PLAY_1,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Yellow",
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                        const SizedBox(height: 3),
                        Text("Coldplay",
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                    )
                  ],
                ))),
      ),
    );
  }
}

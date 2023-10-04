import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

Color greenTouch = Vx.hexToColor("788154");

class M2 extends StatelessWidget {
  const M2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vx.hexToColor("#e8eddb"),
      //we have to make sure it should also work on web
      body: SafeArea(
        child: Column(
          children: [
            //calender view
            CalenderView().p24().h(context.percentHeight * 40),
            //music player view
            const MusicPlayerView() //chat view
          ],
        ),
      ),
      //bottom navigation bar
      bottomNavigationBar: BottomBar(),
    );
  }
}

class MusicPlayerView extends StatelessWidget {
  const MusicPlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    return myRoundedBox(
        child: Column(
      children: [
        VxCapsule(
          backgroundColor: Vx.hexToColor("#c4ecd4"),
          width: 128,
          height: 28,
          child: [
            const Icon(
              Icons.phone_android,
            ).scale50(),
            const Text('Flutter')
          ].hStack(),
        ).objectCenterRight(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VxBox()
                .square(90)
                .bgImage(DecorationImage(
                    image: NetworkImage("https://picsum.photos/500"),
                    fit: BoxFit.cover))
                .rounded
                .make(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Flutter playlist here').text.semiBold.make(),
                const Text('Youtuber here').text.sm.make()
              ],
            ).px16()
          ],
        ),
        Slider(
          value: 35,
          onChanged: (value) {},
          inactiveColor: Colors.black,
          activeColor: Colors.black,
          min: 0,
          max: 100,
        ),
        const HStack([
          Icon(
            Icons.shuffle,
            size: 24,
          ),
          Spacer(),
          Icon(
            Icons.skip_previous,
            size: 24,
          ),
          Spacer(),
          Icon(
            Icons.play_arrow,
            size: 24,
          ),
          Spacer(),
          Icon(
            Icons.skip_next,
            size: 24,
          ),
          Spacer(),
          Icon(
            Icons.repeat,
            size: 24,
          ),
          Spacer(),

        ],
        alignment: MainAxisAlignment.spaceAround,).p16()
      ],
    ));
  }
}

class CalenderView extends StatelessWidget {
  const CalenderView({super.key});

  @override
  Widget build(BuildContext context) {
    return myRoundedBox(
        child: Row(
      children: [
        VStack([
          const Text("Oct")
              .text
              .xl4
              .tighter
              .fontFamily(GoogleFonts.poppins().fontFamily!)
              .make(),
          const Text('5')
              .text
              .xl6
              .size(19)
              .tightest
              .bold
              .color(Vx.hexToColor("595236"))
              .fontFamily(GoogleFonts.poppins().fontFamily!)
              .make(),
        ]),
        VStack([
          VxCapsule(
            width: context.percentWidth * 50,
            height: 30,
            backgroundColor: greenTouch,
            child: Text('Made with love').text.white.make().px12(),
          ),
          Spacer(),
          VStack([
            const Text('Created At').text.make(),
            const Text('00:12AM-2:00AM').text.make()
          ])
              .box
              .border(color: greenTouch, width: 3)
              .p16
              .rounded
              .width(context.percentWidth * 50)
              .make(),
          Spacer(),
          VxCapsule(
            width: context.percentWidth * 50,
            height: 30,
            backgroundColor: Vx.yellow200,
            child: Text('Material Ui').text.make().px12(),
          )
        ])
      ],
    ));
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: myRoundedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: greenTouch,
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          const GreenIcon(
            icon: Icons.mic,
          ),
          const GreenIcon(icon: Icons.bookmark_outlined),
          const GreenIcon(icon: Icons.calendar_today),
          const GreenIcon(icon: Icons.brush),
        ],
      ),
    ).p2());
  }
}

class GreenIcon extends StatelessWidget {
  const GreenIcon({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: greenTouch,
    );
  }
}

class myRoundedBox extends StatelessWidget {
  const myRoundedBox({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return VxBox(child: child)
        .color(Vx.hexToColor("fff6db"))
        .roundedLg
        .p24
        .make();
  }
}

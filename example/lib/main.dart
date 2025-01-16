import 'package:flutter/material.dart';
import 'package:segmented_button_slide/segmented_button_slide.dart';

void main() {
  runApp(const SegmentedButtonDemo());
}

class SegmentedButtonDemo extends StatefulWidget {
  const SegmentedButtonDemo({super.key});

  @override
  State<SegmentedButtonDemo> createState() => _SegmentedButtonDemoState();
}

class _SegmentedButtonDemoState extends State<SegmentedButtonDemo> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Segmented Button Demo',
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FractionallySizedBox(
              widthFactor: 0.5,
              child: SegmentedButtonSlide(
                entries: const [
                  SegmentedButtonSlideEntry(
                    icon: Icons.home_rounded,
                    label: "Home",
                  ),
                  SegmentedButtonSlideEntry(
                    icon: Icons.list_rounded,
                    label: "List",
                  ),
                  SegmentedButtonSlideEntry(
                    icon: Icons.settings_rounded,
                    label: "Settings",
                  ),
                ],
                selectedEntry: _selected,
                onChange: (selected) => setState(() => _selected = selected),
                colors: SegmentedButtonSlideColors(
                  barColor: Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withAlpha((0.5 * 255).toInt()),
                  backgroundSelectedColor:
                      Theme.of(context).colorScheme.primaryContainer,
                ),
                slideShadow: const [
                  BoxShadow(
                    color: Colors.blue,
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
                margin: const EdgeInsets.all(16),
                height: 70,
                padding: const EdgeInsets.all(16),
                borderRadius: BorderRadius.circular(8),
                selectedTextStyle: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.green,
                ),
                unselectedTextStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.red,
                ),
                hoverTextStyle: const TextStyle(
                  color: Colors.orange,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const _CustomWidgetSegmentedButtonSlideEntry(),
          ],
        ),
      ),
    );
  }
}

class _CustomWidgetSegmentedButtonSlideEntry extends StatefulWidget {
  const _CustomWidgetSegmentedButtonSlideEntry();

  @override
  State<_CustomWidgetSegmentedButtonSlideEntry> createState() =>
      _CustomWidgetSegmentedButtonSlideEntryState();
}

class _CustomWidgetSegmentedButtonSlideEntryState
    extends State<_CustomWidgetSegmentedButtonSlideEntry> {
  int _selected = 0;
  bool _hoverLightning = false;
  bool _hoverBitcoin = false;

  @override
  Widget build(BuildContext context) {
    const animationDuration = Duration(milliseconds: 250);
    const curve = Curves.ease;
    const selectedTextStyle = TextStyle(
      color: Color(0xFFF2F2F7),
      fontSize: 13,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.08,
    );
    const unselectedTextStyle = TextStyle(
      color: Color(0XFF000000),
      fontSize: 13,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.08,
    );
    const hoverTextStyle = TextStyle(
      color: Color.fromARGB(255, 220, 10, 10),
      fontSize: 13,
      fontWeight: FontWeight.w800,
      letterSpacing: -0.08,
    );
    const selectedTextStyle2 = TextStyle(
      color: Color(0xFFF2F2F7),
      fontSize: 11,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.06,
    );
    const unselectedTextStyle2 = TextStyle(
      color: Color(0XFF000000),
      fontSize: 11,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.06,
    );
    const hoverTextStyle2 = TextStyle(
      color: Color.fromARGB(255, 220, 10, 10),
      fontSize: 11,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.06,
    );
    const iconSize = 20.0;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 393,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: SegmentedButtonSlide(
            entries: [
              SegmentedButtonSlideEntry(
                widget: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        _selected = 0;
                      });
                    },
                    onHover: (v) => setState(
                      () {
                        debugPrint('Lightning hovered: $v');
                        _hoverLightning = v;
                      },
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            AnimatedEntryIcon(
                              icon: Icons.bolt,
                              activeColor: selectedTextStyle.color!,
                              normalColor: unselectedTextStyle.color!,
                              hoverColor: hoverTextStyle.color!,
                              isActive: _selected == 0,
                              isHover: _hoverLightning,
                              size: iconSize,
                              duration: animationDuration,
                              curve: curve,
                            ),
                            AnimatedDefaultTextStyle(
                              duration: animationDuration,
                              curve: curve,
                              style: _selected == 0
                                  ? selectedTextStyle
                                  : _hoverLightning
                                      ? hoverTextStyle
                                      : unselectedTextStyle,
                              child: const Text(
                                'Lightning',
                              ),
                            ),
                          ],
                        ),
                        AnimatedDefaultTextStyle(
                          duration: animationDuration,
                          curve: curve,
                          style: _selected == 0
                              ? selectedTextStyle
                              : _hoverLightning
                                  ? hoverTextStyle
                                  : unselectedTextStyle,
                          child: const Text(
                            '~seconds',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SegmentedButtonSlideEntry(
                widget: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        _selected = 1;
                      });
                    },
                    onHover: (v) => setState(
                      () {
                        debugPrint('Bitcoin hovered: $v');
                        _hoverBitcoin = v;
                      },
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            AnimatedEntryIcon(
                              icon: Icons.currency_bitcoin,
                              activeColor: selectedTextStyle.color!,
                              normalColor: unselectedTextStyle.color!,
                              hoverColor: hoverTextStyle2.color!,
                              isActive: _selected == 1,
                              isHover: _hoverBitcoin,
                              size: iconSize,
                              duration: animationDuration,
                              curve: curve,
                            ),
                            AnimatedDefaultTextStyle(
                              duration: animationDuration,
                              curve: curve,
                              style: _selected == 1
                                  ? selectedTextStyle2
                                  : _hoverBitcoin
                                      ? hoverTextStyle2
                                      : unselectedTextStyle2,
                              child: const Text(
                                'Bitcoin',
                              ),
                            ),
                          ],
                        ),
                        AnimatedDefaultTextStyle(
                          duration: animationDuration,
                          curve: curve,
                          style: _selected == 1
                              ? selectedTextStyle2
                              : _hoverBitcoin
                                  ? hoverTextStyle2
                                  : unselectedTextStyle2,
                          child: const Text(
                            '~30 min',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
            selectedEntry: _selected,
            onChange: (selected) => setState(() => _selected = selected),
            colors: const SegmentedButtonSlideColors(
              barColor: Color(0xFFF5F5F7),
              backgroundSelectedColor: Color(0xFF00CA5E),
            ),
            animationDuration: animationDuration,
            curve: curve,
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 4,
            ),
            height: 48,
            borderRadius: BorderRadius.circular(6),
            selectedTextStyle: selectedTextStyle,
            unselectedTextStyle: unselectedTextStyle,
            hoverTextStyle: hoverTextStyle,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    //

    super.dispose();
  }
}

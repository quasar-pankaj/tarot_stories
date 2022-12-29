import 'package:flutter/material.dart';
import 'package:tarot_stories/spread_icons/backstory_layout.dart';
import 'package:tarot_stories/spread_icons/character_cross_layout.dart';
import 'package:tarot_stories/spread_icons/five_card_horiz_layout.dart';
import 'package:tarot_stories/spread_icons/four_card_horiz_layout.dart';
import 'package:tarot_stories/spread_icons/four_card_vert_layout.dart';
import 'package:tarot_stories/spread_icons/three_card_horiz_layout.dart';
import 'package:tarot_stories/spread_icons/three_card_vert_layout.dart';
import 'package:tarot_stories/spread_icons/two_card_horiz_layout.dart';
import 'package:tarot_stories/spread_icons/two_card_vert_layout.dart';

import '../../spread_icons/single_card_layout.dart';

enum SpreadShape {
  horiz1(
    name: 'Horizontal One Card',
    widget: SingleCardLayout(label1: '1'),
  ),
  horiz2(
    name: 'Horizontal Two Card',
    widget: TwoCardHorizLayout(
      label1: '1',
      label2: '2',
    ),
  ),
  horiz3(
    name: 'Horizontal Three Card',
    widget: ThreeCardHorizLayout(
      label1: '1',
      label2: '2',
      label3: '3',
    ),
  ),
  horiz4(
    name: 'Horizontal Four Card',
    widget: FourCardHorizLayout(
      label1: '1',
      label2: '2',
      label3: '3',
      label4: '4',
    ),
  ),
  horiz5(
    name: 'Horizontal Five Card',
    widget: FiveCardHorizLayout(
      card1: '1',
      card2: '2',
      card3: '3',
      card4: '4',
      card5: '5',
    ),
  ),
  vert2(
    name: 'Vertical Two Card',
    widget: TwoCardVertLayout(
      label1: '1',
      label2: '2',
    ),
  ),
  vert3(
    name: 'Vertical Three Card',
    widget: ThreeCardVertLayout(
      label1: '1',
      label2: '2',
      label3: '3',
    ),
  ),
  vert4(
    name: 'Vertical Four Card',
    widget: FourCardVertLayout(
      label1: '1',
      label2: '2',
      label3: '3',
      label4: '4',
    ),
  ),
  goalMotivationConflict(
    name: 'Goal-Motivation-Conflict',
    widget: ThreeCardHorizLayout(
      label1: 'G',
      label2: 'M',
      label3: 'C',
    ),
  ),
  goalConflictDisaster(
    name: 'Goal-Conflict-Disaster',
    widget: ThreeCardHorizLayout(
      label1: 'G',
      label2: 'C',
      label3: 'D',
    ),
  ),
  reactionDilemmaDecision(
    name: 'Reaction-Dilemma-Decision',
    widget: ThreeCardHorizLayout(
      label1: 'R',
      label2: 'D',
      label3: 'D',
    ),
  ),
  actionReactionMovement(
    name: 'Action-Reaction-Movement',
    widget: ThreeCardHorizLayout(
      label1: 'A',
      label2: 'R',
      label3: 'M',
    ),
  ),
  thesisAntithesisSynthesis(
    name: 'Thesis-Antithesis-Synthesis',
    widget: ThreeCardHorizLayout(
      label1: 'T',
      label2: 'A',
      label3: 'S',
    ),
  ),
  fiveSenses(
    name: '5 Senses',
    widget: FiveCardHorizLayout(
      card1: 'V',
      card2: 'H',
      card3: 'S',
      card4: 'T',
      card5: 'T',
    ),
  ),
  characterCross(
    name: 'Character Cross',
    widget: CharacterCrossLayout(
      card1: '1',
      card2: '2',
      card3: '3',
      card4: '4',
      card5: '5',
      card6: '6',
    ),
  ),
  backstory(
    name: 'Backstory',
    widget: BackstoryLayout(
      card1: '1',
      card2: '2',
      card3: '3',
      card4: '4',
    ),
  ),
  celticCross(
    name: 'Celtic Cross',
    widget: SingleCardLayout(
      label1: '1',
    ),
  ), //this is a temporary measure change later
  pentagram(
    name: 'Pentagram',
    widget: SingleCardLayout(
      label1: '1',
    ),
  ), //this is a temporary measure change later
  hexagram(
    name: 'Hexagram',
    widget: SingleCardLayout(
      label1: '1',
    ),
  ), //this is a temporary measure change later
  herosJourney12Circular(
    name: "Hero's Journey 12 Card Circular",
    widget: SingleCardLayout(
      label1: '1',
    ),
  ), //this is a temporary measure change later
  herosJourney16Circular(
    name: "Hero's Journey 16 Card Circular",
    widget: SingleCardLayout(
      label1: '1',
    ),
  ), //this is a temporary measure change later
  herosJourney12MByN(
    name: "Hero's Journey 12 Card 4x3",
    widget: SingleCardLayout(
      label1: '1',
    ),
  ), //this is a temporary measure change later
  herosJourney16MByN(
    name: "Hero's Journey 16 Card 4x4",
    widget: SingleCardLayout(
      label1: '1',
    ),
  ), //this is a temporary measure change later
  blakeSnyderBeatSheet(
    name: 'Blake Snyder\'s Beat Sheet',
    widget: SingleCardLayout(
      label1: '1',
    ),
  ), //this is a temporary measure change later
  threeDisasterFourAct(
    name: '3 Disaster 4 Act',
    widget: SingleCardLayout(
      label1: '1',
    ),
  ), //this is a temporary measure change later
  superStructure(
    name: 'Superstructure',
    widget: SingleCardLayout(
      label1: '1',
    ),
  ), //this is a temporary measure change later
  fourteenPointStructure(
    name: 'Fourteen Point Structure',
    widget: SingleCardLayout(
      label1: '1',
    ),
  ), //this is a temporary measure change later
  relationship2Way(
    name: 'Two Way Relationship',
    widget: SingleCardLayout(
      label1: '1',
    ),
  ), //this is a temporary measure change later
  relationship3Way(
    name: 'Three Way Relationship',
    widget: SingleCardLayout(
      label1: '1',
    ),
  ), //this is a temporary measure change later
  triangle(
    name: 'Triangle',
    widget: SingleCardLayout(
      label1: '1',
    ),
  ), //this is a temporary measure change later
  square(
    name: 'Square',
    widget: SingleCardLayout(
      label1: '1',
    ),
  ); //this is a temporary measure change later

  final String _name;
  final Widget _widget;

  const SpreadShape({
    required String name,
    required Widget widget,
  })  : _name = name,
        _widget = widget;

  Widget get widget => _widget;

  @override
  String toString() => _name;
}

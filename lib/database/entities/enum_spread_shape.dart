import 'package:flutter/material.dart';

import '../../spread_icons/backstory_layout.dart';
import '../../spread_icons/character_cross_layout.dart';
import '../../spread_icons/five_card_horiz_layout.dart';
import '../../spread_icons/four_card_horiz_layout.dart';
import '../../spread_icons/four_card_vert_layout.dart';
import '../../spread_icons/single_card_layout.dart';
import '../../spread_icons/three_card_horiz_layout.dart';
import '../../spread_icons/three_card_vert_layout.dart';
import '../../spread_icons/two_card_horiz_layout.dart';
import '../../spread_icons/two_card_vert_layout.dart';

enum SpreadShape {
  horiz1(
    name: 'Horizontal One Card',
    widget: SingleCardLayout(label1: '1'),
    numCards: 1,
  ),
  horiz2(
    name: 'Horizontal Two Card',
    widget: TwoCardHorizLayout(
      label1: '1',
      label2: '2',
    ),
    numCards: 2,
  ),
  horiz3(
    name: 'Horizontal Three Card',
    widget: ThreeCardHorizLayout(
      label1: '1',
      label2: '2',
      label3: '3',
    ),
    numCards: 3,
  ),
  horiz4(
    name: 'Horizontal Four Card',
    widget: FourCardHorizLayout(
      label1: '1',
      label2: '2',
      label3: '3',
      label4: '4',
    ),
    numCards: 4,
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
    numCards: 5,
  ),
  vert2(
    name: 'Vertical Two Card',
    widget: TwoCardVertLayout(
      label1: '1',
      label2: '2',
    ),
    numCards: 2,
  ),
  vert3(
    name: 'Vertical Three Card',
    widget: ThreeCardVertLayout(
      label1: '1',
      label2: '2',
      label3: '3',
    ),
    numCards: 3,
  ),
  vert4(
    name: 'Vertical Four Card',
    widget: FourCardVertLayout(
      label1: '1',
      label2: '2',
      label3: '3',
      label4: '4',
    ),
    numCards: 4,
  ),
  goalMotivationConflict(
    name: 'Goal-Motivation-Conflict',
    widget: ThreeCardHorizLayout(
      label1: 'G',
      label2: 'M',
      label3: 'C',
    ),
    numCards: 3,
  ),
  goalConflictDisaster(
    name: 'Goal-Conflict-Disaster',
    widget: ThreeCardHorizLayout(
      label1: 'G',
      label2: 'C',
      label3: 'D',
    ),
    numCards: 3,
  ),
  reactionDilemmaDecision(
    name: 'Reaction-Dilemma-Decision',
    widget: ThreeCardHorizLayout(
      label1: 'R',
      label2: 'D',
      label3: 'D',
    ),
    numCards: 3,
  ),
  actionReactionMovement(
    name: 'Action-Reaction-Movement',
    widget: ThreeCardHorizLayout(
      label1: 'A',
      label2: 'R',
      label3: 'M',
    ),
    numCards: 3,
  ),
  thesisAntithesisSynthesis(
    name: 'Thesis-Antithesis-Synthesis',
    widget: ThreeCardHorizLayout(
      label1: 'T',
      label2: 'A',
      label3: 'S',
    ),
    numCards: 3,
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
    numCards: 5,
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
    numCards: 6,
  ),
  backstory(
    name: 'Backstory',
    widget: BackstoryLayout(
      card1: '1',
      card2: '2',
      card3: '3',
      card4: '4',
    ),
    numCards: 4,
  ),
  celticCross(
    name: 'Celtic Cross',
    widget: SingleCardLayout(
      label1: '1',
    ),
    numCards: 10,
  ), //this is a temporary measure change later
  herosJourney12Circular(
    name: "Hero's Journey 12 Card Circular",
    widget: SingleCardLayout(
      label1: '1',
    ),
    numCards: 12,
  ), //this is a temporary measure change later
  herosJourney16Circular(
    name: "Hero's Journey 16 Card Circular",
    widget: SingleCardLayout(
      label1: '1',
    ),
    numCards: 16,
  ), //this is a temporary measure change later
  herosJourney12MByN(
    name: "Hero's Journey 12 Card 4x3",
    widget: SingleCardLayout(
      label1: '1',
    ),
    numCards: 12,
  ), //this is a temporary measure change later
  herosJourney16MByN(
    name: "Hero's Journey 16 Card 4x4",
    widget: SingleCardLayout(
      label1: '1',
    ),
    numCards: 16,
  ), //this is a temporary measure change later
  blakeSnyderBeatSheet(
    name: 'Blake Snyder\'s Beat Sheet',
    widget: SingleCardLayout(
      label1: '1',
    ),
    numCards: 12,
  ), //this is a temporary measure change later
  threeDisasterFourAct(
    name: '3 Disaster 4 Act',
    widget: SingleCardLayout(
      label1: '1',
    ),
    numCards: 7,
  ), //this is a temporary measure change later
  superStructure(
    name: 'Superstructure',
    widget: SingleCardLayout(
      label1: '1',
    ),
    numCards: 12,
  ), //this is a temporary measure change later
  fourteenPointStructure(
    name: 'Fourteen Point Structure',
    widget: SingleCardLayout(
      label1: '1',
    ),
    numCards: 14,
  ), //this is a temporary measure change later
  relationship2Way(
    name: 'Two Way Relationship',
    widget: ThreeCardHorizLayout(
      label1: 'C1',
      label2: 'R',
      label3: 'C2',
    ),
    numCards: 3,
  ), //this is a temporary measure change later
  relationship3Way(
    name: 'Three Way Relationship',
    widget: SingleCardLayout(
      label1: '1',
    ),
    numCards: 6,
  ); //this is a temporary measure change later

  final String _name;
  final Widget _widget;
  final int _numCards;

  const SpreadShape({
    required String name,
    required Widget widget,
    required int numCards,
  })  : _name = name,
        _widget = widget,
        _numCards = numCards;

  Widget get widget => _widget;
  int get numCards => _numCards;

  @override
  String toString() => _name;
}

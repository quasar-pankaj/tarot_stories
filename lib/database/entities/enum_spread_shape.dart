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
    widget: SingleCardLayout(
      label1: '1',
    ),
    numCards: 1,
    contexts: ['Query'],
  ),
  horiz2(
    name: 'Horizontal Two Card',
    widget: TwoCardHorizLayout(
      label1: '1',
      label2: '2',
    ),
    numCards: 2,
    contexts: [
      'Query 1',
      'Query 2',
    ],
  ),
  horiz3(
    name: 'Horizontal Three Card',
    widget: ThreeCardHorizLayout(
      label1: '1',
      label2: '2',
      label3: '3',
    ),
    numCards: 3,
    contexts: [
      'Query 1',
      'Query 2',
      'Query 3',
    ],
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
    contexts: [
      'Query 1',
      'Query 2',
      'Query 3',
      'Query 4',
    ],
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
    contexts: [
      'Query 1',
      'Query 2',
      'Query 3',
      'Query 4',
      'Query 5',
    ],
  ),
  vert2(
    name: 'Vertical Two Card',
    widget: TwoCardVertLayout(
      label1: '1',
      label2: '2',
    ),
    numCards: 2,
    contexts: [
      'Query 1',
      'Query 2',
    ],
  ),
  vert3(
    name: 'Vertical Three Card',
    widget: ThreeCardVertLayout(
      label1: '1',
      label2: '2',
      label3: '3',
    ),
    numCards: 3,
    contexts: [
      'Query 1',
      'Query 2',
      'Query 3',
    ],
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
    contexts: [
      'Query 1',
      'Query 2',
      'Query 3',
      'Query 4',
    ],
  ),
  goalMotivationConflict(
    name: 'Goal-Motivation-Conflict',
    widget: ThreeCardHorizLayout(
      label1: 'G',
      label2: 'M',
      label3: 'C',
    ),
    numCards: 3,
    contexts: [
      'Goal',
      'Motivation',
      'Conflict',
    ],
  ),
  goalConflictDisaster(
    name: 'Goal-Conflict-Disaster',
    widget: ThreeCardHorizLayout(
      label1: 'G',
      label2: 'C',
      label3: 'D',
    ),
    numCards: 3,
    contexts: [
      'Goal',
      'Conflict',
      'Disaster',
    ],
  ),
  reactionDilemmaDecision(
    name: 'Reaction-Dilemma-Decision',
    widget: ThreeCardHorizLayout(
      label1: 'R',
      label2: 'D',
      label3: 'D',
    ),
    numCards: 3,
    contexts: [
      'Reaction',
      'Dilemma',
      'Decision',
    ],
  ),
  actionReactionMovement(
    name: 'Action-Reaction-Movement',
    widget: ThreeCardHorizLayout(
      label1: 'A',
      label2: 'R',
      label3: 'M',
    ),
    numCards: 3,
    contexts: [
      'Action',
      'Reaction',
      'Movement',
    ],
  ),
  thesisAntithesisSynthesis(
    name: 'Thesis-Antithesis-Synthesis',
    widget: ThreeCardHorizLayout(
      label1: 'T',
      label2: 'A',
      label3: 'S',
    ),
    numCards: 3,
    contexts: [
      'Thesis',
      'Antithesis',
      'Synthesis',
    ],
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
    contexts: [
      'Sight',
      'Smell',
      'Sounds',
      'Taste',
      'Touch',
    ],
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
    contexts: [
      'Character',
      'Conflict',
      'Flaws',
      'Need',
      'Goal',
      'Want',
    ],
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
    contexts: [
      'Key Past Event',
      'Positive Fugure',
      'Childhood Overall',
      'Negative Figure',
    ],
  ),
  celticCross(
    name: 'Celtic Cross',
    widget: SingleCardLayout(
      label1: '1',
    ),
    numCards: 10,
    contexts: [
      'The Issue',
      'Obstacle',
      'Past',
      'Present',
      'Near Future',
      'Far Future',
      'The Character',
      'Environment',
      'Hopes and Fears',
      'Outcome',
    ],
  ), //this is a temporary measure change later
  herosJourney12Circular(
    name: "Hero's Journey 12 Card Circular",
    widget: SingleCardLayout(
      label1: '1',
    ),
    numCards: 12,
    contexts: [
      'Ordinary World',
      'Call To Action',
      'Refusing the Call',
      'Mentor/Helper',
      'Crossing the Threshold',
      'The Magical World',
      'Test/Allies/Enemies',
      'Trials',
      'Dark night of the Soul',
      'Ordeal',
      'Reward',
      'Return',
    ],
  ), //this is a temporary measure change later
  herosJourney16Circular(
    name: "Hero's Journey 16 Card Circular",
    widget: SingleCardLayout(
      label1: '1',
    ),
    numCards: 16,
    contexts: [
      'Ordinary World',
      'Call To Action',
      'Refusing the Call',
      'Ally/Mentor/Helper',
      'Crossing the Threshold',
      'Guardians and Gatekeepers',
      'The road of Trials',
      'Supreme Ordeal',
      'Meeting with the Godess',
      'Woman as Temptress',
      'Atonement with Father',
      'The Abyss',
      'Ultimate Boon',
      'Flight',
      'rescue from Without',
      'Master of Two Worlds',
    ],
  ), //this is a temporary measure change later
  herosJourney12MByN(
    name: "Hero's Journey 12 Card 4x3",
    widget: SingleCardLayout(
      label1: '1',
    ),
    numCards: 12,
    contexts: [
      'Ordinary World',
      'Call To Action',
      'Refusing the Call',
      'Mentor/Helper',
      'Crossing the Threshold',
      'The Magical World',
      'Test/Allies/Enemies',
      'Trials',
      'Dark night of the Soul',
      'Ordeal',
      'Reward',
      'Return',
    ],
  ), //this is a temporary measure change later
  herosJourney16MByN(
    name: "Hero's Journey 16 Card 4x4",
    widget: SingleCardLayout(
      label1: '1',
    ),
    numCards: 16,
    contexts: [
      'Ordinary World',
      'Call To Action',
      'Refusing the Call',
      'Ally/Mentor/Helper',
      'Crossing the Threshold',
      'Guardians and Gatekeepers',
      'The road of Trials',
      'Supreme Ordeal',
      'Meeting with the Godess',
      'Woman as Temptress',
      'Atonement with Father',
      'The Abyss',
      'Ultimate Boon',
      'Flight',
      'rescue from Without',
      'Master of Two Worlds',
    ],
  ), //this is a temporary measure change later
  threeDisasterFourAct(
    name: '3 Disaster 4 Act',
    widget: SingleCardLayout(
      label1: '1',
    ),
    numCards: 7,
    contexts: [
      'Act 1',
      'Disaster 1',
      'Act 2',
      'Disaster 2',
      'Act 3',
      'Disaster 3',
      'Act 4',
    ],
  ), //this is a temporary measure change later
  relationship2Way(
    name: 'Two Way Relationship',
    widget: ThreeCardHorizLayout(
      label1: 'C1',
      label2: 'R',
      label3: 'C2',
    ),
    numCards: 3,
    contexts: [
      'Character 1',
      'Relationship',
      'Character 2',
    ],
  ), //this is a temporary measure change later
  relationship3Way(
    name: 'Three Way Relationship',
    widget: SingleCardLayout(
      label1: '1',
    ),
    numCards: 6,
    contexts: [
      'Character 1',
      'C1-C2 Relationship',
      'C1-C3 Relationship',
      'Character 2',
      'C2-C3 relationship',
      'Character 3',
    ],
  ); //this is a temporary measure change later

  final String _name;
  final Widget _widget;
  final int _numCards;
  final List<String> _contexts;

  const SpreadShape({
    required String name,
    required Widget widget,
    required int numCards,
    required List<String> contexts,
  })  : _name = name,
        _widget = widget,
        _numCards = numCards,
        _contexts = contexts;

  Widget get widget => _widget;
  int get numCards => _numCards;
  List<String> get contexts => _contexts;

  @override
  String toString() => _name;
}

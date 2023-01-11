import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/entities/enum_spread_shape.dart';
import '../providers/journals/open_journal_provider.dart';
import 'spreads/layouts/backstory_spread.dart';
import 'spreads/layouts/celtic_cross_spread.dart';
import 'spreads/layouts/character_cross.dart';
import 'spreads/layouts/heros_journey12_circular_spread.dart';
import 'spreads/layouts/heros_journey12_m_by_n_spread.dart';
import 'spreads/layouts/heros_journey16_circular_spread.dart';
import 'spreads/layouts/heros_journey16_m_by_n_spread.dart';
import 'spreads/layouts/horizontal_spread.dart';
import 'spreads/layouts/tarot_spread_widget.dart';
import 'spreads/layouts/three_distaster_four_act_spread.dart';
import 'spreads/layouts/three_way_relationship_spread.dart';
import 'spreads/layouts/vertical_spread.dart';

class SpreadWidget extends ConsumerWidget {
  const SpreadWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final openjournal = ref.watch(openJournalProvider);

    late final TarotSpreadWidget spread;

    switch (openjournal!.shape) {
      case SpreadShape.horiz1:
      case SpreadShape.horiz2:
      case SpreadShape.horiz3:
      case SpreadShape.horiz4:
      case SpreadShape.horiz5:
      case SpreadShape.goalMotivationConflict:
      case SpreadShape.goalConflictDisaster:
      case SpreadShape.reactionDilemmaDecision:
      case SpreadShape.actionReactionMovement:
      case SpreadShape.thesisAntithesisSynthesis:
      case SpreadShape.fiveSenses:
      case SpreadShape.relationship2Way:
        spread = const HorizontalSpread();
        break;
      case SpreadShape.vert2:
      case SpreadShape.vert3:
      case SpreadShape.vert4:
        spread = const VerticalSpread();
        break;
      case SpreadShape.characterCross:
        spread = const CharacterCrossSpread();
        break;
      case SpreadShape.backstory:
        spread = const BackstorySpread();
        break;
      case SpreadShape.celticCross:
        spread = const CelticCrossSpread();
        break;
      case SpreadShape.herosJourney12Circular:
        spread = const HerosJourney12CircularSpread();
        break;
      case SpreadShape.herosJourney16Circular:
        spread = const HerosJourney16CircularSpread();
        break;
      case SpreadShape.herosJourney12MByN:
        spread = const HerosJourney12MByNSpread();
        break;
      case SpreadShape.herosJourney16MByN:
        spread = const HerosJourney16MByNSpread();
        break;
      case SpreadShape.threeDisasterFourAct:
        spread = const ThreeDisasterFourActSpread();
        break;
      case SpreadShape.relationship3Way:
        spread = const ThreeWayRelationShipSpread();
        break;
    }

    return spread;
  }
}

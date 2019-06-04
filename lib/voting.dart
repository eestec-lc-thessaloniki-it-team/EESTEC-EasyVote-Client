import 'package:flutter/material.dart';
import 'voteissue.dart';
import 'eestec_components.dart';

class VotingView extends StatefulWidget {
  @override
  _VotingViewState createState() => _VotingViewState();
}

class _VotingViewState extends State<VotingView> with TickerProviderStateMixin {
  AnimationController _handRulesController;

  @override
  void initState() => _handRulesController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 100));

  Widget build(BuildContext context) {
    final _votingIssues = [
      VoteIssue(
          id: 1,
          title: "Sample Voting 1",
          description:
              "A purple patch is an over-written passage in which the writer has strained too hard to achieve an impressive effect, by elaborate figures or other means. The phrase was first used by the Roman poet Horace in his Ars Poetica (c. 20 BC) to denote an irrelevant and excessively ornate passage; the sense of irrelevance is normally absent in modern usage, although such passages are usually incongruous. By extension, purple prose is lavishly figurative, rhythmic, or otherwise overwrought."),
      VoteIssue(
          id: 2,
          title: "Sample Voting 2",
          description:
              "Description is the fiction-writing mode for transmitting a mental image of the particulars of a story. Together with dialogue, narration, exposition, and summarization, description is one of the most widely recognized of the fiction-writing modes. As stated in Writing from A to Z, edited by Kirk Polking, description is more than the amassing of details; it is bringing something to life by carefully choosing and arranging words and phrases to produce the desired effect.[6] The most appropriate and effective techniques for presenting description are a matter of ongoing discussion among writers and writing coaches.")
    ];

    final key = GlobalKey<ScaffoldState>();

    const List<IconData> _handRules = const [
      Icons.sms,
      Icons.mail,
      Icons.phone
    ];

    return Scaffold(
      key: key,
      appBar: AppBar(
        title: Text(
          "EESTEC Voting",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 4,
        backgroundColor: Color(0XFFEB2426),
      ),
      floatingActionButton: EFloatingActionButton(handRules: _handRules, handRulesController: _handRulesController, fabKey: key),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
              children: _votingIssues.map((voteIssue) {
            return EVotingCard(voteIssue: voteIssue);
          }).toList()),
        ),
      ),
    );
  }
}
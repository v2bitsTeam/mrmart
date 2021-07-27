import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TrackProcessingWidget extends StatelessWidget {
  const TrackProcessingWidget({Key key}) : super(key: key);

  Widget testWidget() {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.1,
            isFirst: true,
            indicatorStyle: const IndicatorStyle(
              width: 20,
              color: Colors.purple,
            ),
            beforeLineStyle: const LineStyle(
              color: Colors.purple,
              thickness: 6,
            ),
          ),
          const TimelineDivider(
            begin: 0.1,
            end: 0.9,
            thickness: 6,
            color: Colors.purple,
          ),
          TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.9,
            beforeLineStyle: const LineStyle(
              color: Colors.purple,
              thickness: 6,
            ),
            afterLineStyle: const LineStyle(
              color: Colors.deepOrange,
              thickness: 6,
            ),
            indicatorStyle: const IndicatorStyle(
              width: 20,
              color: Colors.cyan,
            ),
          ),
          const TimelineDivider(
            begin: 0.1,
            end: 0.9,
            thickness: 6,
            color: Colors.deepOrange,
          ),
          TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.1,
            isLast: true,
            beforeLineStyle: const LineStyle(
              color: Colors.deepOrange,
              thickness: 6,
            ),
            indicatorStyle: const IndicatorStyle(
              width: 20,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.1,
                  isFirst: true,
                  indicatorStyle: IndicatorStyle(
                    width: 30,
                    color: Colors.purple,
                    iconStyle: IconStyle(
                      color: Colors.white,
                      iconData: Icons.thumb_up,
                    ),
                  ),
                  beforeLineStyle: const LineStyle(
                    color: Colors.purple,
                    thickness: 6,
                  ),
                ),
                const TimelineDivider(
                  begin: 0.1,
                  end: 0.9,
                  thickness: 6,
                  color: Colors.purple,
                ),
                TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.9,
                  beforeLineStyle: const LineStyle(
                    color: Colors.purple,
                    thickness: 6,
                  ),
                  afterLineStyle: const LineStyle(
                    color: Colors.deepOrange,
                    thickness: 6,
                  ),
                  indicatorStyle: const IndicatorStyle(
                    width: 20,
                    color: Colors.cyan,
                  ),
                ),
                const TimelineDivider(
                  begin: 0.1,
                  end: 0.9,
                  thickness: 6,
                  color: Colors.deepOrange,
                ),
                TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.1,
                  isLast: true,
                  beforeLineStyle: const LineStyle(
                    color: Colors.deepOrange,
                    thickness: 6,
                  ),
                  indicatorStyle: const IndicatorStyle(
                    width: 20,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Example10Horizontal extends StatelessWidget {
  const Example10Horizontal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        <Widget>[
          Center(
            child: Container(
              constraints: const BoxConstraints(maxHeight: 120),
              color: Colors.white,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  TimelineTile(
                    axis: TimelineAxis.horizontal,
                    alignment: TimelineAlign.manual,
                    lineXY: 0.1,
                    isFirst: true,
                    indicatorStyle: const IndicatorStyle(
                      height: 20,
                      color: Colors.purple,
                    ),
                    beforeLineStyle: const LineStyle(
                      color: Colors.purple,
                      thickness: 6,
                    ),
                  ),
                  const TimelineDivider(
                    axis: TimelineAxis.vertical,
                    begin: 0.1,
                    end: 0.9,
                    thickness: 6,
                    color: Colors.purple,
                  ),
                  TimelineTile(
                    axis: TimelineAxis.horizontal,
                    alignment: TimelineAlign.manual,
                    lineXY: 0.9,
                    beforeLineStyle: const LineStyle(
                      color: Colors.purple,
                      thickness: 6,
                    ),
                    afterLineStyle: const LineStyle(
                      color: Colors.deepOrange,
                      thickness: 6,
                    ),
                    indicatorStyle: const IndicatorStyle(
                      height: 20,
                      color: Colors.cyan,
                    ),
                  ),
                  const TimelineDivider(
                    axis: TimelineAxis.vertical,
                    begin: 0.1,
                    end: 0.9,
                    thickness: 6,
                    color: Colors.deepOrange,
                  ),
                  TimelineTile(
                    axis: TimelineAxis.horizontal,
                    alignment: TimelineAlign.manual,
                    lineXY: 0.1,
                    isLast: true,
                    beforeLineStyle: const LineStyle(
                      color: Colors.deepOrange,
                      thickness: 6,
                    ),
                    indicatorStyle: const IndicatorStyle(
                      height: 20,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

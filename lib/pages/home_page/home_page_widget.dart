import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.toninit();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFF0E2143),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 32.0, 16.0, 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await actions.printall();
                      },
                      child: Text(
                        'donApp',
                        style:
                            FlutterFlowTheme.of(context).headlineLarge.override(
                                  fontFamily: 'Outfit',
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(40.0, 16.0, 40.0, 16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/toncoin-ton-coin-stacks-cryptocurrency-3d-render-illustration-free-png.webp',
                      width: 200.0,
                      height: 200.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 8.0),
                    child: Text(
                      'Connect with Tonkeeper',
                      textAlign: TextAlign.justify,
                      style: FlutterFlowTheme.of(context).titleMedium,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 24.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (FFAppState().tonConnected == true) {
                        context.pushNamed('donatesPage');
                      } else {
                        await launchURL(FFAppState().tonLink);
                        _model.instantTimer = InstantTimer.periodic(
                          duration: const Duration(milliseconds: 2000),
                          callback: (timer) async {
                            if (FFAppState().tonConnected == true) {
                              _model.instantTimer?.cancel();

                              context.pushNamed('donatesPage');

                              return;
                            }
                          },
                          startImmediately: true,
                        );
                      }
                    },
                    child: Container(
                      width: 60.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).secondary,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: Image.asset(
                          'assets/images/unnamed.png',
                          width: 80.0,
                          height: 80.0,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 16.0),
                    child: Text(
                      'Powered by',
                      style: FlutterFlowTheme.of(context).titleMedium,
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/ton.png',
                        width: 60.0,
                        height: 60.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Image.asset(
                        'assets/images/idGj5i8Kzv.jpeg',
                        width: 60.0,
                        height: 60.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Image.asset(
                        'assets/images/5611220_9fae.jpg',
                        width: 60.0,
                        height: 60.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'donates_page_model.dart';
export 'donates_page_model.dart';

class DonatesPageWidget extends StatefulWidget {
  const DonatesPageWidget({super.key});

  @override
  State<DonatesPageWidget> createState() => _DonatesPageWidgetState();
}

class _DonatesPageWidgetState extends State<DonatesPageWidget> {
  late DonatesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DonatesPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFF060A27),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0.0, -1.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: const AlignmentDirectional(1.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 16.0, 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(1.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await actions.logOut();
                              if (Navigator.of(context).canPop()) {
                                context.pop();
                              }
                              context.pushNamed('HomePage');
                            },
                            child: Icon(
                              Icons.logout_sharp,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 36.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  'Choose your Donate!',
                  style: FlutterFlowTheme.of(context).headlineLarge.override(
                        fontFamily: 'Outfit',
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                ),
                Expanded(
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 18.0, 16.0, 0.0),
                      child: FutureBuilder<List<DonatesRow>>(
                        future: DonatesTable().queryRows(
                          queryFn: (q) => q,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<DonatesRow> gridViewDonatesRowList =
                              snapshot.data!;
                          return GridView.builder(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                              childAspectRatio: 1.0,
                            ),
                            primary: false,
                            scrollDirection: Axis.vertical,
                            itemCount: gridViewDonatesRowList.length,
                            itemBuilder: (context, gridViewIndex) {
                              final gridViewDonatesRow =
                                  gridViewDonatesRowList[gridViewIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  setState(() {
                                    _model.id = gridViewDonatesRow.id;
                                    _model.address = gridViewDonatesRow.link!;
                                    _model.value = gridViewDonatesRow.value;
                                    _model.message = gridViewDonatesRow.name;
                                  });
                                },
                                child: Container(
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            gridViewDonatesRow.id == _model.id
                                                ? FlutterFlowTheme.of(context)
                                                    .primary
                                                : const Color(0x00000000),
                                      )
                                    ],
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFF29274F),
                                        Color(0xFF0E0C2C)
                                      ],
                                      stops: [0.0, 1.0],
                                      begin: AlignmentDirectional(0.0, -1.0),
                                      end: AlignmentDirectional(0, 1.0),
                                    ),
                                    border: Border.all(
                                      color: gridViewDonatesRow.id == _model.id
                                          ? FlutterFlowTheme.of(context).primary
                                          : const Color(0x00000000),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            gridViewDonatesRow.name,
                                            'Nsme',
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            if (gridViewDonatesRow.name ==
                                                'Charity') {
                                              return ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.asset(
                                                  'assets/images/charity.webp',
                                                  width: 60.0,
                                                  height: 60.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              );
                                            } else if (gridViewDonatesRow
                                                    .name ==
                                                'Pets help') {
                                              return ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.asset(
                                                  'assets/images/CAT_emoji_icon_png_grande.webp',
                                                  width: 60.0,
                                                  height: 60.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              );
                                            } else if (gridViewDonatesRow
                                                    .name ==
                                                'Sport') {
                                              return ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.asset(
                                                  'assets/images/sport.webp',
                                                  width: 60.0,
                                                  height: 60.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              );
                                            } else if (gridViewDonatesRow
                                                    .name ==
                                                'Donate') {
                                              return ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.asset(
                                                  'assets/images/donate.webp',
                                                  width: 60.0,
                                                  height: 60.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              );
                                            } else {
                                              return ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.asset(
                                                  'assets/images/donate.webp',
                                                  width: 60.0,
                                                  height: 60.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                (gridViewDonatesRow.value!
                                                            .toDouble() /
                                                        1000000000)
                                                    .toString(),
                                                '0',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                  ),
                                            ),
                                            Text(
                                              'TON',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                  ),
                                            ),
                                          ].divide(const SizedBox(width: 2.0)),
                                        ),
                                      ),
                                    ].divide(const SizedBox(height: 6.0)),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 100.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await actions.sendTrx(
                        _model.address,
                        _model.value!,
                      );
                    },
                    text: 'Donate',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                              ),
                      elevation: 3.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ].divide(const SizedBox(height: 4.0)),
            ),
          ),
        ),
      ),
    );
  }
}

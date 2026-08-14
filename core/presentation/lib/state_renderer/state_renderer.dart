import 'package:flutter/material.dart';
import 'package:presentation/state_renderer/state_renderer_type.dart';

class StateRenderer extends StatelessWidget {
  final StateRendererType stateRendererType;

  final String title;
  final String message;

  var _isDialogDismissed = false;
  var _isDialogShowing = false;

  final VoidCallback retryActionFunction;

  StateRenderer({
    super.key,
    required this.stateRendererType,
    this.message = "Loading...",
    this.title = "Error",
    required this.retryActionFunction
  });

  @override
  Widget build(BuildContext context) {
    switch (stateRendererType) {
      case StateRendererType.popupLoadingState:
        return _showPopupLoadingDialog(context, _buildLoadingWidget());
      case StateRendererType.popupErrorState:
        return _showPopupErrorDialog(context, _buildErrorWidget());
      case StateRendererType.fullScreenLoadingState:
        return _showFullScreenContent(_buildLoadingWidget());
      case StateRendererType.fullScreenErrorState:
        return _showFullScreenContent(_buildErrorWidget());
      case StateRendererType.fullScreenErrorState:
        return _showFullScreenContent(_buildErrorWidget(showRetryButton: true));
      case StateRendererType.emptyState:
        // TODO: Handle this case.
        throw UnimplementedError();
      case StateRendererType.contentState:
        // TODO: Handle this case.
        throw UnimplementedError();
      case StateRendererType.none:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
    // return const Placeholder();
  }

  // it will check if we are displaying a dialog.
  bool _isThereCurrentDialogShowing(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent != true;

  Widget _buildLoadingWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularProgressIndicator(),
        SizedBox(height: 10),
        Text(message),
      ],
    );
  }

  // it can show popup loading or popup error depending on "content"
  Widget _showPopupLoadingDialog(BuildContext context, Widget content) {
    if (!_isThereCurrentDialogShowing(context)) {
      _isDialogShowing = true;

      WidgetsBinding.instance.addPersistentFrameCallback(
        (_) => showDialog(
          context: context,
          builder: (context) => AlertDialog(content: content),
        ),
      );
    }
    return Container();
  }

  Widget _buildErrorWidget({bool showRetryButton = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.error_outline, size: 70, color: Colors.red),
        SizedBox(height: 10),
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(message),
        if(showRetryButton)
          ElevatedButton(
            onPressed: retryActionFunction,
            child: Text("Retry"),
          )
      ],
    );
  }

  Widget _showPopupErrorDialog(BuildContext context, Widget content) {
    if (!_isThereCurrentDialogShowing(context)) {
      _isDialogShowing = true;

      WidgetsBinding.instance.addPersistentFrameCallback(
        (_) => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: content,
            actions: [
              TextButton(
                onPressed: () {
                  _isDialogDismissed = true;
                  Navigator.of(
                    context,
                    rootNavigator: true,
                  ).pop(true); // dismiss the dialog
                },
                child: Text("Close"),
              ),
            ],
          ),
        ),
      );
    }
    return Container(); // keep screen content behind the dialog
  }

  Widget _showFullScreenContent(Widget buildLoadingWidget) {
    return Container(
      color: Colors.white,
      child: Center(child: buildLoadingWidget),
    );
  }
}

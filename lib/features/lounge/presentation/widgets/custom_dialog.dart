// class MyCustomDialog extends ZIMKitDialog { // Assuming ZIMKitDialog is the base class

//   final String _prefilledUserId; // Store the pre-filled user ID

//   MyCustomDialog(this._prefilledUserId);

//   @override
//   Widget build(BuildContext context) {
//     return super.build(context);
//   }

//   @override
//   void onSubmit(String peerUserID) {
//     super.onSubmit(_prefilledUserId); // Use the pre-filled ID here
//     // Initiate chat with the pre-filled ID
//     ZegoChat.instance.<correct_method_name>(_prefilledUserId);
//   }

//   @override
//   Widget buildContent(BuildContext context) {
//     // Include the original dialog content from ZIMKitDialog.buildContent(...)
//     // Add a hidden TextField at the bottom (adjust positioning as needed)
//     return Stack(
//       children: [
//         super.buildContent(context), // Original content
//         Positioned(
//           bottom: 0,
//           right: 0,
//           child: TextField(
//             controller: TextEditingController(text: _prefilledUserId),
//             readOnly: true, // Make it hidden
//             style: TextStyle(opacity: 0.0), // Hide text visually
//           ),
//         ),
//       ],
//     );
//   }
// }

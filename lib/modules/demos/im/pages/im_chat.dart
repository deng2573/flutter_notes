import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:notes/core/extesion/extesion_color.dart';
import 'package:notes/modules/demos/im/pages/chat_input.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  // Widget _itemView(index) => ChatItemView(
  //       key: logic.itemKey(index),
  //       index: index,
  //       message: logic.indexOfMessage(index),
  //       timeStr: logic.getShowTime(index),
  //       isSingleChat: logic.isSingleChat,
  //       clickSubject: logic.clickSubject,
  //       msgSendStatusSubject: logic.msgSendStatusSubject,
  //       msgSendProgressSubject: logic.msgSendProgressSubject,
  //       multiSelMode: logic.multiSelMode.value,
  //       multiList: logic.multiSelList.value,
  //       allAtMap: logic.atUserNameMappingMap,
  //       delaySendingStatus: true,
  //       onMultiSelChanged: (checked) {
  //         logic.multiSelMsg(index, checked);
  //       },
  //       onTapCopyMenu: () {
  //         logic.copy(index);
  //       },
  //       onTapDelMenu: () {
  //         logic.deleteMsg(index);
  //       },
  //       onTapForwardMenu: () {
  //         logic.forward(index);
  //       },
  //       onTapReplyMenu: () {
  //         logic.setQuoteMsg(index);
  //       },
  //       onTapRevokeMenu: () {
  //         logic.revokeMsg(index);
  //       },
  //       onTapMultiMenu: () {
  //         logic.openMultiSelMode(index);
  //       },
  //       visibilityChange: (context, index, message, visible) {
  //         print('visible:$index $visible');
  //         logic.markC2CMessageAsRead(index, message, visible);
  //       },
  //       onLongPressLeftAvatar: () {
  //         logic.onLongPressLeftAvatar(index);
  //       },
  //       onLongPressRightAvatar: () {},
  //       onTapLeftAvatar: () {
  //         logic.onTapLeftAvatar(index);
  //       },
  //       onTapRightAvatar: () {},
  //       onClickAtText: (uid) {
  //         logic.clickAtText(uid);
  //       },
  //       onTapQuoteMsg: () {
  //         logic.onTapQuoteMsg(index);
  //       },
  //       patterns: <MatchPattern>[
  //         MatchPattern(
  //           type: PatternType.AT,
  //           style: PageStyle.ts_1B72EC_14sp,
  //           onTap: logic.clickLinkText,
  //         ),
  //         MatchPattern(
  //           type: PatternType.EMAIL,
  //           style: PageStyle.ts_1B72EC_14sp,
  //           onTap: logic.clickLinkText,
  //         ),
  //         MatchPattern(
  //           type: PatternType.URL,
  //           style: PageStyle.ts_1B72EC_14sp_underline,
  //           onTap: logic.clickLinkText,
  //         ),
  //         MatchPattern(
  //           type: PatternType.PHONE,
  //           style: PageStyle.ts_1B72EC_14sp,
  //           onTap: logic.clickLinkText,
  //         ),
  //       ],
  //     );

  @override
  Widget build(BuildContext context) {
    return ChatInput(
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Card(
            color: ColorExtension.random,
            child: const SizedBox(
              height: 100,
            ),
          );
        },
      ),
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Card(
                    color: ColorExtension.random,
                    child: const SizedBox(
                      height: 100,
                    ),
                  );
                },
              ),
            ),
          ),
          const ChatInput(),
          // ChatInputBoxView(
          //   controller: logic.inputCtrl,
          //   // allAtMap: logic.atUserNameMappingMap,
          //   toolbox: const ChatToolsView(
          //       // onTapAlbum: () => logic.onTapAlbum(),
          //       // onTapCamera: () => logic.onTapCamera(),
          //       // onTapCarte: () => logic.onTapCarte(),
          //       // onTapFile: () => logic.onTapFile(),
          //       // onTapLocation: () => logic.onTapLocation(),
          //       // onTapVideoCall: () => logic.call(),
          //       // onStopVoiceInput: () => logic.onStopVoiceInput(),
          //       // onStartVoiceInput: () => logic.onStartVoiceInput(),
          //       ),
          //   multiOpToolbox: const ChatMultiSelToolbox(
          //       // onDelete: () => logic.mergeDelete(),
          //       // onMergeForward: () => logic.mergeForward(),
          //       ),
          //   emojiView: const ChatEmojiView(
          //       // onAddEmoji: logic.onAddEmoji,
          //       // onDeleteEmoji: logic.onDeleteEmoji,
          //       ),
          //   // onSubmitted: (v) => logic.sendTextMsg(),
          //   // forceCloseToolboxSub: logic.forceCloseToolbox,
          //   voiceRecordBar: bar,
          //   // quoteContent: logic.quoteContent.value,
          //   // onClearQuote: () => logic.setQuoteMsg(-1),
          //   // multiMode: logic.multiSelMode.value,
          //   focusNode: logic.focusNode,
          // ),
          // ChatInputBoxView(
          //   controller: logic.inputCtrl,
          //   // allAtMap: logic.atUserNameMappingMap,
          //   toolbox: const ChatToolsView(
          //       // onTapAlbum: () => logic.onTapAlbum(),
          //       // onTapCamera: () => logic.onTapCamera(),
          //       // onTapCarte: () => logic.onTapCarte(),
          //       // onTapFile: () => logic.onTapFile(),
          //       // onTapLocation: () => logic.onTapLocation(),
          //       // onTapVideoCall: () => logic.call(),
          //       // onStopVoiceInput: () => logic.onStopVoiceInput(),
          //       // onStartVoiceInput: () => logic.onStartVoiceInput(),
          //       ),
          //   multiOpToolbox: const ChatMultiSelToolbox(
          //       // onDelete: () => logic.mergeDelete(),
          //       // onMergeForward: () => logic.mergeForward(),
          //       ),
          //   emojiView: const ChatEmojiView(
          //       // onAddEmoji: logic.onAddEmoji,
          //       // onDeleteEmoji: logic.onDeleteEmoji,
          //       ),
          //   // onSubmitted: (v) => logic.sendTextMsg(),
          //   // forceCloseToolboxSub: logic.forceCloseToolbox,
          //   voiceRecordBar: bar,
          //   // quoteContent: logic.quoteContent.value,
          //   // onClearQuote: () => logic.setQuoteMsg(-1),
          //   // multiMode: logic.multiSelMode.value,
          //   focusNode: logic.focusNode,
          // ),
        ],
      ),
    );
    // // // final logic = Get.<ChatLogic>();
    // final logic = Get.put(ChatLogic());
    // return ChatVoiceRecordLayout(
    //   // locale: Get.locale,
    //   builder: (bar) => Scaffold(
    //     // backgroundColor: PageStyle.c_FFFFFF,
    //     // appBar: EnterpriseTitleBar.chatTitle(
    //     //   title: logic.name.value,
    //     //   subTitle: logic.getSubTile(),
    //     //   onClickCallBtn: () => logic.call(),
    //     //   onClickMoreBtn: () => logic.chatSetup(),
    //     //   leftButton: logic.multiSelMode.value ? StrRes.cancel : null,
    //     //   onClose: () => logic.exit(),
    //     //   showOnlineStatus: logic.showOnlineStatus(),
    //     //   online: logic.onlineStatus.value,
    //     // ),
    //     body: Column(
    //       children: [
    //         Expanded(
    //           child: Align(
    //             alignment: Alignment.topCenter,
    //             child: ListView.builder(
    //               // key: widget.listViewKey,
    //               reverse: true,
    //               shrinkWrap: true,
    //               itemCount: 100,
    //               // padding: EdgeInsets.only(top: 10.h),
    //               // controller: widget.controller,
    //               itemBuilder: (context, index) {
    //                 return Container(
    //                   color: Colors.red,
    //                   child: const SizedBox(
    //                     height: 20,
    //                   ),
    //                 );
    //               },
    //             ),
    //           ),
    //           // child: ChatListView(
    //           //   listViewKey: ObjectKey(logic.listViewKey.value),
    //           //   onTouch: () => logic.closeToolbox(),
    //           //   itemCount: logic.messageList.length,
    //           //   controller: logic.autoCtrl,
    //           //   onLoad: () => logic.getHistoryMsgList(),
    //           //   itemBuilder: (_, index) => Obx(() => _itemView(index)),
    //           // ),
    //         ),
    //         const ChatInput(),
    //         // ChatInputBoxView(
    //         //   controller: logic.inputCtrl,
    //         //   // allAtMap: logic.atUserNameMappingMap,
    //         //   toolbox: const ChatToolsView(
    //         //       // onTapAlbum: () => logic.onTapAlbum(),
    //         //       // onTapCamera: () => logic.onTapCamera(),
    //         //       // onTapCarte: () => logic.onTapCarte(),
    //         //       // onTapFile: () => logic.onTapFile(),
    //         //       // onTapLocation: () => logic.onTapLocation(),
    //         //       // onTapVideoCall: () => logic.call(),
    //         //       // onStopVoiceInput: () => logic.onStopVoiceInput(),
    //         //       // onStartVoiceInput: () => logic.onStartVoiceInput(),
    //         //       ),
    //         //   multiOpToolbox: const ChatMultiSelToolbox(
    //         //       // onDelete: () => logic.mergeDelete(),
    //         //       // onMergeForward: () => logic.mergeForward(),
    //         //       ),
    //         //   emojiView: const ChatEmojiView(
    //         //       // onAddEmoji: logic.onAddEmoji,
    //         //       // onDeleteEmoji: logic.onDeleteEmoji,
    //         //       ),
    //         //   // onSubmitted: (v) => logic.sendTextMsg(),
    //         //   // forceCloseToolboxSub: logic.forceCloseToolbox,
    //         //   voiceRecordBar: bar,
    //         //   // quoteContent: logic.quoteContent.value,
    //         //   // onClearQuote: () => logic.setQuoteMsg(-1),
    //         //   // multiMode: logic.multiSelMode.value,
    //         //   focusNode: logic.focusNode,
    //         // ),
    //       ],
    //     ),
    //   ),
    //   onCompleted: (sec, path) {
    //     // logic.sendVoice(duration: sec, path: path);
    //   },
    // );
  }

  Widget _buildTextField() {
    return Container(
        decoration: const BoxDecoration(
          color: Color(0xFFF3F3F4),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: TextField(
            // controller: _controller,
            // focusNode: _focusNode,
            // keyboardType: widget.keyboardType,
            // inputFormatters: widget.inputFormatters,
            // // autofocus: true,
            // maxLines: widget.maxLines,
            // minLines: widget.minLines,
            // maxLength: widget.maxLength,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
            decoration: InputDecoration(
              isDense: true,
              filled: true,
              // hintText: widget.hintText,
              fillColor: Colors.transparent,
              hintStyle: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 5,
              ),
              border: InputBorder.none,
            )));
  }
}

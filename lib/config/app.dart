import 'package:flutter/material.dart';

/// 用于管理app中的
///
/// color  style   constant
class AppColors {
  static const PrimaryColor = 0xffebebeb;
  static const BackgroundColor = 0xffededed;
  static const AppBarColor = 0xffededed;
  static const ActionIconColor = 0xff000000;
  static const ActionMenuBgColor = 0xff4c4c4c;
  static const CardBgColor = 0xffffffff;
  static const TabIconNormal = 0xff999999;
  static const TabIconActive = 0xff46c11b;
  static const AppBarPopupMenuColor = 0xffffffff;
  static const TitleColor = 0xff181818;
  static const ConversationItemBg = 0xffffffff;
  static const DesTextColor = 0xff999999;
  static const NotifyDotBg = 0xfff85351;
  static const NotifyDotText = 0xffffffff;
  static const ConversationMuteIcon = 0xffd8d8d8;
  static const DeviceInfoItemBg = AppBarColor;
  static const DeviceInfoItemText = 0xff606062;
  static const DeviceInfoItemIcon = 0xff606062;
  static const ContactGroupTitleBg = 0xffebebeb;
  static const ContactGroupTitleText = 0xff888888;
  static const IndexLetterBoxBg = Colors.black45;
  static const HeaderCardBg = Colors.white;
  static const HeaderCardTitleText = 0xff353535;
  static const HeaderCardDesText = 0xff7f7f7f;
  static const ButtonDesText = 0xff8c8c8c;
  static const ButtonArrowColor = 0xffadadad;
  static const NewTagBg = 0xfffa5251;
  static const ChatBoxBg = 0xfff7f7f7;
  static const ChatBoxCursorColor = 0xff07c160;


  static const appBarColor = Color.fromRGBO(237, 237, 237, 1);

  static const Color ComMomBGColor = Color.fromRGBO(240, 240, 245, 1.0);

  static const bgColor = Color.fromRGBO(255, 255, 255, 1);

  static const chatBg = Color(0xffefefef);

  static const defStyle = TextStyle(color: Colors.white);



  static const lineColor = Colors.grey;

  static const tipColor = Color.fromRGBO(89, 96, 115, 1.0);

  static const mainTextColor = Color.fromRGBO(115, 115, 115, 1.0);

  static const labelTextColor = Color.fromRGBO(144, 144, 144, 1.0);

  static const itemBgColor = Color.fromRGBO(75, 75, 75, 1.0);

  static const itemOnColor = Color.fromRGBO(68, 68, 68, 1.0);

  static const btTextColor = Color.fromRGBO(112, 113, 135, 1.0);
}

class AppStyles {
  static const TitleStyle = TextStyle(
    fontSize: AppConstants.TitleTextSize,
    color: const Color(AppColors.TitleColor),
  );

  static const DesStyle = TextStyle(
    fontSize: AppConstants.DesTextSize,
    color: Color(AppColors.DesTextColor),
  );

  static const UnreadMsgCountDotStyle = TextStyle(
    fontSize: 12.0,
    color: Color(AppColors.NotifyDotText),
  );

  static const DeviceInfoItemTextStyle = TextStyle(
    fontSize: AppConstants.DesTextSize,
    color: Color(AppColors.DeviceInfoItemText),
  );

  static const GroupTitleItemTextStyle = TextStyle(
    fontSize: 14.0,
    color: Color(AppColors.ContactGroupTitleText),
  );

  static const IndexLetterBoxTextStyle =
      TextStyle(fontSize: 32.0, color: Colors.white);

  static const HeaderCardTitleTextStyle = TextStyle(
      fontSize: 20.0,
      color: Color(AppColors.HeaderCardTitleText),
      fontWeight: FontWeight.bold);

  static const HeaderCardDesTextStyle = TextStyle(
      fontSize: 14.0,
      color: Color(AppColors.HeaderCardDesText),
      fontWeight: FontWeight.normal);

  static const ButtonDesTextStyle = TextStyle(
      fontSize: 12.0,
      color: Color(AppColors.ButtonDesText),
      fontWeight: FontWeight.bold);

  static const NewTagTextStyle = TextStyle(
      fontSize: AppConstants.DesTextSize,
      color: Colors.white,
      fontWeight: FontWeight.bold);

  static const ChatBoxTextStyle = TextStyle(
      textBaseline: TextBaseline.alphabetic,
      fontSize: AppConstants.ContentTextSize,
      color: const Color(AppColors.TitleColor));
}



class AppConstants {
  static const IconFontFamily = "appIconFont";
  static const ActionIconSize = 20.0;
  static const ActionIconSizeLarge = 32.0;
  static const AvatarRadius = 4.0;
  static const ConversationAvatarSize = 48.0;
  static const DividerWidth = 0.2;
  static const ConversationMuteIconSize = 18.0;
  static const ContactAvatarSize = 42.0;
  static const TitleTextSize = 16.0;
  static const ContentTextSize = 20.0;
  static const DesTextSize = 13.0;
  static const IndexBarWidth = 24.0;
  static const IndexLetterBoxSize = 64.0;
  static const IndexLetterBoxRadius = 4.0;
  static const FullWidthIconButtonIconSize = 25.0;
  static const ChatBoxHeight = 48.0;

  static const String MENU_MARK_AS_UNREAD = 'MENU_MARK_AS_UNREAD';
  static const String MENU_MARK_AS_UNREAD_VALUE = '标为未读';
  static const String MENU_PIN_TO_TOP = 'MENU_PIN_TO_TOP';
  static const String MENU_PIN_TO_TOP_VALUE = '置顶聊天';
  static const String MENU_DELETE_CONVERSATION = 'MENU_DELETE_CONVERSATION';
  static const String MENU_DELETE_CONVERSATION_VALUE = '删除该聊天';
  static const String MENU_PIN_PA_TO_TOP = 'MENU_PIN_PA_TO_TOP';
  static const String MENU_PIN_PA_TO_TOP_VALUE = '置顶公众号';
  static const String MENU_UNSUBSCRIBE = 'MENU_UNSUBSCRIBE';
  static const String MENU_UNSUBSCRIBE_VALUE = '取消关注';


  static const mainSpace = 10.0;

  static const mainLineWidth = 0.3;

  static const defIcon = 'assets/images/def_avatar.png';

  static const contactAssets = 'assets/images/contact/';

  static const defAvatar = 'http://flutterj.com/f.jpeg';

  static const myCode = 'http://flutterj.com/c.jpg';

  static const helpUrl =
      'https://kf.qq.com/touch/product/wechat_app.html?scene_id=kf338';

  static const defContentImg =
      'https://www.runoob.com/wp-content/uploads/2015/06/image_1c58e950q14da167k1nqpu2hn5e9.png';
}

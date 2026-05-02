import { MailFolder } from '../model/MailFolder';
import { vibrator } from '@kit.SensorServiceKit';
import { BusinessError } from '@kit.BasicServicesKit';

@Component
export struct FolderItem {
  @Prop folder: MailFolder;
  onFolderClick: (mailFolder: MailFolder) => void = () => {
  };

  build() {
    Row() {
      Row({ space: 6 }) {
        Image(this.folder.icon)
          .width(16)
          .height(16)

        Text(this.folder.name)
          .fontSize(12)
          .fontColor($r('app.color.white'))
          .fontWeight(FontWeight.Medium)
      }

      if (this.folder.unreadCount > 0) {
        Text(this.folder.unreadCount.toString())
          .fontSize(10)
          .fontColor($r('app.color.white'))
          .backgroundColor($r('app.color.unread_badge_bg'))
          .borderRadius(8)
          .width(16)
          .height(16)
          .textAlign(TextAlign.Center)
      }
    }
    .width('75%')
    .padding({
      left: 10,
      right: 10,
      top: 8,
      bottom: 8
    })
    .justifyContent(FlexAlign.SpaceBetween)
    .borderRadius(14)
    .backgroundColor($r('app.color.card_background_color'))
    .margin({ top: 3, bottom: 3 })
    .onClick(() => {
      try {
        vibrator.startVibration({
          type: 'time',
          duration: 50
        }, {
          id: 0,
          usage: 'touch'
        }, (error: BusinessError) => {
          if (error) {
            console.error(`Failed to start vibration. Code: ${error.code}, message: ${error.message}`);
          }
        });
      } catch (err) {
        console.error('An unexpected error occurred while attempting to vibrate:', err);
      }
      this.onFolderClick(this.folder);
    })
  }
}
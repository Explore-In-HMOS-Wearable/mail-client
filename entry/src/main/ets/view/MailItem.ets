import { Mail } from '../model/Mail';
import { vibrator } from '@kit.SensorServiceKit';
import { BusinessError } from '@kit.BasicServicesKit';

@Component
export struct MailItem {
  @Prop mail: Mail;
  onMailClick: (mail: Mail) => void = () => {
  };

  private triggerHapticFeedback() {
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
  }

  build() {
    Column() {
      Row() {
        Text(this.mail.sender)
          .fontSize(11)
          .fontWeight(this.mail.isRead ? FontWeight.Normal : FontWeight.Bold)
          .fontColor($r('app.color.white'))
          .layoutWeight(1)
          .textAlign(TextAlign.Start)

        Text(this.mail.date)
          .fontSize(8)
          .fontColor($r('app.color.search_placeholder_color'))
          .layoutWeight(1)
          .textAlign(TextAlign.End)
      }
      .width('100%')

      Text(this.mail.subject)
        .fontSize(9)
        .fontWeight(this.mail.isRead ? FontWeight.Normal : FontWeight.Medium)
        .fontColor(this.mail.isRead ? $r('app.color.mail_subject_read') : $r('app.color.white'))
        .margin({ top: 1 })
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })

      Text(this.mail.preview)
        .fontSize(8)
        .fontColor($r('app.color.search_placeholder_color'))
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .maxLines(1)
        .margin({ top: 1 })
        .width('100%')
        .textAlign(TextAlign.Start)
    }
    .onClick(() => {
      this.triggerHapticFeedback();
      this.onMailClick(this.mail);
    })
    .width('90%')
    .padding({ left: 10, right: 10, top: 8, bottom: 8 })
    .margin({top: 4, bottom: 4})
    .borderRadius(14)
    .backgroundColor($r('app.color.card_background_color'))
    .alignItems(HorizontalAlign.Start)
  }
}
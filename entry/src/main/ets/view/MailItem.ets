import { Mail } from '../model/Mail';

@Component
export struct MailItem {
  @Prop mail: Mail;
  onMailClick: (mail: Mail) => void = () => {
  };

  build() {
    Column() {
      Row() {
        Text(this.mail.sender)
          .fontSize(14)
          .fontWeight(this.mail.isRead ? FontWeight.Normal : FontWeight.Bold)
          .fontColor(Color.White)

        Text(this.mail.date)
          .fontSize(12)
          .fontColor('#8E8E93')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)

      Text(this.mail.subject)
        .fontSize(14)
        .fontWeight(this.mail.isRead ? FontWeight.Normal : FontWeight.Bold)
        .fontColor(Color.White)
        .margin({ top: 2 })

      Text(this.mail.preview)
        .fontSize(12)
        .fontColor('#8E8E93')
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .maxLines(1)
        .margin({ top: 2 })
        .width('100%')
        .textAlign(TextAlign.Start)
    }
    .onClick(() => {
      this.onMailClick(this.mail);
    })
    .width('100%')
    .padding({ left: 12, right: 12, top: 10, bottom: 10 })
    .borderRadius(16)
    .backgroundColor('#242426')
    .margin({ top: 4, bottom: 4 })
    .alignItems(HorizontalAlign.Start)
  }
}
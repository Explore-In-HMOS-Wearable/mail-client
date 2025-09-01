import { MailFolder } from '../model/MailFolder';

@Component
export struct FolderItem {
  @Prop folder: MailFolder;
  onFolderClick: (mailFolder: MailFolder) => void = () => {
  };

  build() {
    Row() {
      Row({ space: 8 }) {
        Image(this.folder.icon)
          .width(18)
          .height(18)

        Text(this.folder.name)
          .fontSize(16)
          .fontColor(Color.White)
          .fontWeight(FontWeight.Normal)
      }

      if (this.folder.unreadCount > 0) {
        Text(this.folder.unreadCount.toString())
          .fontSize(14)
          .fontColor(Color.White)
          .backgroundColor('#0A84FF')
          .borderRadius(10)
          .width(20)
          .height(20)
          .textAlign(TextAlign.Center)
          .margin({ left: 8 })
      }

    }
    .width('80%')
    .padding({
      left: 12,
      right: 12,
      top: 10,
      bottom: 10
    })
    .justifyContent(FlexAlign.SpaceBetween)
    .borderRadius(16)
    .backgroundColor('#242426')
    .margin({ top: 4, bottom: 4 })
    .onClick(() => {
      this.onFolderClick(this.folder);
    })
  }
}

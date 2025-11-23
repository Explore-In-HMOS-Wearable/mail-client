import { MailDetail, Recipient } from '../model/MailDetail';
import { MailDetailViewModel } from '../viewmodel/MailDetailViewModel';
import promptAction from '@ohos.promptAction';

@Component
export struct MailDetailPage {
  @State viewModel: MailDetailViewModel = new MailDetailViewModel();
  @State mailDetail: MailDetail = this.viewModel.getMailDetailById(0)!
  @State isReplyVisible: boolean = false;
  @State replyText: string = '';
  @Consume('pageStack') pageStack: NavPathStack;

  sendReply(): void {
    if (this.replyText.trim() !== '') {
      promptAction.showToast({
        message: 'Reply sent!',
        duration: 2000,
      });
      this.replyText = '';
      this.isReplyVisible = false;
    }
  }

  build() {
    NavDestination() {
      Column() {
        Blank()
          .height(32)

        Scroll() {
          Column() {
            Row(){

              Text(this.mailDetail.subject)
                .fontSize(22)
                .fontColor(Color.White)
                .fontWeight(FontWeight.Bold)
                .margin({ top: 16, bottom: 16 })
                .width('100%')
            }
            Row() {
              Image($r('app.media.icon_profile'))
                .width(40)
                .height(40)
                .borderRadius(20)
                .margin({ right: 12 })

              Column() {
                Text(this.mailDetail.sender.name)
                  .fontSize(16)
                  .fontColor(Color.White)
                  .fontWeight(FontWeight.Medium)

                Text(this.mailDetail.sender.email)
                  .fontSize(12)
                  .fontColor('#AAAAAA')
                  .margin({ top: 2 })
              }
              .alignItems(HorizontalAlign.Start)
              .flexGrow(1)
            }
            .width('100%')
            .alignItems(VerticalAlign.Center)

            Row() {
              Text('To:')
                .fontSize(14)
                .fontColor('#BBBBBB')
                .width(50)

              Text(
                this.mailDetail.recipients
                  .map((r: Recipient): string => r.name)
                  .join(', ')
              )
                .fontSize(14)
                .fontColor('#BBBBBB')
                .flexGrow(1)
            }
            .width('100%')
            .margin({ top: 12, bottom: 16 })

            Divider()
              .strokeWidth(1)
              .color('#333333')
              .margin({ top: 4, bottom: 16 })

            Text(this.mailDetail.body)
              .fontSize(16)
              .fontColor(Color.White)
              .width('100%')
          }
          .width('100%')
          .padding({ left: 16, right: 16 })
        }
        .width('100%')
        .layoutWeight(1)

        // Reply UI
        if (this.isReplyVisible) {
          Column() {
            // Header with back button
            Row() {
              Button() {
                Image($r('app.media.icon_back'))
                  .width(20)
                  .height(20)
              }
              .backgroundColor('transparent')
              .height(32)
              .width(32)
              .onClick(() => {
                this.isReplyVisible = false;
                this.replyText = '';
              })

              Text('Reply')
                .fontSize(16)
                .fontColor(Color.White)
                .fontWeight(FontWeight.Medium)
                .flexGrow(1)
                .textAlign(TextAlign.Center)

              Button() {
                Text('Send')
                  .fontSize(14)
                  .fontColor('#0A84FF')
                  .fontWeight(FontWeight.Bold)
              }
              .margin({ right: 8 })
              .backgroundColor('transparent')
              .height(32)
              .onClick(() => {
                this.sendReply();
              })
            }
            .width('100%')
            .padding({ top: 8, bottom: 8 })

            Divider()
              .strokeWidth(1)
              .color('#333333')
              .width('100%')

            // Reply to info
            Row() {
              Text('To: ')
                .fontSize(14)
                .fontColor('#AAAAAA')

              Text(this.mailDetail.sender.name)
                .fontSize(14)
                .fontColor('#FFFFFF')
            }
            .width('100%')
            .padding({ top: 8, bottom: 8 })

            Text('Re: ' + this.mailDetail.subject)
              .fontSize(14)
              .fontColor('#AAAAAA')
              .width('100%')
              .padding({ bottom: 8 })
              .textAlign(TextAlign.Start)

            TextInput({ placeholder: 'Type your reply...', text: this.replyText })
              .placeholderColor('#777777')
              .placeholderFont({ size: 14 })
              .fontSize(14)
              .fontColor(Color.White)
              .backgroundColor('#111111')
              .width('100%')
              .height(40)
              .onChange((value: string) => {
                this.replyText = value;
              })
          }
          .width('100%')
          .height('100%')
          .padding({ left: 10, right: 10 })
          .backgroundColor('#000000')
        } else {
          Button() {
            Image($r('app.media.icon_sent'))
              .width(20)
              .height(20)
          }
          .backgroundColor('#0A84FF')
          .height(36)
          .width(36)
          .borderRadius(18)
          .margin({ top: 8, bottom: 8 })
          .onClick(() => {
            this.isReplyVisible = true;
          })
        }
      }
      .padding(10)
      .width('100%')
      .height('100%')
      .backgroundColor('#000000')
    }.onReady((ctx: NavDestinationContext) => {
      this.pageStack = ctx.pathStack;
      const params = ctx.pathInfo.param as MailDetail ;
      if (params) {
        this.mailDetail = params;
        this.mailDetail = this.viewModel.getMailDetailById(params.id)!
      }
    })
    .hideBackButton(true)
  }
}
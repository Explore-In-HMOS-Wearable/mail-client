import { MailDetail } from '../model/MailDetail';
import { MailDetailViewModel } from '../viewmodel/MailDetailViewModel';
import { MailListViewModel } from '../viewmodel/MailListViewModel';
import { PromptAction } from '@kit.ArkUI';
import GlobalContext from '../util/GlobalContext';
import { common } from '@kit.AbilityKit';

@Component
export struct MailDetailPage {
  @State viewModel: MailDetailViewModel = new MailDetailViewModel();
  @State mailListViewModel: MailListViewModel = new MailListViewModel();
  @State mailDetail: MailDetail = this.viewModel.getMailDetailById(0)!
  @State isReplyVisible: boolean = false;
  @State replyText: string = '';
  @Consume('pageStack') pageStack: NavPathStack;
  private smartReplies: Resource[] = [
    $r('app.string.smart_reply_1'),
    $r('app.string.smart_reply_2'),
    $r('app.string.smart_reply_3'),
    $r('app.string.smart_reply_4')
  ];
  private promptAction: PromptAction = this.getUIContext().getPromptAction();
  private context = GlobalContext.getInstance().getCntx() as common.UIAbilityContext;
  private uiContext = this.getUIContext().getHostContext() as common.UIAbilityContext;

  async sendReply() {
    if (this.replyText.trim() !== '') {
      await this.mailListViewModel.sendDraft(this.mailDetail.id);
      this.replyText = '';
      this.isReplyVisible = false;
      this.promptAction.showToast({ message: $r('app.string.toast_sent') });
      this.pageStack.clear();
      this.pageStack.pushPathByName('HomePage', null);
    }
  }

  build() {
    NavDestination() {
      Stack({ alignContent: Alignment.Bottom }) {
        Scroll() {
          Column() {
            Text(this.mailDetail.subject)
              .fontSize(12)
              .fontColor(Color.White)
              .fontWeight(FontWeight.Bold)
              .width('100%')
              .textAlign(TextAlign.Center)
              .margin({ bottom: 8, top: 16 })

            Row() {
              Image($r('app.media.icon_profile'))
                .width(24)
                .height(24)
                .borderRadius(18)
                .margin({ right: 8 })

              Column() {
                Text(this.mailDetail.sender.name)
                  .fontSize(10)
                  .fontColor(Color.White)
                  .fontWeight(FontWeight.Medium)

                Text(this.mailDetail.sender.email)
                  .fontSize(8)
                  .fontColor($r('app.color.text_secondary'))
              }
              .alignItems(HorizontalAlign.Start)
            }
            .width('72%')
            .backgroundColor($r('app.color.card_background_color'))
            .padding(8)
            .borderRadius(12)
            .margin({ bottom: 10 })

            Text(this.mailDetail.body)
              .fontSize(9)
              .fontColor($r('app.color.body_text_color'))
              .width('90%')
              .lineHeight(16)
              .margin({ bottom: 12 })

            if (!this.isReplyVisible) {
              Text($r('app.string.smart_reply_title'))
                .fontSize(10)
                .fontColor($r('app.color.search_placeholder_color'))
                .margin({ bottom: 6 })

              Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.Center }) {
                ForEach(this.smartReplies, (reply: Resource) => {
                  Button(reply)
                    .fontSize(8)
                    .fontColor(Color.White)
                    .backgroundColor($r('app.color.button_secondary_bg'))
                    .margin(2)
                    .padding({ left: 8, right: 8 })
                    .height(24)
                    .borderRadius(12)
                    .onClick(() => {
                      this.replyText = this.uiContext.resourceManager.getStringSync(reply.id);
                      this.sendReply();
                      this.promptAction.showToast({ message: $r('app.string.toast_sent'), duration: 2000 });
                    })
                }, (reply: Resource) => JSON.stringify(reply))
              }
              .width('90%')
              .margin({ bottom: 80 })
            }
          }
          .width('100%')
          .alignItems(HorizontalAlign.Center)
        }
        .width('100%')
        .height('100%')
        .scrollBar(BarState.Off)

        if (!this.isReplyVisible) {
          Button() {
            Row({ space: 2 }) {
              Image($r('app.media.icon_sent'))
                .width(12)
                .height(12)

              Text($r('app.string.reply_button_text'))
                .fontSize(8)
                .fontWeight(FontWeight.Medium)
                .fontColor(Color.White)
            }
          }
          .backgroundColor($r('app.color.brand_primary'))
          .height(24)
          .width('24%')
          .borderRadius(16)
          .margin({ bottom: 16 })
          .onClick(() => {
            this.isReplyVisible = true;
          })
        }

        if (this.isReplyVisible) {
          Column() {
            Row() {
              Text($r('app.string.reply_to_label'))
                .fontSize(10)
                .fontColor($r('app.color.text_secondary'))
              Text(this.mailDetail.sender.name)
                .fontSize(10)
                .fontColor(Color.White)
                .fontWeight(FontWeight.Medium)
            }
            .width('80%')
            .margin({ bottom: 8, top: 56 })

            TextArea({ placeholder: $r('app.string.reply_placeholder'), text: this.replyText })
              .placeholderColor($r('app.color.textarea_placeholder'))
              .placeholderFont({ size: 8 })
              .fontSize(12)
              .fontColor(Color.White)
              .backgroundColor($r('app.color.card_background_color'))
              .width('82%')
              .height(60)
              .borderRadius(8)
              .margin({ bottom: 10 })
              .onChange((value: string) => {
                this.replyText = value;
              })

            Row({ space: 8 }) {
              Button($r('app.string.cancel_button'))
                .fontSize(10)
                .fontColor(Color.White)
                .backgroundColor($r('app.color.button_cancel_bg'))
                .height(28)
                .layoutWeight(1)
                .borderRadius(16)
                .onClick(() => {
                  this.isReplyVisible = false;
                  this.replyText = '';
                })

              Button($r('app.string.send_button'))
                .fontSize(10)
                .fontColor(Color.White)
                .backgroundColor($r('app.color.brand_primary'))
                .height(28)
                .layoutWeight(1)
                .borderRadius(16)
                .onClick(() => {
                  this.sendReply();
                })
            }
            .width('82%')
          }
          .width('100%')
          .height('100%')
          .backgroundColor($r('app.color.black'))
          .alignItems(HorizontalAlign.Center)
        }
      }
      .width('100%')
      .height('100%')
      .backgroundColor($r('app.color.black'))
    }.onReady((ctx: NavDestinationContext) => {
      this.pageStack = ctx.pathStack;
      const params = ctx.pathInfo.param as MailDetail;
      if (params) {
        this.mailDetail = params;
        this.mailDetail = this.viewModel.getMailDetailById(params.id)!
      }
      this.mailListViewModel.initPreferences(this.context);
    })
    .hideBackButton(true)
  }
}
import { Mail } from '../model/Mail';
import { MailFolder } from '../model/MailFolder';
import { MailListViewModel } from '../viewmodel/MailListViewModel';
import { SearchBar } from '../view/SearchBar';
import { MailItem } from '../view/MailItem';

@Component
export struct MailListPage {
  @State viewModel: MailListViewModel = new MailListViewModel();
  @State mailFolder: MailFolder = new MailFolder(0, '', $r('app.media.icon_all_mail'), 0);

  @Consume('pageStack') pageStack: NavPathStack;

  build() {
    NavDestination() {
      Column() {
        Blank()
          .height(20)
        SearchBar()

        List() {
          ForEach(this.viewModel.getMailsByFolder(this.mailFolder.id), (mail: Mail) => {
            ListItem() {
              MailItem({
                mail: mail,
                onMailClick: (mail: Mail) => {
                  this.pageStack.pushPathByName('MailDetailPage', mail);
                } })
            }
          }, (mail: Mail): string => mail.id.toString())
        }
        .layoutWeight(1)
        .alignListItem(ListItemAlign.Start)
        .listDirection(Axis.Vertical)
        .divider({ strokeWidth: 0 })
      }
      .width('100%')
      .height('100%')
      .padding(8)
      .backgroundColor('#000000')
      .justifyContent(FlexAlign.Start)
      .alignItems(HorizontalAlign.Center)
    }.onReady((ctx: NavDestinationContext) => {
      this.pageStack = ctx.pathStack;
      const params = ctx.pathInfo.param as MailFolder ;
      if (params) {
        this.mailFolder = params;
      }
    })
    .hideBackButton(true)
  }
}

import { Mail } from '../model/Mail';
import { MailFolder } from '../model/MailFolder';
import { MailListViewModel } from '../viewmodel/MailListViewModel';
import { getParams, routePageWithObjectParams, routerBack } from '../util/NavigationHelper';
import { SearchBar } from '../view/SearchBar';
import { MailItem } from '../view/MailItem';

@Component
@Entry
export struct MailListPage {
  @State viewModel: MailListViewModel = new MailListViewModel();
  @State mailFolder: MailFolder = getParams() as MailFolder

  build() {
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
              routePageWithObjectParams('pages/MailDetailPage', mail)
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
  }
}

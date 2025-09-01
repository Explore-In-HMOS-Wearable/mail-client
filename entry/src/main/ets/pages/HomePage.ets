import { HomeViewModel } from '../viewmodel/HomeViewModel';
import { MailFolder } from '../model/MailFolder';
import { routePageWithObjectParams } from '../util/NavigationHelper';
import { FolderItem } from '../view/FolderItem';
import { SearchBar } from '../view/SearchBar';

@Component
@Entry
export struct HomePage {
  @State viewModel: HomeViewModel = new HomeViewModel();

  build() {
    Column() {
      Blank()
        .height(20)
      SearchBar()
      List() {
        ForEach(this.viewModel.getMailFolders(), (folder: MailFolder) => {
          ListItem() {
            FolderItem({
              folder: folder,
              onFolderClick: (folder: MailFolder) => {
                  routePageWithObjectParams('pages/MailListPage', folder)
              }
            })
          }
        }, (folder: MailFolder): string => folder.id.toString())
      }
      .layoutWeight(1)
      .alignListItem(ListItemAlign.Center)
      .listDirection(Axis.Vertical)
      .divider({ strokeWidth: 0 })
      .margin({ bottom: 20 })
      Blank()
        .height(10)
    }
    .width('100%')
    .height('100%')
    .padding(8)
    .backgroundColor('#000000')
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
  }
}
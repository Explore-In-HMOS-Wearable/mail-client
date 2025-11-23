import { HomeViewModel } from '../viewmodel/HomeViewModel';
import { MailFolder } from '../model/MailFolder';
import { FolderItem } from '../view/FolderItem';
import { SearchBar } from '../view/SearchBar';

@Component
export struct HomePage {
  @Consume('pageStack') pageStack: NavPathStack;
  @State viewModel: HomeViewModel = new HomeViewModel();

  build() {
    NavDestination() {
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
                  this.pageStack.pushPathByName('MailListPage', folder);
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
    }.onReady((ctx: NavDestinationContext) => {
      this.pageStack = ctx.pathStack;
    })
    .hideBackButton(true)
  }
}
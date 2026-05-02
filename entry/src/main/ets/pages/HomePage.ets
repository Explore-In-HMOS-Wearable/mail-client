import { HomeViewModel } from '../viewmodel/HomeViewModel';
import { MailFolder } from '../model/MailFolder';
import { FolderItem } from '../view/FolderItem';
import { MailListViewModel } from '../viewmodel/MailListViewModel';
import GlobalContext from '../util/GlobalContext';
import { common } from '@kit.AbilityKit';

@Component
export struct HomePage {
  @Consume('pageStack') pageStack: NavPathStack;
  @State viewModel: HomeViewModel = new HomeViewModel();
  @State mailListViewModel: MailListViewModel = new MailListViewModel();
  private context = GlobalContext.getInstance().getCntx() as common.UIAbilityContext;

  build() {
    NavDestination() {
      Column() {
        List() {
          ListItem() {
            Column() {
              Text('Mail')
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .fontColor(Color.White)
                .margin({ bottom: 8, top: 12 })
            }.width('100%')
          }

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
        .width('100%')
        .height('100%')
        .alignListItem(ListItemAlign.Center)
        .listDirection(Axis.Vertical)
        .scrollBar(BarState.Off)
        .edgeEffect(EdgeEffect.Spring)
      }
      .width('100%')
      .height('100%')
      .backgroundColor('#000000')
    }.onReady((ctx: NavDestinationContext) => {
      this.pageStack = ctx.pathStack;
      this.mailListViewModel.initPreferences(this.context);
    })
    .hideBackButton(true)
  }
}
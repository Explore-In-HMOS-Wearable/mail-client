import { HomePage } from './HomePage';
import { MailDetailPage } from './MailDetailPage';
import { MailListPage } from './MailListPage';

@Entry
@Component
struct Index {
  @Provide('pageStack') pageStack: NavPathStack = new NavPathStack();

  @Builder
  Pages(name: string) {
    if (name === 'HomePage') {
      HomePage();
    } else if (name === 'MailDetailPage') {
      MailDetailPage();
    } else if (name === 'MailListPage') {
      MailListPage();
    }
  }

  build() {
    Navigation(this.pageStack)
      .mode(NavigationMode.Stack)
      .navDestination(this.Pages)
      .hideNavBar(true)
      .onAppear(() => {
        if (this.pageStack.getAllPathName().length === 0) {
          this.pageStack.pushPathByName('HomePage', null);
        }
      })
  }
}
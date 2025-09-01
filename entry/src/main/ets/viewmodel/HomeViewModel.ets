import { MailFolder } from '../model/MailFolder';

export class HomeViewModel {
  mailFolders: Array<MailFolder> = [
    new MailFolder(1, 'Inbox', $r('app.media.icon_all_mail'), 5),
    new MailFolder(2, 'Drafts', $r('app.media.icon_draft'), 0),
    new MailFolder(3, 'Sent', $r('app.media.icon_sent'), 0),
    new MailFolder(4, 'Trash', $r('app.media.icon_trash'), 0),
  ];

  getMailFolders(): Array<MailFolder> {
    return this.mailFolders;
  }
}
export class Mail {
  id: number;
  folderId: number;
  sender: string;
  subject: string;
  preview: string;
  date: string;
  isRead: boolean;
  isStarred: boolean;

  constructor(
    id: number, folderId: number, sender: string, subject: string, preview: string,
    date: string, isRead: boolean = true, isStarred: boolean = false) {
    this.id = id;
    this.folderId = folderId;
    this.sender = sender;
    this.subject = subject;
    this.preview = preview;
    this.date = date;
    this.isRead = isRead;
    this.isStarred = isStarred;
  }
}
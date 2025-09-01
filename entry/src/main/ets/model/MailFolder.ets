export class MailFolder {
  id: number;
  name: string;
  icon: Resource;
  unreadCount: number;

  constructor(id: number, name: string, icon: Resource, unreadCount: number = 0) {
    this.id = id;
    this.name = name;
    this.icon = icon;
    this.unreadCount = unreadCount;
  }
}
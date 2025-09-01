import { Mail } from '../model/Mail';

export class MailListViewModel {
  private mails: Array<Mail> = [
  // Inbox mails
    new Mail(1, 1, 'John Smith', 'Project Update', 'Here are the latest updates for the project...', '10:30 AM', false, true),
    new Mail(2, 1, 'Alice Johnson', 'Meeting Tomorrow', 'Can we schedule a meeting tomorrow at 2 PM?', '9:15 AM', false),
    new Mail(3, 1, 'Team Slack', 'New message', 'Jane posted a new message in the design channel', 'Yesterday', false),
    new Mail(4, 1, 'Newsletter', 'Weekly Digest', 'Check out this week\'s top stories and updates', 'Yesterday', true),
    new Mail(5, 1, 'Bob Wilson', 'Feedback Requested', 'Could you please review the document I sent?', 'Monday', true),

    // Draft mails
    new Mail(6, 2, 'Draft', 'Follow-up on project', 'Thank you for your time yesterday...', '3:20 PM', true),
    new Mail(7, 2, 'Draft', 'Vacation Request', 'I would like to request time off next month...', 'Sunday', true),

    // Sent mails
    new Mail(8, 3, 'To: Marketing Team', 'Campaign Ideas', 'Here are some ideas for our next campaign...', 'Friday', true),
    new Mail(9, 3, 'To: David Brown', 'Document Shared', 'I\'ve shared the document you requested...', 'Thursday', true),

    // Trash mails
    new Mail(10, 4, 'Special Offer', '90% OFF TODAY ONLY!', 'Don\'t miss this exclusive deal...', 'Tuesday', true),
  ];

  getMailsByFolder(folderId: number): Array<Mail> {
    return this.mails.filter(
      (mail: Mail): boolean => mail.folderId === folderId
    );
  }
}

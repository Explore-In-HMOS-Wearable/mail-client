import { MailDetail, Recipient, Sender } from '../model/MailDetail';

export class MailDetailViewModel {
  private mailDetails: Array<MailDetail> = [
    {
      id: 1,
      subject: 'Project Update',
      sender: { name: 'John Smith', email: 'john.smith@example.com', avatar: 'https://example.com/avatars/john.png' } as Sender,
      recipients: [
        { name: 'You', email: 'you@example.com' } as Recipient
      ] as Recipient[],
      date: '10:30 AM',
      body: 'Here are the latest updates for the project...'
    },
    {
      id: 2,
      subject: 'Meeting Tomorrow',
      sender: { name: 'Alice Johnson', email: 'alice.johnson@example.com', avatar: 'https://example.com/avatars/alice.png' } as Sender,
      recipients: [
        { name: 'You', email: 'you@example.com' } as Recipient
      ] as Recipient[],
      date: '9:15 AM',
      body: 'Can we schedule a meeting tomorrow at 2 PM?'
    },
    {
      id: 3,
      subject: 'New message',
      sender: { name: 'Team Slack', email: 'no-reply@example.com', avatar: 'https://example.com/avatars/slack.png' } as Sender,
      recipients: [
        { name: 'You', email: 'you@example.com' } as Recipient
      ] as Recipient[],
      date: 'Yesterday',
      body: 'Jane posted a new message in the design channel'
    },
    {
      id: 4,
      subject: 'Weekly Digest',
      sender: { name: 'Newsletter', email: 'newsletter@example.com', avatar: 'https://example.com/avatars/newsletter.png' } as Sender,
      recipients: [
        { name: 'You', email: 'you@example.com' } as Recipient
      ] as Recipient[],
      date: 'Yesterday',
      body: 'Check out this week\'s top stories and updates'
    },
    {
      id: 5,
      subject: 'Feedback Requested',
      sender: { name: 'Bob Wilson', email: 'bob.wilson@example.com', avatar: 'https://example.com/avatars/bob.png' } as Sender,
      recipients: [
        { name: 'You', email: 'you@example.com' } as Recipient
      ] as Recipient[],
      date: 'Monday',
      body: 'Could you please review the document I sent?'
    },
    // Drafts
    {
      id: 6,
      subject: 'Follow-up on project',
      sender: { name: 'Draft', email: 'you@example.com', avatar: '' } as Sender,
      recipients: [
        { name: 'Project Team', email: 'team@example.com' } as Recipient
      ] as Recipient[],
      date: '3:20 PM',
      body: 'Thank you for your time yesterday...'
    },
    {
      id: 7,
      subject: 'Vacation Request',
      sender: { name: 'Draft', email: 'you@example.com', avatar: '' } as Sender,
      recipients: [
        { name: 'HR Department', email: 'hr@example.com' } as Recipient
      ] as Recipient[],
      date: 'Sunday',
      body: 'I would like to request time off next month...'
    },
    // Sent
    {
      id: 8,
      subject: 'Campaign Ideas',
      sender: { name: 'You', email: 'you@example.com', avatar: '' } as Sender,
      recipients: [
        { name: 'Marketing Team', email: 'marketing@example.com' } as Recipient
      ] as Recipient[],
      date: 'Friday',
      body: 'Here are some ideas for our next campaign...'
    },
    {
      id: 9,
      subject: 'Document Shared',
      sender: { name: 'You', email: 'you@example.com', avatar: '' } as Sender,
      recipients: [
        { name: 'David Brown', email: 'david.brown@example.com' } as Recipient
      ] as Recipient[],
      date: 'Thursday',
      body: 'I\'ve shared the document you requested...'
    },
    // Trash
    {
      id: 10,
      subject: '90% OFF TODAY ONLY!',
      sender: { name: 'Special Offer', email: 'offers@example.com', avatar: '' } as Sender,
      recipients: [
        { name: 'You', email: 'you@example.com' } as Recipient
      ] as Recipient[],
      date: 'Tuesday',
      body: 'Don\'t miss this exclusive deal...'
    }
  ];

  /**
   * Returns the MailDetail for the given id, or undefined if not found.
   */
  getMailDetailById(id: number): MailDetail | undefined {
    return this.mailDetails.find(
      (detail: MailDetail): boolean => detail.id === id
    );
  }
}

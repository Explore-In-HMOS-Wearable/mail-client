export interface Person {
  name: string;
  email: string;
}

export interface Sender extends Person {
  avatar: string;
}

export interface Recipient extends Person {
}

export interface MailDetail {
  id: number;
  subject: string;
  sender: Sender;
  recipients: Array<Recipient>;
  date: string;
  body: string;
}
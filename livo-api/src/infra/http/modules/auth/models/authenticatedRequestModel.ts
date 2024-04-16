import { Request } from 'express';

export class AuthenticatedRequestModel extends Request {
  user: {
    id: number;
    email: string;
    name: string;
  };
}

/// <reference types="express" />
export declare class AuthenticatedRequestModel extends Request {
    user: {
        id: string;
        email: string;
        nome: string;
    };
}

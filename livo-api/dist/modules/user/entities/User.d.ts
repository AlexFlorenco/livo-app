export declare class User {
    private _id;
    private _nome;
    private _email;
    private _senha;
    constructor(nome: string, email: string, senha: string);
    get id(): string;
    get nome(): string;
    set nome(nome: string);
    get email(): string;
    set email(email: string);
    get senha(): string;
    set senha(senha: string);
}

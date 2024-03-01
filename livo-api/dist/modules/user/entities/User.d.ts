export declare class User {
    private props;
    constructor(nome: string, email: string, senha: string, id?: string);
    get id(): string;
    get nome(): string;
    set nome(nome: string);
    get email(): string;
    set email(email: string);
    get senha(): string;
    set senha(senha: string);
}

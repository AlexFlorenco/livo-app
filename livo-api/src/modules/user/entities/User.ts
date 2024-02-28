import { randomUUID } from "crypto";

export class User {
    private _id: string = randomUUID();
    private _nome: string;
    private _email: string;
    private _senha: string;

    constructor(nome: string, email: string, senha: string) {
        this._nome = nome;
        this._email = email;
        this._senha = senha;
    }

    get id(): string {
        return this._id;
    }

    get nome(): string {
        return this._nome;
    }

    set nome(nome: string) {
        this._nome = nome;
    }

    get email(): string {
        return this._email;
    }

    set email(email: string) {
        this._email = email;
    }

    get senha(): string {
        return this._senha;
    }

    set senha(senha: string) {
        this._senha = senha;
    }
}
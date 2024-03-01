import { randomUUID } from "crypto";

export class User {
    private props: {
        nome: string;
        email: string;
        senha: string;
        id: string;
    }

    constructor(nome: string, email: string, senha: string, id: string = randomUUID()) {
        this.props = {
            nome, email, senha, id,
        };
    };

    get id(): string {
        return this.props.id;
    }

    get nome(): string {
        return this.props.nome;
    }

    set nome(nome: string) {
        this.props.nome = nome;
    }

    get email(): string {
        return this.props.email;
    }

    set email(email: string) {
        this.props.email = email;
    }

    get senha(): string {
        return this.props.senha;
    }

    set senha(senha: string) {
        this.props.senha = senha;
    }
}
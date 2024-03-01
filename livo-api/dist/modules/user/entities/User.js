"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.User = void 0;
const crypto_1 = require("crypto");
class User {
    constructor(nome, email, senha, id = (0, crypto_1.randomUUID)()) {
        this.props = {
            nome, email, senha, id,
        };
    }
    ;
    get id() {
        return this.props.id;
    }
    get nome() {
        return this.props.nome;
    }
    set nome(nome) {
        this.props.nome = nome;
    }
    get email() {
        return this.props.email;
    }
    set email(email) {
        this.props.email = email;
    }
    get senha() {
        return this.props.senha;
    }
    set senha(senha) {
        this.props.senha = senha;
    }
}
exports.User = User;
//# sourceMappingURL=User.js.map
"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.User = void 0;
const crypto_1 = require("crypto");
class User {
    constructor(nome, email, senha) {
        this._id = (0, crypto_1.randomUUID)();
        this._nome = nome;
        this._email = email;
        this._senha = senha;
    }
    get id() {
        return this._id;
    }
    get nome() {
        return this._nome;
    }
    set nome(nome) {
        this._nome = nome;
    }
    get email() {
        return this._email;
    }
    set email(email) {
        this._email = email;
    }
    get senha() {
        return this._senha;
    }
    set senha(senha) {
        this._senha = senha;
    }
}
exports.User = User;
//# sourceMappingURL=User.js.map
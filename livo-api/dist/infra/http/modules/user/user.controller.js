"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
var __param = (this && this.__param) || function (paramIndex, decorator) {
    return function (target, key) { decorator(target, key, paramIndex); }
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.UserController = void 0;
const common_1 = require("@nestjs/common");
const createUserBody_1 = require("./dtos/createUserBody");
const User_1 = require("../../../../modules/user/entities/User");
const UserRepository_1 = require("../../../database/repositories/UserRepository");
const isPublic_1 = require("../auth/decorators/isPublic");
let UserController = class UserController {
    constructor(userRepository) {
        this.userRepository = userRepository;
    }
    async createPost(body) {
        const { nome, email, senha } = body;
        const user = new User_1.User(nome, email, senha);
        await this.userRepository.create(user);
        return {
            id: user.id,
            nome: user.nome,
            email: user.email,
        };
    }
};
exports.UserController = UserController;
__decorate([
    (0, common_1.Post)(),
    (0, isPublic_1.Public)(),
    __param(0, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [createUserBody_1.CreateUserBody]),
    __metadata("design:returntype", Promise)
], UserController.prototype, "createPost", null);
exports.UserController = UserController = __decorate([
    (0, common_1.Controller)('users'),
    __metadata("design:paramtypes", [UserRepository_1.UserRepository])
], UserController);
//# sourceMappingURL=user.controller.js.map
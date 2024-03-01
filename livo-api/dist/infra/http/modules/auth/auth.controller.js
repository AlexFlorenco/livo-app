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
exports.AuthController = void 0;
const common_1 = require("@nestjs/common");
const authRequestModel_1 = require("./models/authRequestModel");
const jwt_1 = require("@nestjs/jwt");
const localAuth_guard_1 = require("./guards/localAuth.guard");
const jwtAuth_guard_1 = require("./guards/jwtAuth.guard");
const isPublic_1 = require("./decorators/isPublic");
const authenticatedRequestModel_1 = require("./models/authenticatedRequestModel");
let AuthController = class AuthController {
    constructor(jwtService) {
        this.jwtService = jwtService;
    }
    async signIn(request) {
        const payload = {
            sub: request.user.id,
            email: request.user.email,
            nome: request.user.nome,
        };
        const access_token = this.jwtService.sign(payload);
        return { access_token };
    }
    async test(request) {
        return request.user;
    }
};
exports.AuthController = AuthController;
__decorate([
    (0, common_1.Post)('signIn'),
    (0, isPublic_1.Public)(),
    (0, common_1.HttpCode)(common_1.HttpStatus.OK),
    (0, common_1.UseGuards)(localAuth_guard_1.LocalAuthGuard),
    __param(0, (0, common_1.Request)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [authRequestModel_1.AuthRequestModel]),
    __metadata("design:returntype", Promise)
], AuthController.prototype, "signIn", null);
__decorate([
    (0, common_1.Get)('test'),
    (0, common_1.UseGuards)(jwtAuth_guard_1.JwtAuthGuard),
    __param(0, (0, common_1.Request)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [authenticatedRequestModel_1.AuthenticatedRequestModel]),
    __metadata("design:returntype", Promise)
], AuthController.prototype, "test", null);
exports.AuthController = AuthController = __decorate([
    (0, common_1.Controller)(),
    __metadata("design:paramtypes", [jwt_1.JwtService])
], AuthController);
//# sourceMappingURL=auth.controller.js.map
"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.UserViewModel = void 0;
class UserViewModel {
    static toHttp({ id, nome, email }) {
        return {
            id,
            nome,
            email,
        };
    }
}
exports.UserViewModel = UserViewModel;
//# sourceMappingURL=userViewModel.js.map
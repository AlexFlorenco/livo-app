import { User } from "src/modules/user/entities/User";
export declare class UserViewModel {
    static toHttp({ id, nome, email }: User): {
        id: string;
        nome: string;
        email: string;
    };
}

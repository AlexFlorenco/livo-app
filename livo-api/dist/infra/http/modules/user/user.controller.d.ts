import { CreateUserBody } from "./dtos/createUserBody";
import { UserRepository } from "src/infra/database/prisma/repositories/UserRepository";
export declare class UserController {
    private userRepository;
    constructor(userRepository: UserRepository);
    createPost(body: CreateUserBody): Promise<{
        id: string;
        nome: string;
        email: string;
    }>;
}

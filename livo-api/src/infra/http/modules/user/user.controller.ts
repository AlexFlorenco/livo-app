import { Body, Controller, Post } from "@nestjs/common";
import { CreateUserBody } from "./dtos/createUserBody";
import { User } from "src/modules/user/entities/User";
import { UserRepository } from "src/infra/database/prisma/repositories/UserRepository";

@Controller('users')
export class UserController {
    constructor(private userRepository: UserRepository) { }

    // Extrai as constantes do body, cria um novo objeto User, e manda para o repository criar o usuário no banco
    @Post()
    async createPost(@Body() body: CreateUserBody) {
        const { nome, email, senha } = body;

        const user = new User(
            nome,
            email,
            senha,
        )

        await this.userRepository.create(user);

        return {
            id: user.id,
            nome: user.nome,
            email: user.email,
        };
    }
}
import { User } from "src/modules/user/entities/User";
import { PrismaService } from "../prisma.service";
import { Injectable, UnauthorizedException } from "@nestjs/common";

@Injectable()
export class UserRepository {
    constructor(private prisma: PrismaService) { }

    // Cria o usuário no banco de dados através do Prisma
    async create(user: User): Promise<void> {
        const { id, nome, email, senha } = user;

        await this.prisma.user.create({
            data: { id, nome, email, senha },
        });
    }

    // Busca no banco um usuário pelo email, retornando o usuário ou nulo
    async findByEmail(email: string): Promise<User | null> {
        const user = await this.prisma.user.findUnique({
            where: {
                email
            }
        })

        if (!user) return null;

        const userFound = new User(user.nome, user.email, user.senha, user.id);

        return userFound;
    }
}

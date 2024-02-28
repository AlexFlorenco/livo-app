import { User } from "src/modules/user/entities/User";
import { PrismaService } from "../prisma.service";
import { Injectable } from "@nestjs/common";

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
}

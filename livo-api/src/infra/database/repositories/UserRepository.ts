import { User } from "src/modules/user/entities/User";
import { PrismaService } from "../prisma.service";
import { Injectable } from "@nestjs/common";
import { ReadUserDTO } from "src/infra/http/modules/user/dtos/ReadUsers.dto";

@Injectable()
export class UserRepository {
    constructor(private prisma: PrismaService) { }

    async createUser(user: User): Promise<void> {
        const { id, nome, email, senha } = user;

        await this.prisma.user.create({
            data: { id, nome, email, senha },
        });
    }

    async findUserByEmail(email: string): Promise<User | null> {
        const userFound = await this.prisma.user.findUnique({
            where: {
                email
            }
        })

        if (!userFound) return null;

        const user = new User(userFound.nome, userFound.email, userFound.senha, userFound.id);

        return user;
    }

    async readUsers(): Promise<ReadUserDTO[]> {
        const listUsers = await this.prisma.user.findMany();
        const users = listUsers.map(user => new ReadUserDTO(user.id, user.nome, user.email));
        return users;

    }

    async updateUser(id: string, updatedData: Partial<User>): Promise<void> {
        await this.prisma.user.update({
            where: { id },
            data: updatedData,
        })
    }

    async deleteUser(id: string): Promise<void> {
        await this.prisma.user.delete({
            where: { id }
        })
    }
}

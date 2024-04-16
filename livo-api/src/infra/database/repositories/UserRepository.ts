import { User } from 'src/modules/user/entities/User';
import { PrismaService } from '../prisma.service';
import { Injectable } from '@nestjs/common';
import { ReadUserDTO } from 'src/infra/http/modules/user/dtos/ReadUsers.dto';

@Injectable()
export class UserRepository {
  constructor(private prisma: PrismaService) { }

  async createUser(name: string, email: string, password: string): Promise<any> {
    // const { name, email, password } = user;

    const user = await this.prisma.user.create({
      data: { name, email, password },
    });

    return user;
  }

  async findUserByEmail(email: string): Promise<User | null> {
    const userFound = await this.prisma.user.findUnique({
      where: {
        email,
      },
    });

    if (!userFound) return null;

    const user = new User(
      userFound.id,
      userFound.name,
      userFound.email,
      userFound.password,
      userFound.photoUrl ?? "",
      userFound.gradeId ?? 0,
    );

    return user;
  }

  async readUsers(): Promise<ReadUserDTO[]> {
    const listUsers = await this.prisma.user.findMany();
    const users = listUsers.map(
      (user) => new ReadUserDTO(user.id, user.name, user.email, user.password),
    );
    return users;
  }

  async updateUser(id: number, updatedData: Partial<User>): Promise<void> {
    await this.prisma.user.update({
      where: { id },
      data: updatedData,
    });
  }

  async deleteUser(id: number): Promise<void> {
    await this.prisma.user.delete({
      where: { id },
    });
  }
}

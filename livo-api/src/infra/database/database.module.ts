import { Module } from "@nestjs/common";
import { PrismaService } from "./prisma/prisma.service";
import { UserRepository } from "./prisma/repositories/UserRepository";

@Module({
    providers: [
        PrismaService,
        UserRepository,
    ],
    exports: [UserRepository],
})
export class DatabaseModule { }

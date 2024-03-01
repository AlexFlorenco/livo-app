import { Module } from "@nestjs/common";
import { PrismaService } from "./prisma.service";
import { UserRepository } from "./repositories/UserRepository";

@Module({
    providers: [
        PrismaService,
        UserRepository,
    ],
    exports: [UserRepository],
})
export class DatabaseModule { }

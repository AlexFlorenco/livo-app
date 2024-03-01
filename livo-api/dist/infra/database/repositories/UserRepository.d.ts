import { User } from "src/modules/user/entities/User";
import { PrismaService } from "../prisma.service";
export declare class UserRepository {
    private prisma;
    constructor(prisma: PrismaService);
    create(user: User): Promise<void>;
    findByEmail(email: string): Promise<User | null>;
}

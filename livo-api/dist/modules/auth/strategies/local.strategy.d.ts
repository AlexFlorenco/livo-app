import { Strategy } from 'passport-local';
import { UserRepository } from 'src/infra/database/repositories/UserRepository';
declare const LocalStrategy_base: new (...args: any[]) => Strategy;
export declare class LocalStrategy extends LocalStrategy_base {
    private userRepository;
    constructor(userRepository: UserRepository);
    validate(email: string, senha: string): Promise<import("../../user/entities/User").User>;
}
export {};

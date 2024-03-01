import { Strategy } from 'passport-local';
import { PassportStrategy } from '@nestjs/passport';
import { Injectable, UnauthorizedException } from '@nestjs/common';
import { UserRepository } from 'src/infra/database/repositories/UserRepository';

@Injectable()
export class LocalStrategy extends PassportStrategy(Strategy) {
    constructor(private userRepository: UserRepository) {
        super({
            usernameField: 'email',
            passwordField: 'senha'
        });
    }

    async validate(email: string, senha: string) {
        const user = await this.userRepository.findByEmail(email);

        if (user) {
            if (senha == user.senha) return user;
        }

        throw new UnauthorizedException('Dados incorretos!!!');
    }
}
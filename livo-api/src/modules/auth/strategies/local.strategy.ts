import { Strategy } from 'passport-local';
import { PassportStrategy } from '@nestjs/passport';
import { Injectable, UnauthorizedException, UseFilters } from '@nestjs/common';
import { UserRepository } from 'src/infra/database/repositories/UserRepository';
import { UserExceptionFilter } from 'src/infra/http/modules/user/filters/UserExceptionFilter';

@Injectable()
export class LocalStrategy extends PassportStrategy(Strategy) {
    constructor(private userRepository: UserRepository) {
        super({
            usernameField: 'email',
            passwordField: 'senha'
        });
    }

    async validate(email: string, senha: string) {
        const user = await this.userRepository.findUserByEmail(email);

        if (user) {
            if (senha == user.senha) return user;
        }

        throw new UnauthorizedException('E-mail ou senha incorretos');
    }
}
import { Strategy } from 'passport-local';
import { PassportStrategy } from '@nestjs/passport';
import { Injectable, UnauthorizedException } from '@nestjs/common';
import { UserRepository } from 'src/infra/database/repositories/UserRepository';

@Injectable()
export class LocalStrategy extends PassportStrategy(Strategy) {
  constructor(private userRepository: UserRepository) {
    super({
      usernameField: 'email',
      passwordField: 'password',
    });
  }

  async validate(email: string, password: string) {
    const user = await this.userRepository.findUserByEmail(email);

    if (user) {
      if (password == user.password) return user;
    }

    throw new UnauthorizedException('E-mail ou senha incorretos');
  }
}

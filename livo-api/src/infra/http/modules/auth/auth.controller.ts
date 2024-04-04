import {
  Controller,
  Get,
  HttpCode,
  HttpStatus,
  Post,
  Request,
  UseGuards,
} from '@nestjs/common';
import { AuthRequestModel } from './models/authRequestModel';
import { JwtService } from '@nestjs/jwt';
import { LocalAuthGuard } from './guards/localAuth.guard';
import { JwtAuthGuard } from './guards/jwtAuth.guard';
import { Public } from './decorators/isPublic';
import { AuthenticatedRequestModel } from './models/authenticatedRequestModel';

@Controller()
export class AuthController {
  constructor(private jwtService: JwtService) {}

  @Post('signIn')
  @Public()
  @HttpCode(HttpStatus.OK)
  @UseGuards(LocalAuthGuard)
  async signIn(@Request() request: AuthRequestModel) {
    const { nome, email, id } = request.user;
    const payload = {
      sub: request.user.id,
      email: request.user.email,
      nome: request.user.nome,
    };
    const access_token = this.jwtService.sign(payload);

    return { access_token, id, nome, email };
  }

  @Get('test')
  @UseGuards(JwtAuthGuard)
  async test(@Request() request: AuthenticatedRequestModel) {
    return request.user;
  }
}

import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Post,
  Put,
  UseFilters,
} from '@nestjs/common';
import { CreateUserDTO } from './dtos/CreateUser.dto';
import { User } from 'src/modules/user/entities/User';
import { UserRepository } from 'src/infra/database/repositories/UserRepository';
import { Public } from '../auth/decorators/isPublic';
import { UpdateUserDTO } from './dtos/UpdateUser.dto';
import { UserExceptionFilter } from 'src/infra/http/modules/user/filters/UserExceptionFilter';

@Controller('users')
@UseFilters(new UserExceptionFilter())
export class UserController {
  constructor(private userRepository: UserRepository) { }

  @Post()
  @Public()
  async createUser(@Body() body: CreateUserDTO) {
    const { nome, email, senha } = body;
    const user = new User(nome, email, senha);

    await this.userRepository.createUser(user);

    return {
      message: 'Usuário criado com sucesso',
      id: user.id,
      nome: user.nome,
      email: user.email,
    };
  }

  @Get()
  @Public()
  async readUsers() {
    const users = await this.userRepository.readUsers();

    return { users };
  }

  @Put('/:id')
  @Public()
  async updateUser(@Param('id') id: string, @Body() body: UpdateUserDTO) {
    await this.userRepository.updateUser(id, body);

    return {
      message: 'Usuário atualizado com sucesso',
    };
  }

  @Delete('/:id')
  @Public()
  async deleteUser(@Param('id') id: string) {
    await this.userRepository.deleteUser(id);

    return {
      message: 'Usuário removido com sucesso',
    };
  }
}

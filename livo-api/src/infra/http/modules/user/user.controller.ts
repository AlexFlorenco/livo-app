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
    const { name, email, password } = body;
    // const user = new User(name, email, password);

    const user = await this.userRepository.createUser(name, email, password);

    return {
      message: 'Usuário criado com sucesso',
      id: user.id,
      name: user.name,
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
  async updateUser(@Param('id') id: number, @Body() body: UpdateUserDTO) {
    await this.userRepository.updateUser(Number(id), body);

    return {
      message: 'Usuário atualizado com sucesso',
    };
  }

  @Delete('/:id')
  @Public()
  async deleteUser(@Param('id') id: number) {
    await this.userRepository.deleteUser(Number(id));

    return {
      message: 'Usuário removido com sucesso',
    };
  }
}

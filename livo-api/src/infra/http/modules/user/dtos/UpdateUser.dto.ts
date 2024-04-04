import { IsOptional } from 'class-validator';
import { CreateUserDTO } from './CreateUser.dto';
import { PartialType } from '@nestjs/mapped-types';

export class UpdateUserDTO extends PartialType(CreateUserDTO) {
  @IsOptional()
  nome: string;

  @IsOptional()
  email: string;

  @IsOptional()
  senha: string;
}

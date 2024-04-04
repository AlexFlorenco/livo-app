import { IsEmail, IsNotEmpty, IsString, MinLength } from 'class-validator';

export class CreateUserDTO {
  @IsString({ message: 'Tipo de dado inválido' })
  @IsNotEmpty({ message: 'O campo nome não pode ser vazio' })
  nome: string;

  @IsString({ message: 'Tipo de dado inválido' })
  @IsEmail({}, { message: 'Insira um e-mail válido' })
  @IsNotEmpty({ message: 'O campo e-mail não pode ser vazio' })
  email: string;

  @IsString({ message: 'Tipo de dado inválido' })
  @IsNotEmpty({ message: 'O campo senha não pode ser vazio' })
  @MinLength(6, { message: 'Escolha uma senha mais forte' })
  senha: string;
}

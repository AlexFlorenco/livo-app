import { IsEmail, IsNotEmpty, IsString } from "class-validator";

export class CreateUserBody {
    @IsString()
    @IsNotEmpty()
    nome: string;

    @IsEmail()
    @IsString()
    @IsNotEmpty()
    email: string;

    @IsString()
    @IsNotEmpty()
    senha: string;

}

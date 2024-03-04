import { IsEmail, IsNotEmpty, IsOptional, IsString, MinLength } from "class-validator";

export class UpdateUserDTO {

    @IsString()
    @IsNotEmpty()
    @IsOptional()
    nome: string;

    @IsEmail()
    @IsString()
    @IsNotEmpty()
    @IsOptional()
    email: string;

    @IsString()
    @IsNotEmpty()
    @MinLength(6)
    @IsOptional()
    senha: string;
}
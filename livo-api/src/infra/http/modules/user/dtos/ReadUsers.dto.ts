export class ReadUserDTO {
  constructor(
    readonly id: string,
    readonly nome: string,
    readonly email: string,
    readonly senha: string,
  ) {}
}

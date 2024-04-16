export class ReadUserDTO {
  constructor(
    readonly id: number,
    readonly name: string,
    readonly email: string,
    readonly password: string,
  ) { }
}

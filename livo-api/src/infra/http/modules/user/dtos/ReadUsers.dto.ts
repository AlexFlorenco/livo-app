export class ReadUserDTO {
    constructor(
        readonly id: String,
        readonly nome: String,
        readonly email: String,
        readonly senha: String,
    ) { }

}
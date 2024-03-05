import { ArgumentsHost, Catch, ExceptionFilter, HttpStatus } from '@nestjs/common';
import { PrismaClientKnownRequestError } from '@prisma/client/runtime/library';

@Catch(PrismaClientKnownRequestError)
export class UserExceptionFilter implements ExceptionFilter {
    catch(exception: PrismaClientKnownRequestError, host: ArgumentsHost) {
        const context = host.switchToHttp();
        const response = context.getResponse();
        const prismaStatusCode = exception.code;
        let httpStatusCode: HttpStatus = response.statusCode;
        let message: String = response.statusMessage;

        if (prismaStatusCode === 'P2002') {
            httpStatusCode = HttpStatus.CONFLICT;
            message = 'Este e-mail já está em uso';

        } else if (prismaStatusCode === 'P2025') {
            httpStatusCode = HttpStatus.NOT_FOUND;
            message = 'Usuário não encontrado';

        } else if (prismaStatusCode === 'P2003') {
            httpStatusCode = HttpStatus.BAD_REQUEST;
            message = 'Não é possível remover este usuário';
        }

        response.status(httpStatusCode).json({
            statusCode: httpStatusCode,
            message: message
        })
    }
}

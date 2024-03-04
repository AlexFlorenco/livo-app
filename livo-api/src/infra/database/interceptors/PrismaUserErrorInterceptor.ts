import { BadRequestException, CallHandler, ConflictException, ExecutionContext, Injectable, InternalServerErrorException, NestInterceptor, NotFoundException } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';

@Injectable()
export class PrismaUserErrorInterceptor implements NestInterceptor {
    intercept(context: ExecutionContext, next: CallHandler): Observable<any> {
        return next
            .handle()
            .pipe(
                catchError((error) => {
                    if (error instanceof Prisma.PrismaClientKnownRequestError) {
                        if (error.code === 'P2002') {
                            throw new ConflictException('Este e-mail já está em uso');
                        } else if (error.code === 'P2025') {
                            throw new NotFoundException('Usuário não encontrado');
                        } else if (error.code === 'P2003') {
                            throw new BadRequestException('Não é possível remover este usuário');
                        }
                    } else if (error instanceof BadRequestException) {
                        throw error;
                    }
                    return throwError(() => new InternalServerErrorException("Erro interno"));
                }),
            );
    }
}

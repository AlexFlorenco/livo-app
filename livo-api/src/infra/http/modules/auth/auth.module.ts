import { MiddlewareConsumer, Module } from "@nestjs/common";
import { AuthController } from "./auth.controller";
import { LocalStrategy } from "src/modules/auth/strategies/local.strategy";
import { DatabaseModule } from "src/infra/database/database.module";
import { UserModule } from "../user/user.module";
import { SignInDTOValidateMiddleware } from "./middleware/signInDTOValidate.middleware";
import { JwtModule } from "@nestjs/jwt";
import { JwtStrategy } from "src/modules/auth/strategies/jwt.strategy";

@Module({
    imports: [DatabaseModule, UserModule, JwtModule.register({
        secret: process.env.JWT_SECRET,
        signOptions: { expiresIn: process.env.JWT_EXPIRE }
    })],
    controllers: [AuthController],
    providers: [LocalStrategy, JwtStrategy],
})
export class AuthModule {
    configure(consumer: MiddlewareConsumer) {
        consumer.apply(SignInDTOValidateMiddleware).forRoutes('/signIn');
    }
}
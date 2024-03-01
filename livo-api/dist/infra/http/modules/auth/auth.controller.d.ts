import { AuthRequestModel } from "./models/authRequestModel";
import { JwtService } from "@nestjs/jwt";
import { AuthenticatedRequestModel } from "./models/authenticatedRequestModel";
export declare class AuthController {
    private jwtService;
    constructor(jwtService: JwtService);
    signIn(request: AuthRequestModel): Promise<{
        access_token: string;
    }>;
    test(request: AuthenticatedRequestModel): Promise<{
        id: string;
        email: string;
        nome: string;
    }>;
}

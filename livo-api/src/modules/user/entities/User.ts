export class User {
  private props: {
    id: number;
    name: string;
    email: string;
    password: string;
    photoUrl: string | null;
    gradeId: number | null;
  };

  constructor(
    id: number,
    name: string,
    email: string,
    password: string,
    photoUrl: string | null = null,
    gradeId: number | null = null,

  ) {
    this.props = {
      id,
      name,
      email,
      password,
      photoUrl,
      gradeId,
    };
  }

  get id(): number { return this.props.id; }
  set id(id: number) { this.props.id = id; }

  get name(): string { return this.props.name; }
  set name(name: string) { this.props.name = name; }

  get email(): string { return this.props.email; }
  set email(email: string) { this.props.email = email; }

  get password(): string { return this.props.password; }
  set password(password: string) { this.props.password = password; }

  get photoUrl(): string | null { return this.props.photoUrl; }
  set photoUrl(photoUrl: string) { this.props.photoUrl = photoUrl; }

  get gradeId(): number | null { return this.props.gradeId; }
  set gradeId(gradeId: number) { this.props.gradeId = gradeId; }
}

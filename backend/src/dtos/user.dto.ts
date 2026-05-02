export namespace UserDTOs {
  export interface Create {
    name: string
    email: string
    password: string
  }

  export interface Response {
    id_user: string
    email: string
    name: string
    role: string
  }

  export interface Login {
    email: string
    password: string
  }
}

import { UserDTOs } from '../dtos/user.dto'
import bcrypt from 'bcrypt'
import { UserRepositorie } from '../repositories/user.repositorie'
import { generateToken } from '../utils/generateToken'
import { Role } from '../consts/role.enum'

export const UserService = {
  create: async (data: UserDTOs.Create): Promise<UserDTOs.Response> => {
    const passwordVO = await bcrypt.hash(data.password, 10)
    const user = await UserRepositorie.create({ ...data, password: passwordVO })
    return user
  },

  findUserByEmail: async (data: UserDTOs.Login) => {
    const user = await UserRepositorie.findUserByEmail(data.email)
    if (!user) throw new Error('User not found')
    const isPasswordValid = await bcrypt.compare(data.password, user.password)
    if (!isPasswordValid) throw new Error('Credentials not valid')

    const token = generateToken({
      id_user: user.id_user,
      email: user.email,
      roles: user.role
    })
    return { message: 'Login successful', user, token }
  },

  findUserRolById: async (id_user: string, role: Role) => {
    const userRol = await UserRepositorie.findUserRolById(id_user, role)
    if (!userRol) throw new Error('User not admin')
    return userRol
  }
}

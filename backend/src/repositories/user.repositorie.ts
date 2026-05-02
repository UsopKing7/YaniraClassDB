import { prisma } from '../config/prisma'
import { Role } from '../consts/role.enum'
import { UserDTOs } from '../dtos/user.dto'

export const UserRepositorie = {
  create: async (data: UserDTOs.Create) => {
    return await prisma.user.create({ data })
  },

  findUserByEmail: async (email: string) => {
    return await prisma.user.findUnique({
      where: { email },
      select: { id_user: true, email: true, name: true, role: true, password: true }
    })
  },

  findUserRolById: async (id_user: string, role: Role) => {
    return await prisma.user.findFirst({
      where: { id_user, role }
    })
  }
}

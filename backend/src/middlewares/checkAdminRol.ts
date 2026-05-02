import { Request, Response, NextFunction } from 'express'
import { Role } from '../consts/role.enum'
import { UserService } from '../services/user.service'

export const checkAdminRol = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const id_user = req.user.id_user

    await UserService.findUserRolById(id_user, Role.ADMIN)

    return next()
  } catch (error) {
    return res.status(403).json({ message: 'User not admin' })
  }
}

import { Request, Response } from 'express'
import { UserService } from '../services/user.service'
import { cookieOptions } from '../utils/generateToken'

export const userController = {
  create: async (req: Request, res: Response): Promise<Response> => {
    const data = req.body
    const user = await UserService.create(data)
    return res.status(201).json({ user })
  },

  login: async (req: Request, res: Response) => {
    const data = req.body
    const { message, user, token } = await UserService.findUserByEmail(data)
    res.cookie('access_token', token, cookieOptions)
    return res.status(200).json({ message, user })
  },

  getAll: async (_req: Request, res: Response) => {
    const users = await UserService.getAll()
    return res.status(200).json({ users })
  }
}

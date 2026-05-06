import { Response, Request, NextFunction } from 'express'
import jwt from 'jsonwebtoken'
import { env } from '../consts/env'
import { ReqUser } from '../consts/reqUser'

export const rutaProtected = (req: Request, _res: Response, next: NextFunction) => {
  try {
    const token = req.cookies.access_token
    if (!token) throw new Error('No token')

    const payload = jwt.verify(token, env.SECRET_KEY) as ReqUser
    req.user = payload
    return next()
  } catch (error) {
    return _res.status(401).json({ message: 'Unauthorized' })
  }
}

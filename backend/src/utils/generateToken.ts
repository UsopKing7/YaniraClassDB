import jwt, { SignOptions } from 'jsonwebtoken'
import { env } from '../consts/env'
import { CookieOptions } from 'express'

interface PayloadJWT {
  id_user: string
  email: string
  roles: string
}

export const cookieOptions: CookieOptions = {
  httpOnly: true,
  secure: true,
  sameSite: 'lax',
  maxAge: 1000 * 60 * 60 * 24
}

export const generateToken = (payload: PayloadJWT): string => {
  const sing = jwt.sign as (
    payload: string | object | Buffer,
    secret: string,
    options?: SignOptions
  ) => string

  return sing(payload, env.SECRET_KEY, { expiresIn: '1d' })
}

import { domain } from "../consts/env";
import type { UserLogin, UserRegister } from "../interfaces/auth.interface"

interface User {
  id: string
  email: string
  role: string
  name?: string
}

interface LoginResponse {
  user: User
  message?: string
}

export const login = async (user: UserLogin): Promise<LoginResponse> => {
  const response = await fetch(domain + '/api/login', {
    method: 'POST',
    credentials: 'include',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(user)
  })

  const res = await response.json()
  if (!response.ok) throw new Error(res.message)

  return res
}

export const register = async (user: UserRegister) => {
  const response = await fetch(domain + '/api/create', {
    method: 'POST',
    credentials: 'include',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(user)
  })

  const data = await response.json()
  if (!response.ok) throw new Error(data.message)

  return data
}

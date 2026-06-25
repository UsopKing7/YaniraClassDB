import { domain } from '../consts/env'

export interface UserResponse {
  id_user: string
  name: string
  email: string
  role: string
  createdAt: string
}

export const getUsers = async (): Promise<UserResponse[]> => {
  const response = await fetch(domain + '/api/users', {
    credentials: 'include'
  })

  const data = await response.json()
  if (!response.ok) throw new Error(data.message)

  return data.users
}

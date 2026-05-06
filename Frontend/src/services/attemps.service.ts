import { domain } from "../consts/env"

export const createAttempt = async (id_exercise: string, data: { userSql: string }) => {
  const res = await fetch(domain + '/api/attemps/' + id_exercise, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    credentials: 'include',
    body: JSON.stringify(data)
  })

  const response = await res.json()
  if (!res.ok) throw new Error(response.message)

  return response
}

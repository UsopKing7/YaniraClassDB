import { useEffect, useState } from "react"
import { domain } from "../consts/env"

export interface Exercise {
  id_exercise: string
  title: string
  description: string
  difficulty: string
  topic: string
  expectedSql: string
  isActive: boolean
  createdAt: string
}

export interface UpdatedExercise {
  title?: string
  description?: string
  difficulty?: string
  topic?: string
  expectedSql?: string
}

export const useExercises = () => {
  const [exercises, setExercises] = useState<Exercise[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  const fetchExercises = async () => {
    try {
      setLoading(true)
      const response = await fetch(domain + '/api/exercises', {
        credentials: 'include'
      })
      if (!response.ok) {
        throw new Error('Error al cargar los ejercicios')
      }
      const data = await response.json()
      setExercises(Array.isArray(data.exercises) ? data.exercises : [])
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Error desconocido')
      setExercises([])
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    fetchExercises()
  }, [])

  return { exercises, loading, error, refetch: fetchExercises }
}

export const createExercise = async (data: any) => {
  const res = await fetch(domain + '/api/exercises/create', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    credentials: 'include',
    body: JSON.stringify(data)
  })

  const response = await res.json()
  if (!res.ok) throw new Error(response.message)

  return response.exercise
}

export const updateExercise = async (id_exercise: string, data: UpdatedExercise) => {
  const res = await fetch(domain + `/api/exercises/update/${id_exercise}`, {
    method: 'PATCH',
    headers: {
      'Content-Type': 'application/json'
    },
    credentials: 'include',
    body: JSON.stringify(data)
  })

  const response = await res.json()
  if (!res.ok) throw new Error(response.message)

  return response.exercise
}

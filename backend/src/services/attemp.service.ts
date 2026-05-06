import { AttempRepositorie } from '../repositories/attemp.repositorie'
import { AttempError } from '../consts/topic.enum'
import { evaluarSQL } from './prolog.service'
import { prisma } from '../config/prisma'

export const AttempService = {
  create: async (id_user: string, id_exercise: string, userSql: string) => {
    // 1. Buscar el ejercicio
    const exercise = await prisma.exercise.findUnique({
      where: { id_exercise }
    })

    if (!exercise) throw new Error('Ejercicio no encontrado')

    // 2. Convertir difficulty al formato de Prolog
    const nivelMap: Record<string, string> = {
      EASY: 'easy',
      MEDIUM: 'medium',
      HARD: 'hard'
    }
    const nivel = nivelMap[exercise.difficulty]

    // 3. Evaluar con Prolog
    const { isCorrect, errorType, feedback } = await evaluarSQL(userSql, nivel)

    // 4. Guardar el intento
    const attempt = await AttempRepositorie.create({
      id_user,
      id_exercise,
      userSql,
      isCorrect,
      feedback,
      errorType: errorType as AttempError
    })

    return { attempt, feedback, isCorrect }
  }
}

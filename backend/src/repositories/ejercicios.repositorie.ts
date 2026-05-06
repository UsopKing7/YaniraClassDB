import { prisma } from '../config/prisma'
import { ExerciseDTOs } from '../dtos/exercise.dto'

export const EjerciciosRepositorie = {
  getAll: async () => {
    return await prisma.exercise.findMany()
  },

  findExerciseById: async (id_exercise: string) => {
    return await prisma.exercise.findUnique({
      where: { id_exercise }
    })
  },

  createExercise: async (data: ExerciseDTOs.create) => {
    return await prisma.exercise.create({ data })
  },

  updateExercise: async (data: ExerciseDTOs.update) => {
    return await prisma.exercise.update({
      where: { id_exercise: data.id_exercise },
      data
    })
  },

  deleteExercise: async (id_exercise: string) => {
    return await prisma.exercise.update({
      where: { id_exercise },
      data: { isActive: false }
    })
  }
}

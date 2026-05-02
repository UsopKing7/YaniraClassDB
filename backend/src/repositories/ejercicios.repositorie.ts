import { prisma } from '../config/prisma'

export const EjerciciosRepositorie = {
  getAll: async () => {
    return await prisma.exercise.findMany()
  },

  findExerciseById: async (id_exercise: string) => {
    return await prisma.exercise.findUnique({
      where: { id_exercise }
    })
  }
}

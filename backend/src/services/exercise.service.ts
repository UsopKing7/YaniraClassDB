import { ExerciseDTOs } from '../dtos/exercise.dto'
import { EjerciciosRepositorie } from '../repositories/ejercicios.repositorie'

export const ExerciseService = {
  getAll: async () => {
    return await EjerciciosRepositorie.getAll()
  },

  findEjercicioById: async (id_exercise: string) => {
    return await EjerciciosRepositorie.findExerciseById(id_exercise)
  },

  create: async (data: ExerciseDTOs.create) => {
    return await EjerciciosRepositorie.createExercise(data)
  },

  update: async (data: ExerciseDTOs.update) => {
    return await EjerciciosRepositorie.updateExercise(data)
  },

  delete: async (id_exercise: string) => {
    return await EjerciciosRepositorie.deleteExercise(id_exercise)
  }
}

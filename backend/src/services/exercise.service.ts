import { EjerciciosRepositorie } from '../repositories/ejercicios.repositorie'

export const ExerciseService = {
  getAll: async () => {
    return await EjerciciosRepositorie.getAll()
  },

  findEjercicioById: async (id_exercise: string) => {
    return await EjerciciosRepositorie.findExerciseById(id_exercise)
  }
}

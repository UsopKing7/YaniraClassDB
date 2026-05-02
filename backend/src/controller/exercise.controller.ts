import { Request, Response } from 'express'
import { ExerciseService } from '../services/exercise.service'

export const ExerciseController = {
  getAll: async (_req: Request, res: Response): Promise<Response> => {
    const exercises = await ExerciseService.getAll()
    return res.status(200).json({ exercises })
  },

  findExerciseById: async (req: Request, res: Response): Promise<Response> => {
    const { id_exercise } = req.params
    const exercise = await ExerciseService.findEjercicioById(id_exercise as string)
    return res.status(200).json({ exercise })
  }
}

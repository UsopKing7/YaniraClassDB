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
  },

  create: async (req: Request, res: Response): Promise<Response> => {
    const data = req.body
    const exercise = await ExerciseService.create(data)
    return res.status(201).json({ exercise })
  },

  update: async (req: Request, res: Response): Promise<Response> => {
    const { id_exercise } = req.params
    const data = req.body
    await ExerciseService.update({ ...data, id_exercise })
    return res.status(200).json({ message: 'Exercise updated' })
  },

  delete: async (req: Request, res: Response): Promise<Response> => {
    const { id_exercise } = req.params
    await ExerciseService.delete(id_exercise as string)
    return res.status(200).json({ message: 'Exercise is marqued as in active' })
  }
}

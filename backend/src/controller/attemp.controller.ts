import { Request, Response } from 'express'
import { AttempService } from '../services/attemp.service'

export const AttempController = {
  create: async (req: Request, res: Response) => {
    const { id_exercise } = req.params
    const { userSql } = req.body
    const id_user = req.user.id_user // viene del JWT middleware

    if (!id_exercise || !userSql) {
      return res.status(400).json({ message: 'Faltan campos requeridos' })
    }

    const result = await AttempService.create(id_user, id_exercise as string, userSql)

    return res.status(201).json(result)
  }
}

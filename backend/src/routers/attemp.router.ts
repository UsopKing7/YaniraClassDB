import { Router } from 'express'
import { AttempController } from '../controller/attemp.controller'
import { rutaProtected } from '../middlewares/rutaProtected'

export const attempRouter = Router()

attempRouter.post('/attemps/:id_exercise', rutaProtected, AttempController.create)

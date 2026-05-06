import { Router } from 'express'
import { ExerciseController } from '../controller/exercise.controller'
import { rutaProtected } from '../middlewares/rutaProtected'
import { checkAdminRol } from '../middlewares/checkAdminRol'

export const exerciseRouter = Router()

exerciseRouter.get('/exercises', rutaProtected, ExerciseController.getAll)
exerciseRouter.get('/exercises/:id_exercise', rutaProtected, ExerciseController.findExerciseById)
exerciseRouter.post('/exercies/create', rutaProtected, checkAdminRol, ExerciseController.create)
exerciseRouter.patch(
  '/exercies/update/:id_exercise',
  rutaProtected,
  checkAdminRol,
  ExerciseController.update
)
exerciseRouter.patch(
  '/exercises/delete/:id_exercise',
  rutaProtected,
  checkAdminRol,
  ExerciseController.delete
)

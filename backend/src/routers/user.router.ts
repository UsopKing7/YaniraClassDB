import { Router } from 'express'
import { userController } from '../controller/user.controller'
import { rutaProtected } from '../middlewares/rutaProtected'
import { checkAdminRol } from '../middlewares/checkAdminRol'

export const userRouter = Router()

userRouter.post('/create', userController.create)
userRouter.post('/login', userController.login)
userRouter.get('/users', rutaProtected, checkAdminRol, userController.getAll)

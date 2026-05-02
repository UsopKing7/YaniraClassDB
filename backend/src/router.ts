import { exerciseRouter } from './routers/exercise.router'
import { userRouter } from './routers/user.router'
import { Router } from 'express'

export const router = Router()

router.use('/api', userRouter)
router.use('/api', exerciseRouter)

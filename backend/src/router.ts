import { attempRouter } from './routers/attemp.router'
import { exerciseRouter } from './routers/exercise.router'
import { userRouter } from './routers/user.router'
import { Router } from 'express'

export const router = Router()

router.use('/api', userRouter)
router.use('/api', exerciseRouter)
router.use('/api', attempRouter)

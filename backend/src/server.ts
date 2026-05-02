import express from 'express'
import { router } from './router'
import cookieParser from 'cookie-parser'
import cors from 'cors'
import { errorHandler } from './middlewares/request.middleware'

export const app = express()
app.use(express.json())
app.use(
  cors({
    origin: 'http://localhost:5173',
    credentials: true
  })
)
app.use(cookieParser())
app.use(express.urlencoded({ extended: true }))
app.use(router)
app.use(errorHandler)

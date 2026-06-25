import { connectDB } from './config/prisma'
import { env } from './consts/env'
import { app } from './server'
import { seedAdmin } from './seed'

;(async () => {
  await connectDB()
  await seedAdmin()

  app.listen(env.port, () => {
    console.table({
      URL: 'http://localhost:' + env.port
    })
  })
})()

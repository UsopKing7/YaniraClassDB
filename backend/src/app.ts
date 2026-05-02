import { connectDB } from './config/prisma'
import { env } from './consts/env'
import { app } from './server'

connectDB()

app.listen(env.port, () => {
  console.table({
    URL: 'http://localhost:' + env.port
  })
})

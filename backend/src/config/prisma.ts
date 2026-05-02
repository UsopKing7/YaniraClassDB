import { PrismaClient } from '@prisma/client'

export const prisma = new PrismaClient()

export const connectDB = async () => {
  try {
    await prisma.$connect()
    console.log('[OK][PRISMA] Conectado a la base de datos')
  } catch (error) {
    console.error('[ERROR][PRISMA] No se pudo conectar a la base de datos', error)
  }
}

process.on('SIGINT', async () => {
  try {
    await prisma.$disconnect()
    console.log('[OK][PRISMA] Desconectado de la base de datos')
    process.exit(0)
  } catch (error) {
    console.error('[ERROR][PRISMA] No se pudo desconectar de la base de datos', error)
    process.exit(1)
  }
})

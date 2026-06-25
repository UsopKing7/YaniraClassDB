import { prisma } from './config/prisma'
import bcrypt from 'bcrypt'

export const seedAdmin = async () => {
  const adminExists = await prisma.user.findFirst({
    where: { role: 'ADMIN' }
  })

  if (adminExists) {
    console.log('[SEED] Admin already exists, skipping...')
    return
  }

  const password = await bcrypt.hash('admin123', 10)

  await prisma.user.create({
    data: {
      name: 'Admin',
      email: 'admin@mail.com',
      password,
      role: 'ADMIN'
    }
  })

  console.log('[SEED] Admin created: admin@mail.com / admin123')
}

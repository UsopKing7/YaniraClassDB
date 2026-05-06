import { prisma } from '../config/prisma'
import { CreateAttemp } from '../dtos/attemp.dto'

export const AttempRepositorie = {
  create: async (data: CreateAttemp) => {
    return prisma.attempt.create({
      data
    })
  }
}

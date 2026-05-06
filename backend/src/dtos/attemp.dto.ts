import { AttempError } from '../consts/topic.enum'

export interface CreateAttemp {
  id_user: string
  id_exercise: string
  userSql: string
  isCorrect: boolean
  feedback: string
  errorType: AttempError
}

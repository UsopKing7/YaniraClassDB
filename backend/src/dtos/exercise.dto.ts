import { Difficulty } from '../consts/difficulty.enum'
import { Topic } from '../consts/topic.enum'

export namespace ExerciseDTOs {
  export interface create {
    title: string
    description: string
    difficulty: Difficulty
    topic: Topic
    expectedSql: string
    id_exercise: string
  }

  export interface update {
    title?: string
    description?: string
    difficulty?: Difficulty
    topic?: Topic
    expectedSql?: string
    id_exercise: string
  }
}

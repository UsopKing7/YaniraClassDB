import { spawn } from 'child_process'
import path from 'path'

const PROLOG_FILE = path.resolve(__dirname, 'base_conocimiento.pl')

interface PrologResult {
  isCorrect: boolean
  errorType: string | null
  feedback: string
}

export const evaluarSQL = (sql: string, nivel: string): Promise<PrologResult> => {
  return new Promise((resolve, reject) => {
    const query = `evaluar("${sql}", ${nivel}, R, E, F), write(R), write('|'), write(E), write('|'), write(F), nl, halt.`

    const prolog = spawn('swipl', ['-g', query, '-t', 'halt', PROLOG_FILE])

    let output = ''
    let error = ''

    prolog.stdout.on('data', data => {
      output += data.toString()
    })

    prolog.stderr.on('data', data => {
      error += data.toString()
    })

    prolog.on('close', code => {
      if (code !== 0 && !output) {
        return reject(new Error(`Prolog error: ${error}`))
      }

      // output => "correcto|none|Tu consulta es correcta!"
      const parts = output.trim().split('|')

      if (parts.length < 3) {
        return reject(new Error('Respuesta inesperada de Prolog'))
      }

      resolve({
        isCorrect: parts[0] === 'correcto',
        errorType: parts[1] === 'none' ? null : parts[1].toUpperCase(),
        feedback: parts[2]
      })
    })
  })
}

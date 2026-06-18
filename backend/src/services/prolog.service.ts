import { spawn } from 'child_process'
import path from 'path'

const PROLOG_FILE = path.resolve(__dirname, 'base_conocimiento.pl')

interface PrologResult {
  isCorrect: boolean
  errorType: string | null
  feedback: string
}

function escapePrologString(str: string): string {
  return str
    .replace(/\\/g, '\\\\')
    .replace(/"/g, '\\"')
    .replace(/\n/g, '\\n')
    .replace(/\r/g, '\\r')
    .replace(/\t/g, '\\t')
}

export const evaluarSQL = (sql: string, nivel: string, expectedSql: string): Promise<PrologResult> => {
  return new Promise((resolve, reject) => {
    const escapedSql = escapePrologString(sql)
    const escapedExpected = escapePrologString(expectedSql)
    const query = `evaluar("${escapedSql}", ${nivel}, "${escapedExpected}", R, E, F), write(R), write('|'), write(E), write('|'), write(F), nl, halt.`

    const prolog = spawn('swipl', ['-g', query, '-t', 'halt', PROLOG_FILE])

    const chunks: Buffer[] = []
    let error = ''

    prolog.stdout.on('data', (data: Buffer) => {
      chunks.push(data)
    })

    prolog.stderr.on('data', data => {
      error += data.toString()
    })

    prolog.on('close', code => {
      const output = Buffer.concat(chunks).toString('utf8')

      if (code !== 0 && !output) {
        return reject(new Error(`Prolog error: ${error}`))
      }

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

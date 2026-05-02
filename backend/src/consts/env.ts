const { PORT, SECRET_KEY } = process.env

export const env = {
  port: Number(PORT) || 3000,
  SECRET_KEY: String(SECRET_KEY)
}

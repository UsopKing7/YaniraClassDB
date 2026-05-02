import { Request, Response, NextFunction } from 'express'

export const errorHandler = (error: Error, req: Request, res: Response, _next: NextFunction) => {
  let statusCode = 400

  if ((error as any).statusCode && typeof (error as any).statusCode === 'number')
    statusCode = (error as any).statusCode
  else if (res.statusCode && res.statusCode !== 200) statusCode = res.statusCode

  const message = error.message
  const stack = error.stack

  res.status(statusCode).json({
    success: false,
    status: statusCode,
    message,
    stack,
    timestamp: new Date().toISOString(),
    path: req.path,
    method: req.method
  })
  console.log({
    success: false,
    status: statusCode,
    message,
    stack,
    timestamp: new Date().toISOString(),
    path: req.path,
    method: req.method
  })
}

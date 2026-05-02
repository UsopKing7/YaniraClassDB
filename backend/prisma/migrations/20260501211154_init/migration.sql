-- CreateEnum
CREATE TYPE "Role" AS ENUM ('ADMIN', 'STUDENT');

-- CreateEnum
CREATE TYPE "Difficulty" AS ENUM ('EASY', 'MEDIUM', 'HARD');

-- CreateEnum
CREATE TYPE "ErrorType" AS ENUM ('SYNTAX', 'SEMANTIC', 'LOGIC');

-- CreateEnum
CREATE TYPE "Topic" AS ENUM ('SELECT', 'INSERT', 'UPDATE', 'DELETE', 'JOIN', 'GROUP_BY', 'HAVING', 'SUBQUERY', 'DDL', 'DCL', 'TCL', 'AGGREGATE');

-- CreateTable
CREATE TABLE "User" (
    "id_user" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "role" "Role" NOT NULL DEFAULT 'STUDENT',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id_user")
);

-- CreateTable
CREATE TABLE "Exercise" (
    "id_exercise" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "difficulty" "Difficulty" NOT NULL,
    "topic" "Topic" NOT NULL,
    "expectedSql" TEXT NOT NULL,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Exercise_pkey" PRIMARY KEY ("id_exercise")
);

-- CreateTable
CREATE TABLE "Attempt" (
    "id_attempt" TEXT NOT NULL,
    "id_user" TEXT NOT NULL,
    "id_exercise" TEXT NOT NULL,
    "userSql" TEXT NOT NULL,
    "isCorrect" BOOLEAN NOT NULL,
    "feedback" TEXT NOT NULL,
    "errorType" "ErrorType",
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Attempt_pkey" PRIMARY KEY ("id_attempt")
);

-- CreateTable
CREATE TABLE "Progress" (
    "id_progress" TEXT NOT NULL,
    "id_user" TEXT NOT NULL,
    "topic" TEXT NOT NULL,
    "score" INTEGER NOT NULL DEFAULT 0,
    "total" INTEGER NOT NULL DEFAULT 0,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Progress_pkey" PRIMARY KEY ("id_progress")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Progress_id_user_topic_key" ON "Progress"("id_user", "topic");

-- AddForeignKey
ALTER TABLE "Attempt" ADD CONSTRAINT "Attempt_id_user_fkey" FOREIGN KEY ("id_user") REFERENCES "User"("id_user") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Attempt" ADD CONSTRAINT "Attempt_id_exercise_fkey" FOREIGN KEY ("id_exercise") REFERENCES "Exercise"("id_exercise") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Progress" ADD CONSTRAINT "Progress_id_user_fkey" FOREIGN KEY ("id_user") REFERENCES "User"("id_user") ON DELETE RESTRICT ON UPDATE CASCADE;

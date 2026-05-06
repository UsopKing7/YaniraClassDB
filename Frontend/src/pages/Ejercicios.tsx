import { useState } from "react"
import { useExercises } from "../services/exercises.service"
import { createExercise, updateExercise } from "../services/exercises.service"
import { createAttempt } from "../services/attemps.service"

interface User {
  role?: string
}

interface EjerciciosProps {
  user?: User
}

interface Exercise {
  id_exercise: string
  title: string
  description: string
  difficulty: string
  topic: string
  expectedSql: string
  isActive: boolean
  createdAt: string
}

interface AttemptResponse {
  isCorrect: boolean
  feedback: string
  attempt?: {
    id_attempt: string
    userSql: string
  }
}

// Lista de temas disponibles
const TOPICS = [
  { value: "SELECT", label: "SELECT" },
  { value: "INSERT", label: "INSERT" },
  { value: "UPDATE", label: "UPDATE" },
  { value: "DELETE", label: "DELETE" },
  { value: "JOIN", label: "JOIN" },
  { value: "GROUP_BY", label: "GROUP BY" },
  { value: "HAVING", label: "HAVING" },
  { value: "SUBQUERY", label: "SUBQUERY" },
  { value: "DDL", label: "DDL" },
  { value: "DCL", label: "DCL" },
  { value: "TCL", label: "TCL" },
  { value: "AGGREGATE", label: "AGGREGATE" },
]

export const Ejercicios = ({ user }: EjerciciosProps) => {
  const { exercises, loading, error, refetch } = useExercises()
  const [isCreateModalOpen, setIsCreateModalOpen] = useState(false)
  const [isEditModalOpen, setIsEditModalOpen] = useState(false)
  const [isPracticeModalOpen, setIsPracticeModalOpen] = useState(false)
  const [selectedExercise, setSelectedExercise] = useState<Exercise | null>(null)
  const [isSubmitting, setIsSubmitting] = useState(false)
  const [formError, setFormError] = useState<string | null>(null)

  // Estado para el modal de practicar
  const [userSql, setUserSql] = useState("")
  const [attemptResult, setAttemptResult] = useState<AttemptResponse | null>(null)
  const [isChecking, setIsChecking] = useState(false)

  const isAdmin = user?.role === "ADMIN"

  // Handle crear ejercicio
  const handleCreateSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault()
    setIsSubmitting(true)
    setFormError(null)

    const formData = new FormData(e.currentTarget)
    const data = {
      title: formData.get("title"),
      description: formData.get("description"),
      difficulty: formData.get("difficulty"),
      topic: formData.get("topic"),
      expectedSql: formData.get("expectedSql"),
    }

    try {
      await createExercise(data)
      setIsCreateModalOpen(false)
      refetch()
    } catch (err) {
      setFormError(err instanceof Error ? err.message : "Error al crear el ejercicio")
    } finally {
      setIsSubmitting(false)
    }
  }

  // Handle editar ejercicio
  const handleEditSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault()
    setIsSubmitting(true)
    setFormError(null)

    const formData = new FormData(e.currentTarget)
    const data = {
      title: formData.get("title"),
      description: formData.get("description"),
      difficulty: formData.get("difficulty"),
      topic: formData.get("topic"),
      expectedSql: formData.get("expectedSql"),
    }

    try {
      if (selectedExercise) {
        await updateExercise(selectedExercise.id_exercise, data)
        setIsEditModalOpen(false)
        setSelectedExercise(null)
        refetch()
      }
    } catch (err) {
      setFormError(err instanceof Error ? err.message : "Error al actualizar el ejercicio")
    } finally {
      setIsSubmitting(false)
    }
  }

  // Handle practicar ejercicio
  const handlePracticeSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault()
    setIsChecking(true)
    setAttemptResult(null)

    try {
      if (selectedExercise) {
        const result = await createAttempt(selectedExercise.id_exercise, { userSql })
        setAttemptResult(result)
      }
    } catch (err) {
      setAttemptResult({
        isCorrect: false,
        feedback: err instanceof Error ? err.message : "Error al verificar tu consulta"
      })
    } finally {
      setIsChecking(false)
    }
  }

  const openPracticeModal = (exercise: Exercise) => {
    setSelectedExercise(exercise)
    setUserSql("")
    setAttemptResult(null)
    setIsPracticeModalOpen(true)
  }

  const openEditModal = (exercise: Exercise) => {
    setSelectedExercise(exercise)
    setIsEditModalOpen(true)
  }

  // Función para formatear el topic para mostrar
  const formatTopic = (topic: string) => {
    const found = TOPICS.find(t => t.value === topic)
    return found ? found.label : topic
  }

  if (loading) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="text-gray-500">Cargando ejercicios...</div>
      </div>
    )
  }

  if (error) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="text-red-500">Error: {error}</div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-gray-50 p-8">
      <div className="max-w-7xl mx-auto">
        {/* Header con botones para ADMIN */}
        <div className="flex justify-between items-center mb-6">
          <h1 className="text-2xl font-semibold text-gray-900">Ejercicios</h1>
          <div className="flex gap-3">
            {isAdmin && (
              <button
                onClick={() => setIsCreateModalOpen(true)}
                className="px-4 py-2 bg-gray-900 hover:bg-gray-800 text-white text-sm font-medium rounded-md transition-colors"
              >
                + Nuevo Ejercicio
              </button>
            )}
            <button
              onClick={() => {
                localStorage.removeItem("user")
                window.location.href = "/"
              }}
              className="px-4 py-2 border border-gray-300 text-gray-700 text-sm font-medium rounded-md hover:bg-gray-50 transition-colors"
            >
              Cerrar Sesión
            </button>
          </div>
        </div>

        {/* Lista de ejercicios */}
        <div className="grid gap-4">
          {exercises.length === 0 ? (
            <div className="bg-white rounded-lg border border-gray-200 p-8 text-center text-gray-500">
              No hay ejercicios disponibles
            </div>
          ) : (
            exercises.map((exercise) => (
              <div
                key={exercise.id_exercise}
                className="bg-white rounded-lg border border-gray-200 p-6 hover:shadow-md transition-shadow"
              >
                <div className="flex items-start justify-between">
                  <div className="flex-1">
                    <h2 className="text-lg font-medium text-gray-900 mb-2">
                      {exercise.title}
                    </h2>
                    <p className="text-gray-600 text-sm mb-3">
                      {exercise.description}
                    </p>
                    <div className="flex gap-3 text-sm">
                      <span
                        className={`
                          px-2 py-1 rounded-full text-xs font-medium
                          ${exercise.difficulty === "EASY"
                            ? "bg-green-100 text-green-700"
                            : ""
                          }
                          ${exercise.difficulty === "MEDIUM"
                            ? "bg-yellow-100 text-yellow-700"
                            : ""
                          }
                          ${exercise.difficulty === "HARD"
                            ? "bg-red-100 text-red-700"
                            : ""
                          }
                        `}
                      >
                        {exercise.difficulty}
                      </span>
                      <span className="px-2 py-1 bg-gray-100 text-gray-600 rounded-full text-xs font-medium">
                        {formatTopic(exercise.topic)}
                      </span>
                    </div>
                  </div>
                  <div className="flex gap-2">
                    {isAdmin && (
                      <button
                        onClick={() => openEditModal(exercise)}
                        className="px-4 py-2 bg-gray-500 hover:bg-gray-600 text-white text-sm font-medium rounded-md transition-colors"
                      >
                        Editar
                      </button>
                    )}
                    <button
                      onClick={() => openPracticeModal(exercise)}
                      className="px-4 py-2 bg-gray-900 hover:bg-gray-800 text-white text-sm font-medium rounded-md transition-colors"
                    >
                      Practicar
                    </button>
                  </div>
                </div>
              </div>
            ))
          )}
        </div>
      </div>

      {/* Modal para crear ejercicio */}
      {isCreateModalOpen && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
          <div className="bg-white rounded-lg shadow-xl w-full max-w-md mx-4">
            <div className="flex justify-between items-center p-6 border-b border-gray-200">
              <h2 className="text-xl font-semibold text-gray-900">
                Nuevo Ejercicio
              </h2>
              <button
                onClick={() => setIsCreateModalOpen(false)}
                className="text-gray-400 hover:text-gray-600 transition-colors"
              >
                ✕
              </button>
            </div>

            <form onSubmit={handleCreateSubmit} className="p-6 space-y-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">
                  Título *
                </label>
                <input
                  type="text"
                  name="title"
                  required
                  className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-1 focus:ring-gray-400 focus:border-gray-400"
                />
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">
                  Descripción *
                </label>
                <textarea
                  name="description"
                  rows={3}
                  required
                  className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-1 focus:ring-gray-400 focus:border-gray-400"
                />
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">
                  Dificultad *
                </label>
                <select
                  name="difficulty"
                  required
                  className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-1 focus:ring-gray-400 focus:border-gray-400"
                >
                  <option value="EASY">Fácil</option>
                  <option value="MEDIUM">Medio</option>
                  <option value="HARD">Difícil</option>
                </select>
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">
                  Tema *
                </label>
                <select
                  name="topic"
                  required
                  className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-1 focus:ring-gray-400 focus:border-gray-400"
                >
                  <option value="">Seleccione un tema</option>
                  {TOPICS.map((topic) => (
                    <option key={topic.value} value={topic.value}>
                      {topic.label}
                    </option>
                  ))}
                </select>
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">
                  SQL Esperado *
                </label>
                <input
                  type="text"
                  name="expectedSql"
                  required
                  placeholder="Ej: SELECT * FROM users"
                  className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-1 focus:ring-gray-400 focus:border-gray-400 font-mono text-sm"
                />
              </div>

              {formError && (
                <div className="text-red-500 text-sm">{formError}</div>
              )}

              <div className="flex gap-3 pt-4">
                <button
                  type="button"
                  onClick={() => setIsCreateModalOpen(false)}
                  className="flex-1 px-4 py-2 border border-gray-300 text-gray-700 text-sm font-medium rounded-md hover:bg-gray-50 transition-colors"
                >
                  Cancelar
                </button>
                <button
                  type="submit"
                  disabled={isSubmitting}
                  className="flex-1 px-4 py-2 bg-gray-900 hover:bg-gray-800 text-white text-sm font-medium rounded-md transition-colors disabled:opacity-50 disabled:cursor-not-allowed"
                >
                  {isSubmitting ? "Creando..." : "Crear Ejercicio"}
                </button>
              </div>
            </form>
          </div>
        </div>
      )}

      {/* Modal para editar ejercicio */}
      {isEditModalOpen && selectedExercise && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
          <div className="bg-white rounded-lg shadow-xl w-full max-w-md mx-4">
            <div className="flex justify-between items-center p-6 border-b border-gray-200">
              <h2 className="text-xl font-semibold text-gray-900">
                Editar Ejercicio
              </h2>
              <button
                onClick={() => {
                  setIsEditModalOpen(false)
                  setSelectedExercise(null)
                }}
                className="text-gray-400 hover:text-gray-600 transition-colors"
              >
                ✕
              </button>
            </div>

            <form onSubmit={handleEditSubmit} className="p-6 space-y-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">
                  Título *
                </label>
                <input
                  type="text"
                  name="title"
                  defaultValue={selectedExercise.title}
                  required
                  className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-1 focus:ring-gray-400 focus:border-gray-400"
                />
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">
                  Descripción *
                </label>
                <textarea
                  name="description"
                  rows={3}
                  defaultValue={selectedExercise.description}
                  required
                  className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-1 focus:ring-gray-400 focus:border-gray-400"
                />
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">
                  Dificultad *
                </label>
                <select
                  name="difficulty"
                  defaultValue={selectedExercise.difficulty}
                  required
                  className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-1 focus:ring-gray-400 focus:border-gray-400"
                >
                  <option value="EASY">Fácil</option>
                  <option value="MEDIUM">Medio</option>
                  <option value="HARD">Difícil</option>
                </select>
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">
                  Tema *
                </label>
                <select
                  name="topic"
                  defaultValue={selectedExercise.topic}
                  required
                  className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-1 focus:ring-gray-400 focus:border-gray-400"
                >
                  <option value="">Seleccione un tema</option>
                  {TOPICS.map((topic) => (
                    <option key={topic.value} value={topic.value}>
                      {topic.label}
                    </option>
                  ))}
                </select>
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">
                  SQL Esperado *
                </label>
                <input
                  type="text"
                  name="expectedSql"
                  defaultValue={selectedExercise.expectedSql}
                  required
                  placeholder="Ej: SELECT * FROM users"
                  className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-1 focus:ring-gray-400 focus:border-gray-400 font-mono text-sm"
                />
              </div>

              {formError && (
                <div className="text-red-500 text-sm">{formError}</div>
              )}

              <div className="flex gap-3 pt-4">
                <button
                  type="button"
                  onClick={() => {
                    setIsEditModalOpen(false)
                    setSelectedExercise(null)
                  }}
                  className="flex-1 px-4 py-2 border border-gray-300 text-gray-700 text-sm font-medium rounded-md hover:bg-gray-50 transition-colors"
                >
                  Cancelar
                </button>
                <button
                  type="submit"
                  disabled={isSubmitting}
                  className="flex-1 px-4 py-2 bg-gray-900 hover:bg-gray-800 text-white text-sm font-medium rounded-md transition-colors disabled:opacity-50 disabled:cursor-not-allowed"
                >
                  {isSubmitting ? "Actualizando..." : "Actualizar Ejercicio"}
                </button>
              </div>
            </form>
          </div>
        </div>
      )}

      {/* Modal para practicar ejercicio */}
      {isPracticeModalOpen && selectedExercise && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
          <div className="bg-white rounded-lg shadow-xl w-full max-w-2xl mx-4">
            <div className="flex justify-between items-center p-6 border-b border-gray-200">
              <h2 className="text-xl font-semibold text-gray-900">
                Practicar: {selectedExercise.title}
              </h2>
              <button
                onClick={() => {
                  setIsPracticeModalOpen(false)
                  setSelectedExercise(null)
                  setAttemptResult(null)
                  setUserSql("")
                }}
                className="text-gray-400 hover:text-gray-600 transition-colors"
              >
                ✕
              </button>
            </div>

            <form onSubmit={handlePracticeSubmit} className="p-6 space-y-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Descripción del ejercicio
                </label>
                <div className="bg-gray-50 p-3 rounded-md border border-gray-200">
                  <p className="text-gray-700">{selectedExercise.description}</p>
                </div>
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Tu consulta SQL *
                </label>
                <textarea
                  value={userSql}
                  onChange={(e) => setUserSql(e.target.value)}
                  rows={6}
                  required
                  placeholder="Ej: SELECT * FROM usuarios WHERE id = 1"
                  className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-1 focus:ring-gray-400 focus:border-gray-400 font-mono text-sm"
                />
              </div>

              {attemptResult && (
                <div className={`p-4 rounded-md ${attemptResult.isCorrect ? "bg-green-50 border border-green-200" : "bg-red-50 border border-red-200"}`}>
                  <div className="flex items-center gap-2 mb-2">
                    <span className={`text-sm font-semibold ${attemptResult.isCorrect ? "text-green-700" : "text-red-700"}`}>
                      {attemptResult.isCorrect ? "✅ Correcto" : "❌ Incorrecto"}
                    </span>
                  </div>
                  <p className={`text-sm ${attemptResult.isCorrect ? "text-green-600" : "text-red-600"}`}>
                    {attemptResult.feedback}
                  </p>
                </div>
              )}

              <div className="flex gap-3 pt-4">
                <button
                  type="button"
                  onClick={() => {
                    setIsPracticeModalOpen(false)
                    setSelectedExercise(null)
                    setAttemptResult(null)
                    setUserSql("")
                  }}
                  className="flex-1 px-4 py-2 border border-gray-300 text-gray-700 text-sm font-medium rounded-md hover:bg-gray-50 transition-colors"
                >
                  Cancelar
                </button>
                <button
                  type="submit"
                  disabled={isChecking}
                  className="flex-1 px-4 py-2 bg-gray-900 hover:bg-gray-800 text-white text-sm font-medium rounded-md transition-colors disabled:opacity-50 disabled:cursor-not-allowed"
                >
                  {isChecking ? "Verificando..." : "Verificar SQL"}
                </button>
              </div>
            </form>
          </div>
        </div>
      )}
    </div>
  )
}

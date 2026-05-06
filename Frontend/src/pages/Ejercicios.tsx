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

// Opciones de dificultad para filtrar
const DIFFICULTY_FILTERS = [
  { value: "ALL", label: "Todas", color: "bg-gray-100 text-gray-700" },
  { value: "EASY", label: "Fáciles", color: "bg-green-100 text-green-700" },
  { value: "MEDIUM", label: "Medios", color: "bg-yellow-100 text-yellow-700" },
  { value: "HARD", label: "Difíciles", color: "bg-red-100 text-red-700" },
]

export const Ejercicios = ({ user }: EjerciciosProps) => {
  const { exercises, loading, error, refetch } = useExercises()
  const [isCreateModalOpen, setIsCreateModalOpen] = useState(false)
  const [isEditModalOpen, setIsEditModalOpen] = useState(false)
  const [isPracticeModalOpen, setIsPracticeModalOpen] = useState(false)
  const [selectedExercise, setSelectedExercise] = useState<Exercise | null>(null)
  const [isSubmitting, setIsSubmitting] = useState(false)
  const [formError, setFormError] = useState<string | null>(null)
  const [difficultyFilter, setDifficultyFilter] = useState<string>("ALL")
  const [searchTerm, setSearchTerm] = useState("")

  // Estado para el modal de practicar
  const [userSql, setUserSql] = useState("")
  const [attemptResult, setAttemptResult] = useState<AttemptResponse | null>(null)
  const [isChecking, setIsChecking] = useState(false)

  const isAdmin = user?.role === "ADMIN"

  // Filtrar ejercicios por dificultad y búsqueda
  const filteredExercises = exercises.filter((exercise) => {
    const matchesDifficulty = difficultyFilter === "ALL" || exercise.difficulty === difficultyFilter
    const matchesSearch = exercise.title.toLowerCase().includes(searchTerm.toLowerCase()) ||
      exercise.description.toLowerCase().includes(searchTerm.toLowerCase()) ||
      exercise.topic.toLowerCase().includes(searchTerm.toLowerCase())
    return matchesDifficulty && matchesSearch
  })

  // Contadores por dificultad
  const counts = {
    total: exercises.length,
    easy: exercises.filter(e => e.difficulty === "EASY").length,
    medium: exercises.filter(e => e.difficulty === "MEDIUM").length,
    hard: exercises.filter(e => e.difficulty === "HARD").length,
  }

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

  // Función para obtener el color de dificultad
  const getDifficultyColor = (difficulty: string) => {
    switch (difficulty) {
      case "EASY": return "bg-green-100 text-green-700 border-green-200"
      case "MEDIUM": return "bg-yellow-100 text-yellow-700 border-yellow-200"
      case "HARD": return "bg-red-100 text-red-700 border-red-200"
      default: return "bg-gray-100 text-gray-700 border-gray-200"
    }
  }

  if (loading) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-gray-50 to-gray-100 flex items-center justify-center">
        <div className="flex flex-col items-center gap-3">
          <div className="w-10 h-10 border-4 border-gray-300 border-t-gray-900 rounded-full animate-spin"></div>
          <div className="text-gray-500 font-medium">Cargando ejercicios...</div>
        </div>
      </div>
    )
  }

  if (error) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-gray-50 to-gray-100 flex items-center justify-center">
        <div className="bg-white rounded-xl shadow-md p-8 border border-red-200">
          <div className="text-red-500 text-center">
            <svg className="w-12 h-12 mx-auto mb-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
            <p className="font-medium">Error: {error}</p>
          </div>
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-gradient-to-br from-gray-50 to-gray-100">
      {/* Header principal */}
      <div className="bg-white border-b border-gray-200 sticky top-0 z-10 shadow-sm">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-4">
          <div className="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4">
            <div>
              <h1 className="text-2xl font-bold text-gray-900">Ejercicios SQL</h1>
              <p className="text-sm text-gray-500 mt-0.5">Practica y mejora tus habilidades</p>
            </div>
            <div className="flex gap-3">
              {isAdmin && (
                <button
                  onClick={() => setIsCreateModalOpen(true)}
                  className="inline-flex items-center gap-2 px-4 py-2 bg-gray-900 hover:bg-gray-800 text-white text-sm font-medium rounded-xl transition-all duration-200 shadow-sm hover:shadow-md"
                >
                  <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 4v16m8-8H4" />
                  </svg>
                  Nuevo Ejercicio
                </button>
              )}
              <button
                onClick={() => {
                  localStorage.removeItem("user")
                  window.location.href = "/"
                }}
                className="inline-flex items-center gap-2 px-4 py-2 border border-gray-300 text-gray-700 text-sm font-medium rounded-xl hover:bg-gray-50 transition-all duration-200"
              >
                <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1" />
                </svg>
                Cerrar Sesión
              </button>
            </div>
          </div>
        </div>
      </div>

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        {/* Stats cards */}
        <div className="grid grid-cols-2 sm:grid-cols-4 gap-4 mb-8">
          <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-4 hover:shadow-md transition-shadow">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-xs font-medium text-gray-500 uppercase tracking-wide">Total</p>
                <p className="text-2xl font-bold text-gray-900 mt-1">{counts.total}</p>
              </div>
              <div className="w-10 h-10 bg-gray-100 rounded-full flex items-center justify-center">
                <svg className="w-5 h-5 text-gray-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2" />
                </svg>
              </div>
            </div>
          </div>
          <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-4 hover:shadow-md transition-shadow">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-xs font-medium text-gray-500 uppercase tracking-wide">Fáciles</p>
                <p className="text-2xl font-bold text-green-600 mt-1">{counts.easy}</p>
              </div>
              <div className="w-10 h-10 bg-green-100 rounded-full flex items-center justify-center">
                <svg className="w-5 h-5 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 13l4 4L19 7" />
                </svg>
              </div>
            </div>
          </div>
          <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-4 hover:shadow-md transition-shadow">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-xs font-medium text-gray-500 uppercase tracking-wide">Medios</p>
                <p className="text-2xl font-bold text-yellow-600 mt-1">{counts.medium}</p>
              </div>
              <div className="w-10 h-10 bg-yellow-100 rounded-full flex items-center justify-center">
                <svg className="w-5 h-5 text-yellow-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
                </svg>
              </div>
            </div>
          </div>
          <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-4 hover:shadow-md transition-shadow">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-xs font-medium text-gray-500 uppercase tracking-wide">Difíciles</p>
                <p className="text-2xl font-bold text-red-600 mt-1">{counts.hard}</p>
              </div>
              <div className="w-10 h-10 bg-red-100 rounded-full flex items-center justify-center">
                <svg className="w-5 h-5 text-red-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                </svg>
              </div>
            </div>
          </div>
        </div>

        {/* Filtros y búsqueda */}
        <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-4 mb-6">
          <div className="flex flex-col sm:flex-row gap-4">
            <div className="flex-1">
              <div className="relative">
                <svg className="absolute left-3 top-1/2 transform -translate-y-1/2 w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                </svg>
                <input
                  type="text"
                  placeholder="Buscar por título, descripción o tema..."
                  value={searchTerm}
                  onChange={(e) => setSearchTerm(e.target.value)}
                  className="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-gray-400 focus:border-transparent outline-none transition-all"
                />
              </div>
            </div>
            <div className="flex gap-2">
              {DIFFICULTY_FILTERS.map((filter) => (
                <button
                  key={filter.value}
                  onClick={() => setDifficultyFilter(filter.value)}
                  className={`px-4 py-2 rounded-lg text-sm font-medium transition-all duration-200 ${difficultyFilter === filter.value
                    ? filter.color + " ring-2 ring-offset-1 ring-gray-400"
                    : "bg-gray-100 text-gray-600 hover:bg-gray-200"
                    }`}
                >
                  {filter.label}
                </button>
              ))}
            </div>
          </div>
        </div>

        {/* Lista de ejercicios */}
        <div className="space-y-4">
          {filteredExercises.length === 0 ? (
            <div className="bg-white rounded-xl border border-gray-200 p-12 text-center">
              <svg className="w-16 h-16 mx-auto text-gray-300 mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.5} d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
              </svg>
              <p className="text-gray-500 font-medium">No hay ejercicios que coincidan con los filtros</p>
              <p className="text-sm text-gray-400 mt-1">Intenta con otros criterios de búsqueda</p>
              {(difficultyFilter !== "ALL" || searchTerm) && (
                <button
                  onClick={() => { setDifficultyFilter("ALL"); setSearchTerm("") }}
                  className="mt-4 text-sm text-gray-600 hover:text-gray-900 underline"
                >
                  Limpiar filtros
                </button>
              )}
            </div>
          ) : (
            filteredExercises.map((exercise) => (
              <div
                key={exercise.id_exercise}
                className="bg-white rounded-xl border border-gray-200 p-6 hover:shadow-lg transition-all duration-300 hover:border-gray-300"
              >
                <div className="flex flex-col sm:flex-row sm:items-start justify-between gap-4">
                  <div className="flex-1">
                    <div className="flex flex-wrap items-center gap-2 mb-3">
                      <span className={`px-2.5 py-1 rounded-lg text-xs font-medium border ${getDifficultyColor(exercise.difficulty)}`}>
                        {exercise.difficulty === "EASY" && "🎯 Fácil"}
                        {exercise.difficulty === "MEDIUM" && "⚡ Medio"}
                        {exercise.difficulty === "HARD" && "🔥 Difícil"}
                      </span>
                      <span className="px-2.5 py-1 bg-gray-100 text-gray-600 rounded-lg text-xs font-medium border border-gray-200">
                        📚 {formatTopic(exercise.topic)}
                      </span>
                    </div>
                    <h2 className="text-lg font-semibold text-gray-900 mb-2">
                      {exercise.title}
                    </h2>
                    <p className="text-gray-600 text-sm mb-3 line-clamp-2">
                      {exercise.description}
                    </p>
                  </div>
                  <div className="flex gap-2 shrink-0">
                    {isAdmin && (
                      <button
                        onClick={() => openEditModal(exercise)}
                        className="px-4 py-2 bg-gray-100 hover:bg-gray-200 text-gray-700 text-sm font-medium rounded-lg transition-colors"
                      >
                        ✏️ Editar
                      </button>
                    )}
                    <button
                      onClick={() => openPracticeModal(exercise)}
                      className="px-4 py-2 bg-gray-900 hover:bg-gray-800 text-white text-sm font-medium rounded-lg transition-colors shadow-sm hover:shadow-md"
                    >
                      🚀 Practicar
                    </button>
                  </div>
                </div>
              </div>
            ))
          )}
        </div>

        {/* Resultados por página */}
        {filteredExercises.length > 0 && (
          <div className="mt-6 text-center text-sm text-gray-500">
            Mostrando {filteredExercises.length} de {exercises.length} ejercicios
          </div>
        )}
      </div>

      {/* Modal para crear ejercicio - mismo contenido pero con mejor estilo */}
      {isCreateModalOpen && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 p-4">
          <div className="bg-white rounded-xl shadow-xl w-full max-w-md max-h-[90vh] overflow-y-auto">
            <div className="sticky top-0 bg-white flex justify-between items-center p-6 border-b border-gray-200">
              <h2 className="text-xl font-semibold text-gray-900">
                ✨ Nuevo Ejercicio
              </h2>
              <button
                onClick={() => setIsCreateModalOpen(false)}
                className="text-gray-400 hover:text-gray-600 transition-colors text-xl"
              >
                ✕
              </button>
            </div>

            <form onSubmit={handleCreateSubmit} className="p-6 space-y-4">
              {/* ... contenido del formulario (igual que antes) ... */}
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">
                  Título *
                </label>
                <input
                  type="text"
                  name="title"
                  required
                  className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-gray-400 focus:border-transparent outline-none transition-all"
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
                  className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-gray-400 focus:border-transparent outline-none transition-all"
                />
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">
                  Dificultad *
                </label>
                <select
                  name="difficulty"
                  required
                  className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-gray-400 focus:border-transparent outline-none transition-all"
                >
                  <option value="EASY">🎯 Fácil</option>
                  <option value="MEDIUM">⚡ Medio</option>
                  <option value="HARD">🔥 Difícil</option>
                </select>
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">
                  Tema *
                </label>
                <select
                  name="topic"
                  required
                  className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-gray-400 focus:border-transparent outline-none transition-all"
                >
                  <option value="">Seleccione un tema</option>
                  {TOPICS.map((topic) => (
                    <option key={topic.value} value={topic.value}>
                      📚 {topic.label}
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
                  className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-gray-400 focus:border-transparent outline-none transition-all font-mono text-sm"
                />
              </div>

              {formError && (
                <div className="p-3 bg-red-50 border border-red-200 rounded-lg">
                  <p className="text-red-600 text-sm">{formError}</p>
                </div>
              )}

              <div className="flex gap-3 pt-4">
                <button
                  type="button"
                  onClick={() => setIsCreateModalOpen(false)}
                  className="flex-1 px-4 py-2 border border-gray-300 text-gray-700 text-sm font-medium rounded-lg hover:bg-gray-50 transition-colors"
                >
                  Cancelar
                </button>
                <button
                  type="submit"
                  disabled={isSubmitting}
                  className="flex-1 px-4 py-2 bg-gray-900 hover:bg-gray-800 text-white text-sm font-medium rounded-lg transition-colors disabled:opacity-50 disabled:cursor-not-allowed"
                >
                  {isSubmitting ? "Creando..." : "Crear Ejercicio"}
                </button>
              </div>
            </form>
          </div>
        </div>
      )}

      {/* Modal para editar ejercicio - mismo estilo mejorado */}
      {isEditModalOpen && selectedExercise && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 p-4">
          <div className="bg-white rounded-xl shadow-xl w-full max-w-md max-h-[90vh] overflow-y-auto">
            <div className="sticky top-0 bg-white flex justify-between items-center p-6 border-b border-gray-200">
              <h2 className="text-xl font-semibold text-gray-900">
                ✏️ Editar Ejercicio
              </h2>
              <button
                onClick={() => {
                  setIsEditModalOpen(false)
                  setSelectedExercise(null)
                }}
                className="text-gray-400 hover:text-gray-600 transition-colors text-xl"
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
                  className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-gray-400 focus:border-transparent outline-none transition-all"
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
                  className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-gray-400 focus:border-transparent outline-none transition-all"
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
                  className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-gray-400 focus:border-transparent outline-none transition-all"
                >
                  <option value="EASY">🎯 Fácil</option>
                  <option value="MEDIUM">⚡ Medio</option>
                  <option value="HARD">🔥 Difícil</option>
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
                  className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-gray-400 focus:border-transparent outline-none transition-all"
                >
                  <option value="">Seleccione un tema</option>
                  {TOPICS.map((topic) => (
                    <option key={topic.value} value={topic.value}>
                      📚 {topic.label}
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
                  className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-gray-400 focus:border-transparent outline-none transition-all font-mono text-sm"
                />
              </div>

              {formError && (
                <div className="p-3 bg-red-50 border border-red-200 rounded-lg">
                  <p className="text-red-600 text-sm">{formError}</p>
                </div>
              )}

              <div className="flex gap-3 pt-4">
                <button
                  type="button"
                  onClick={() => {
                    setIsEditModalOpen(false)
                    setSelectedExercise(null)
                  }}
                  className="flex-1 px-4 py-2 border border-gray-300 text-gray-700 text-sm font-medium rounded-lg hover:bg-gray-50 transition-colors"
                >
                  Cancelar
                </button>
                <button
                  type="submit"
                  disabled={isSubmitting}
                  className="flex-1 px-4 py-2 bg-gray-900 hover:bg-gray-800 text-white text-sm font-medium rounded-lg transition-colors disabled:opacity-50 disabled:cursor-not-allowed"
                >
                  {isSubmitting ? "Actualizando..." : "Actualizar Ejercicio"}
                </button>
              </div>
            </form>
          </div>
        </div>
      )}

      {/* Modal para practicar ejercicio - con mejor estilo */}
      {isPracticeModalOpen && selectedExercise && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 p-4">
          <div className="bg-white rounded-xl shadow-xl w-full max-w-2xl max-h-[90vh] overflow-y-auto">
            <div className="sticky top-0 bg-white flex justify-between items-center p-6 border-b border-gray-200">
              <h2 className="text-xl font-semibold text-gray-900">
                🚀 Practicar: {selectedExercise.title}
              </h2>
              <button
                onClick={() => {
                  setIsPracticeModalOpen(false)
                  setSelectedExercise(null)
                  setAttemptResult(null)
                  setUserSql("")
                }}
                className="text-gray-400 hover:text-gray-600 transition-colors text-xl"
              >
                ✕
              </button>
            </div>

            <form onSubmit={handlePracticeSubmit} className="p-6 space-y-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  📝 Descripción del ejercicio
                </label>
                <div className="bg-gradient-to-r from-gray-50 to-gray-100 p-4 rounded-xl border border-gray-200">
                  <p className="text-gray-700 leading-relaxed">{selectedExercise.description}</p>
                </div>
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  💻 Tu consulta SQL
                </label>
                <textarea
                  value={userSql}
                  onChange={(e) => setUserSql(e.target.value)}
                  rows={6}
                  required
                  placeholder="Ej: SELECT * FROM usuarios WHERE id = 1"
                  className="w-full px-4 py-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-gray-400 focus:border-transparent outline-none transition-all font-mono text-sm"
                />
              </div>

              {attemptResult && (
                <div className={`p-4 rounded-xl border-2 ${attemptResult.isCorrect ? "bg-green-50 border-green-200" : "bg-red-50 border-red-200"} animate-fadeIn`}>
                  <div className="flex items-center gap-2 mb-2">
                    <span className={`text-sm font-bold ${attemptResult.isCorrect ? "text-green-700" : "text-red-700"}`}>
                      {attemptResult.isCorrect ? "✅ ¡Correcto!" : "❌ Incorrecto"}
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
                  className="flex-1 px-4 py-2 border border-gray-300 text-gray-700 text-sm font-medium rounded-xl hover:bg-gray-50 transition-colors"
                >
                  Cancelar
                </button>
                <button
                  type="submit"
                  disabled={isChecking}
                  className="flex-1 px-4 py-2 bg-gray-900 hover:bg-gray-800 text-white text-sm font-medium rounded-xl transition-colors disabled:opacity-50 disabled:cursor-not-allowed shadow-sm hover:shadow-md"
                >
                  {isChecking ? "Verificando..." : "🔍 Verificar SQL"}
                </button>
              </div>
            </form>
          </div>
        </div>
      )}
    </div>
  )
}

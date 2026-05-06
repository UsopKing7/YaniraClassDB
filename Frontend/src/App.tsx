import { Route, Routes } from "react-router-dom"
import { Login } from "./pages/Login"
import { Register } from "./pages/Register"
import { Ejercicios } from "./pages/Ejercicios"
import { useState, useEffect } from "react"

export const App = () => {
  const [user, setUser] = useState<{ role?: string; id_user?: string; email?: string } | null>(null)

  // Cargar usuario desde localStorage al iniciar la app
  useEffect(() => {
    const storedUser = localStorage.getItem("user")
    if (storedUser) {
      setUser(JSON.parse(storedUser))
    }
  }, [])

  // Guardar usuario en localStorage cuando cambie
  const handleSetUser = (userData: any) => {
    setUser(userData)
    if (userData) {
      localStorage.setItem("user", JSON.stringify(userData))
    } else {
      localStorage.removeItem("user")
    }
  }

  return (
    <div className="min-h-screen bg-gray-50">
      <Routes>
        <Route path="/" element={<Login setUser={handleSetUser} />} />
        <Route path="/register" element={<Register />} />
        <Route path="/ejercicios" element={<Ejercicios user={user} />} />
      </Routes>
    </div>
  )
}

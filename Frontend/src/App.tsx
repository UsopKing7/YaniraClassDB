import { Route, Routes } from "react-router-dom"
import { Toaster } from "react-hot-toast"
import { Login } from "./pages/Login"
import { Register } from "./pages/Register"
import { Ejercicios } from "./pages/Ejercicios"
import { AdminUsers } from "./pages/AdminUsers"
import { useState, useEffect } from "react"

export const App = () => {
  const [user, setUser] = useState<{ role?: string; id_user?: string; email?: string } | null>(null)

  const storedUser = localStorage.getItem("user")
  const initialUser = storedUser ? JSON.parse(storedUser) : null

  // Cargar usuario desde localStorage al iniciar la app
  useEffect(() => {
    if (!user && initialUser) {
      setUser(initialUser)
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
      <Toaster
        position="top-right"
        toastOptions={{
          duration: 5000,
          style: {
            borderRadius: "12px",
            padding: "16px",
            fontSize: "14px",
            fontWeight: 600,
          },
        }}
      />
      <Routes>
        <Route path="/" element={<Login setUser={handleSetUser} />} />
        <Route path="/register" element={<Register />} />
        <Route path="/ejercicios" element={<Ejercicios user={user ?? undefined} />} />
        <Route path="/admin/users" element={<AdminUsers />} />
      </Routes>
    </div>
  )
}

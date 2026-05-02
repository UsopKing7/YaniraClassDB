import { Route, Routes } from "react-router-dom"
import { Login } from "./pages/Login"
import { Register } from "./pages/Register"
import { Ejercicios } from "./pages/Ejercicios"

export const App = () => {
  return (
    <div className="p-4">
      <Routes>
        <Route path="/" element={<Login />} />
        <Route path="/register" element={<Register />} />
        <Route path="/ejercicios" element={<Ejercicios />} />
      </Routes>

    </div>
  )
}


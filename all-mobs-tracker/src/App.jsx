import { BrowserRouter, Routes, Route } from 'react-router-dom'
import { Analytics } from "@vercel/analytics/react"
import { lazy, Suspense } from 'react'
import MobTracker from './pages/MobTracker'

const About              = lazy(() => import('./pages/About'))
const FAQ                = lazy(() => import('./pages/FAQ'))
const WhoAmI             = lazy(() => import('./pages/WhoAmI'))
const CategoryPage       = lazy(() => import('./pages/categories/CategoryPage'))
const SpecialCategoryPage = lazy(() => import('./pages/categories/SpecialCategoryPage'))
const MobPage            = lazy(() => import('./pages/mobs/MobPage'))

import './index.css'

const PageLoader = () => (
  <div className="min-h-screen bg-[#111] flex items-center justify-center">
    <div className="flex flex-col items-center gap-4">
      <div className="w-12 h-12 border-4 border-stone-700 border-t-amber-400 rounded-full animate-spin" />
      <p className="text-stone-500 uppercase text-sm tracking-widest">Loading…</p>
    </div>
  </div>
)

function App() {
  return (
    <BrowserRouter>
      <Suspense fallback={<PageLoader />}>
        <Routes>
          <Route path="/" element={<MobTracker />} />
          <Route path="/about" element={<About />} />
          <Route path="/faq" element={<FAQ />} />
          <Route path="/whoami" element={<WhoAmI />} />

          <Route path="/categories/:id" element={<CategoryPage />} />
          <Route path="/:slug" element={<SpecialCategoryPage />} />

          <Route path="/mobs/:slug" element={<MobPage />} />
        </Routes>
      </Suspense>
      <Analytics />
    </BrowserRouter>
  )
}

export default App
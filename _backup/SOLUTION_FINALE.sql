-- =========================================================
-- SOLUTION FINALE CORRIGÉE (Sans erreur)
-- =========================================================

-- 1. DÉSACTIVER RLS (La Sécurité)
ALTER TABLE beats DISABLE ROW LEVEL SECURITY;

-- 2. DONNER TOUS LES DROITS (Temporairement)
GRANT ALL ON beats TO anon;
GRANT ALL ON beats TO authenticated;
GRANT ALL ON beats TO service_role;

-- 3. Vérifier que c'est fait
SELECT tablename, rowsecurity FROM pg_tables WHERE tablename = 'beats';

-- Si 'rowsecurity' est 'false', C'EST GAGNÉ !

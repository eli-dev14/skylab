-- =========================================================
-- SCRIPT DE RÉPARATION ULTIME DES POLITIQUES (RLS)
-- =========================================================

-- 1. Désactiver temporairement la sécurité pour nettoyer
ALTER TABLE beats DISABLE ROW LEVEL SECURITY;

-- 2. Supprimer TOUTES les politiques connues (nettoyage)
DROP POLICY IF EXISTS "Public can view active beats" ON beats;
DROP POLICY IF EXISTS "Authenticated users can insert beats" ON beats;
DROP POLICY IF EXISTS "Authenticated users can update beats" ON beats;
DROP POLICY IF EXISTS "Authenticated users can delete beats" ON beats;
DROP POLICY IF EXISTS "Public Read Access" ON beats;
DROP POLICY IF EXISTS "Auth Insert Access" ON beats;
DROP POLICY IF EXISTS "Auth Update Access" ON beats;
DROP POLICY IF EXISTS "Auth Delete Access" ON beats;
DROP POLICY IF EXISTS "Enable read access for all users" ON beats;
DROP POLICY IF EXISTS "Enable insert for authenticated users only" ON beats;
DROP POLICY IF EXISTS "Enable update for authenticated users only" ON beats;
DROP POLICY IF EXISTS "Enable delete for authenticated users only" ON beats;

-- 3. Réactiver la sécurité
ALTER TABLE beats ENABLE ROW LEVEL SECURITY;

-- 4. Créer les nouvelles politiques (SIMPLE et EFFICACE)

-- A. Lecture pour TOUT LE MONDE (Public)
CREATE POLICY "Public Read Access"
ON beats FOR SELECT
USING (true);

-- B. Ajout pour les ADMINS (Authentifiés)
CREATE POLICY "Admin Insert Access"
ON beats FOR INSERT
TO authenticated
WITH CHECK (true);

-- C. Modification pour les ADMINS (Authentifiés)
CREATE POLICY "Admin Update Access"
ON beats FOR UPDATE
TO authenticated
USING (true);

-- D. Suppression pour les ADMINS (Authentifiés)
CREATE POLICY "Admin Delete Access"
ON beats FOR DELETE
TO authenticated
USING (true);

-- =========================================================
-- FIN DU SCRIPT - Si vous voyez "Success", c'est bon !
-- =========================================================

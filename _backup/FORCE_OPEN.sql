-- =========================================================
-- FORCE OPEN - OUVRIR TOUTES LES PORTES
-- =========================================================

-- 1. On s'assure que le système de sécurité est activé (pour pouvoir mettre nos règles)
ALTER TABLE beats ENABLE ROW LEVEL SECURITY;

-- 2. On supprime une éventuelle ancienne politique qui bloquerait
DROP POLICY IF EXISTS "Policy_Allow_All" ON beats;
DROP POLICY IF EXISTS "Public Read Access" ON beats;
DROP POLICY IF EXISTS "Admin Insert Access" ON beats;
DROP POLICY IF EXISTS "Admin Update Access" ON beats;
DROP POLICY IF EXISTS "Admin Delete Access" ON beats;
DROP POLICY IF EXISTS "Authenticated users can insert beats" ON beats;
-- (On nettoie un peu tout ce qui pourrait traîner)

-- 3. CRÉATION DE LA POLITIQUE "PORTES GRANDES OUVERTES"
-- Cette règle dit : "Tout le monde (public) peut TOUT faire (ALL) sur la table beats"
CREATE POLICY "Policy_Allow_All"
ON beats
FOR ALL
TO public
USING (true)
WITH CHECK (true);

-- 4. VÉRIFICATION
SELECT * FROM pg_policies WHERE tablename = 'beats';

-- Si vous voyez "Policy_Allow_All" dans les résultats, c'est bon !

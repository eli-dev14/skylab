-- Corriger la politique d'insertion pour la table beats
-- 1. Supprimer l'ancienne politique (au cas où)
DROP POLICY IF EXISTS "Authenticated users can insert beats" ON beats;

-- 2. Créer une nouvelle politique plus permissive pour les utilisateurs authentifiés
CREATE POLICY "Authenticated users can insert beats"
ON beats FOR INSERT
TO authenticated
WITH CHECK (auth.role() = 'authenticated');

-- 3. Vérifier aussi la modification (UPDATE)
DROP POLICY IF EXISTS "Authenticated users can update beats" ON beats;

CREATE POLICY "Authenticated users can update beats"
ON beats FOR UPDATE
TO authenticated
USING (auth.role() = 'authenticated');

-- 4. Vérifier la suppression (DELETE)
DROP POLICY IF EXISTS "Authenticated users can delete beats" ON beats;

CREATE POLICY "Authenticated users can delete beats"
ON beats FOR DELETE
TO authenticated
USING (auth.role() = 'authenticated');

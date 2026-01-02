-- =========================================================
-- RÉPARATION DES DROITS DE STOCKAGE (STORAGE)
-- =========================================================

-- 1. S'assurer que les "buckets" existent et sont publics
INSERT INTO storage.buckets (id, name, public) 
VALUES ('beat-covers', 'beat-covers', true) 
ON CONFLICT (id) DO UPDATE SET public = true;

INSERT INTO storage.buckets (id, name, public) 
VALUES ('beat-audio', 'beat-audio', true) 
ON CONFLICT (id) DO UPDATE SET public = true;

-- 2. Supprimer les anciennes règles de stockage qui pourraient bloquer
DROP POLICY IF EXISTS "Public Access Covers" ON storage.objects;
DROP POLICY IF EXISTS "Public Access Audio" ON storage.objects;
DROP POLICY IF EXISTS "Auth Upload Covers" ON storage.objects;
DROP POLICY IF EXISTS "Auth Upload Audio" ON storage.objects;
DROP POLICY IF EXISTS "Allow All Storage" ON storage.objects;

-- 3. CRÉER UNE RÈGLE UNIVERSELLE POUR LE STOCKAGE
-- Autorise TOUT le monde à lire/écrire dans nos deux buckets
CREATE POLICY "Allow All Storage"
ON storage.objects FOR ALL
TO public
USING (bucket_id IN ('beat-covers', 'beat-audio'))
WITH CHECK (bucket_id IN ('beat-covers', 'beat-audio'));

-- 4. Vérification
SELECT name, public FROM storage.buckets WHERE id IN ('beat-covers', 'beat-audio');

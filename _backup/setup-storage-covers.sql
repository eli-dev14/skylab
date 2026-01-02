-- ========================================
-- POLITIQUES DE STORAGE POUR BEAT-COVERS
-- ========================================
-- Copiez et collez ces 3 politiques pour le bucket "beat-covers"

-- Policy 1 : Lecture publique
CREATE POLICY "Public Access"
ON storage.objects FOR SELECT
USING ( bucket_id = 'beat-covers' );

-- Policy 2 : Upload pour utilisateurs authentifiés
CREATE POLICY "Authenticated users can upload"
ON storage.objects FOR INSERT
TO authenticated
WITH CHECK ( bucket_id = 'beat-covers' );

-- Policy 3 : Suppression pour utilisateurs authentifiés
CREATE POLICY "Authenticated users can delete"
ON storage.objects FOR DELETE
TO authenticated
USING ( bucket_id = 'beat-covers' );

-- ========================================
-- SCRIPT SQL POUR SUPABASE - SKYLAB BEATS
-- ========================================
-- Copiez et collez ce script complet dans le SQL Editor de Supabase

-- 1. Créer la table beats
CREATE TABLE beats (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    title TEXT NOT NULL,
    author TEXT,
    genre TEXT,
    bpm INTEGER,
    cover_url TEXT NOT NULL,
    audio_url TEXT NOT NULL,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 2. Créer des index pour améliorer les performances
CREATE INDEX idx_beats_created_at ON beats(created_at DESC);
CREATE INDEX idx_beats_is_active ON beats(is_active);

-- 3. Activer Row Level Security (RLS)
ALTER TABLE beats ENABLE ROW LEVEL SECURITY;

-- 4. Policy : Tout le monde peut lire les beats actifs
CREATE POLICY "Public can view active beats"
ON beats FOR SELECT
USING (is_active = true);

-- 5. Policy : Seuls les utilisateurs authentifiés peuvent insérer
CREATE POLICY "Authenticated users can insert beats"
ON beats FOR INSERT
TO authenticated
WITH CHECK (true);

-- 6. Policy : Seuls les utilisateurs authentifiés peuvent modifier
CREATE POLICY "Authenticated users can update beats"
ON beats FOR UPDATE
TO authenticated
USING (true);

-- 7. Policy : Seuls les utilisateurs authentifiés peuvent supprimer
CREATE POLICY "Authenticated users can delete beats"
ON beats FOR DELETE
TO authenticated
USING (true);

-- ========================================
-- FIN DU SCRIPT
-- ========================================
-- Après avoir exécuté ce script, allez dans "Table Editor" 
-- pour vérifier que la table "beats" a été créée correctement.

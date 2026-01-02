-- =========================================================
-- SOLUTION RADICALE : DÉSACTIVER LA SÉCURITÉ TEMPORAIREMENT
-- =========================================================

-- Cette commande désactive complètement la vérification des règles de sécurité.
-- Si ça ne marche pas après ça, le problème n'est PAS la sécurité.

ALTER TABLE beats DISABLE ROW LEVEL SECURITY;

-- C'est tout. Exécutez juste cette ligne.

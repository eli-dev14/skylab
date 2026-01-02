-- =========================================================
-- VÉRIFICATION DES POLITIQUES (Espionnage)
-- =========================================================

-- Cette requête va nous dire EXACTEMENT quelles règles sont actives.
SELECT 
    schemaname,
    tablename,
    policyname,
    permissive,
    roles,
    cmd,
    qual,
    with_check
FROM 
    pg_policies 
WHERE 
    tablename = 'beats';

-- Exécutez et envoyez-moi une capture d'écran ou le texte du résultat !

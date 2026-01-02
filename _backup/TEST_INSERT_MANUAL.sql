-- =========================================================
-- TEST MANUEL D'INSERTION
-- =========================================================

-- On essaie d'insérer une ligne manuellement pour voir si la base la rejette.

INSERT INTO beats (title, author, genre, bpm, cover_url, audio_url)
VALUES (
  'TEST BEAT MANUEL', 
  'TEST AUTHOR', 
  'TEST GENRE', 
  120, 
  'https://placehold.co/600x600', 
  'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3'
);

-- Si vous voyez "Success" ou "Inserted 1 row", c'est que la base marche !
-- Si vous voir une erreur ici, copiez-la moi.

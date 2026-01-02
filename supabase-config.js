// ========================================
// CONFIGURATION SUPABASE
// ========================================
// ⚠️ REMPLACE CES VALEURS PAR LES TIENNES ⚠️

const SUPABASE_CONFIG = {
    url: 'https://hsrmxdtqqclrqlwvvjuh.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imhzcm14ZHRxcWNscnFsd3Z2anVoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjczNDg4NTQsImV4cCI6MjA4MjkyNDg1NH0.60g-JNlS7Ysi-eNL8um9lKyauZYyhi4xqW0S6zxgvv0',
    whatsappNumber: '22897275798'
};

// Initialiser le client Supabase
const supabase = window.supabase.createClient(
    SUPABASE_CONFIG.url, 
    SUPABASE_CONFIG.anonKey
);

// Export pour utilisation dans d'autres fichiers
window.SUPABASE_CONFIG = SUPABASE_CONFIG;
window.supabase = supabase;

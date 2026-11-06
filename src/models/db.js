
import { Pool } from 'pg';

/**
 * Get the database connection string from environment variables.
 */
const dbUrl = process.env.DB_URL || process.env.DATABASE_URL;

/**
 * Safe connection diagnostics.
 * Never logs the username, password, or complete connection string.
 */
console.log('Database URL available:', Boolean(dbUrl));

if (dbUrl) {
    try {
        console.log('Database host:', new URL(dbUrl).hostname);
    } catch {
        console.error('Database URL format: invalid');
    }
} else {
    console.error('Database URL is missing. Check Render environment variables.');
}

/**
 * Connection pool for PostgreSQL database.
 */
const pool = new Pool({
   connectionString: process.env.DB_URL,
        ssl: false
    
});

/**
 * Database query wrapper for development logging.
 */
let db = null;

if (
    process.env.NODE_ENV === 'development' &&
    process.env.ENABLE_SQL_LOGGING === 'true'
) {
    db = {
        async query(text, params) {
            try {
                const start = Date.now();
                const res = await pool.query(text, params);
                const duration = Date.now() - start;

                console.log('Executed query:', {
                    text: text.replace(/\s+/g, ' ').trim(),
                    duration: `${duration}ms`,
                    rows: res.rowCount
                });

                return res;
            } catch (error) {
                console.error('Error in query:', {
                    text: text.replace(/\s+/g, ' ').trim(),
                    error: error.message
                });

                throw error;
            }
        },

        async close() {
            await pool.end();
        }
    };
} else {
    db = pool;
}

/**
 * Tests the database connection.
 */
const testConnection = async () => {
    try {
        const result = await db.query('SELECT NOW() as current_time');

        console.log(
            'Database connection successful:',
            result.rows[0].current_time
        );

        return true;
    } catch (error) {
        console.error('Database connection failed:', error.message);
        throw error;
    }
};

export { db as default, testConnection };

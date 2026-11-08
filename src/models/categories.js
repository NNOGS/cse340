import db from './db.js';

const getAllCategories = async () => {
    const query = `
     SELECT category_id, name
        FROM public.categories
        ORDER BY category_id;
    `;

    const result = await db.query(query);

    return result.rows;
};

export { getAllCategories };